#!/usr/bin/env bash
#
# NovoSGA 2.3 - Docker Compose installer
#
# Automates: https://novosga.org/docs/#/2.3/install-docker?id=docker-compose
#
# Usage:
#   curl -fsSL https://novosga.org/scripts/install-docker-2.3.sh | bash
#   wget -qO- https://novosga.org/scripts/install-docker-2.3.sh | bash
#   bash scripts/install-docker-2.3.sh   (local)
#
# NOTE: must be run with bash (not POSIX sh) — uses `read -s`/`read -p`,
# which dash and other /bin/sh implementations don't support.

set -euo pipefail

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

prompt_default() {
    local __var="$1" __question="$2" __default="$3" __value
    read -rp "$__question [$__default]: " __value
    printf -v "$__var" '%s' "${__value:-$__default}"
}

prompt_secret() {
    local __var="$1" __question="$2" __value
    read -rsp "$__question (leave blank to auto-generate): " __value
    echo
    printf -v "$__var" '%s' "$__value"
}

random_alnum() {
    local len="$1"
    # `head -c` closes the pipe once it has enough bytes, which sends `tr`
    # a SIGPIPE (exit 141); with `pipefail` that would otherwise abort the
    # script even though the output we captured is correct, so swallow it.
    { tr -dc 'A-Za-z0-9' < /dev/urandom | head -c "$len"; } || true
}

random_hex() {
    local len="$1"
    if command -v openssl >/dev/null 2>&1; then
        openssl rand -hex "$len"
    else
        random_alnum "$((len * 2))"
    fi
}

# Escapes a value for embedding inside a single-quoted YAML scalar
# ('' represents a literal ' in YAML single-quoted strings).
yaml_escape() {
    printf '%s' "$1" | sed "s/'/''/g"
}

# Escapes a value for embedding inside a single-quoted SQL string literal.
sql_escape() {
    printf '%s' "$1" | sed "s/'/''/g"
}

detect_public_ip() {
    # Force IPv4 for a clean host:port display URL.
    local ip=""
    ip="$(curl -4 -fsS --max-time 5 https://ifconfig.me 2>/dev/null || true)"
    if [ -z "$ip" ]; then
        ip="$(curl -4 -fsS --max-time 5 https://api.ipify.org 2>/dev/null || true)"
    fi
    printf '%s' "$ip"
}

info()  { printf '\033[1;34m[*]\033[0m %s\n' "$1"; }
ok()    { printf '\033[1;32m[+]\033[0m %s\n' "$1"; }
warn()  { printf '\033[1;33m[!]\033[0m %s\n' "$1"; }
die()   { printf '\033[1;31m[x]\033[0m %s\n' "$1" >&2; exit 1; }

# ---------------------------------------------------------------------------
# Dependency checks
# ---------------------------------------------------------------------------

command -v docker >/dev/null 2>&1 || die "docker is not installed. See https://docs.docker.com/engine/installation/"

if docker compose version >/dev/null 2>&1; then
    COMPOSE=(docker compose)
elif command -v docker-compose >/dev/null 2>&1; then
    COMPOSE=(docker-compose)
else
    die "Neither 'docker compose' nor 'docker-compose' was found. Install Docker Compose first."
fi

command -v curl >/dev/null 2>&1 || die "curl is required by this script."

echo "=============================================="
echo " NovoSGA 2.3 - Docker Compose installer"
echo "=============================================="
echo

# ---------------------------------------------------------------------------
# Wizard
# ---------------------------------------------------------------------------

prompt_default INSTALL_DIR "Install directory" "./novosga"
prompt_default HTTP_PORT "HTTP port to expose the app on" "80"

prompt_default NOVOSGA_ADMIN_USERNAME "Admin username" "admin"
prompt_secret NOVOSGA_ADMIN_PASSWORD "Admin password"
if [ -z "$NOVOSGA_ADMIN_PASSWORD" ]; then
    NOVOSGA_ADMIN_PASSWORD="$(random_alnum 16)"
    ADMIN_PASSWORD_GENERATED=1
else
    ADMIN_PASSWORD_GENERATED=0
fi
prompt_default NOVOSGA_ADMIN_FIRSTNAME "Admin first name" "Administrador"
prompt_default NOVOSGA_ADMIN_LASTNAME "Admin last name" "Global"

prompt_default NOVOSGA_UNITY_NAME "Default unity name" "Minha unidade"
prompt_default NOVOSGA_UNITY_CODE "Default unity code" "U01"

prompt_default NOVOSGA_NOPRIORITY_NAME "No-priority name" "Normal"
prompt_default NOVOSGA_NOPRIORITY_DESCRIPTION "No-priority description" "Atendimento normal"

prompt_default NOVOSGA_PRIORITY_NAME "Priority name" "Prioridade"
prompt_default NOVOSGA_PRIORITY_DESCRIPTION "Priority description" "Atendimento prioritário"

prompt_default NOVOSGA_PLACE_NAME "Default place name" "Guichê"

prompt_default TZ_VALUE "Timezone" "America/Sao_Paulo"
prompt_default APP_LANGUAGE "App language (pt_BR/en/es)" "pt_BR"

prompt_default MYSQL_USER "MySQL app username" "novosga"
prompt_default MYSQL_DATABASE "MySQL database name" "novosga2"

prompt_secret MYSQL_ROOT_PASSWORD "MySQL root password"
if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
    MYSQL_ROOT_PASSWORD="$(random_alnum 24)"
fi

prompt_secret MYSQL_APP_PASSWORD "MySQL app user password"
if [ -z "$MYSQL_APP_PASSWORD" ]; then
    MYSQL_APP_PASSWORD="$(random_alnum 24)"
fi

prompt_secret MERCURE_JWT_SECRET "Mercure JWT secret (used for both MERCURE_JWT_SECRET and MERCURE_PUBLISHER_JWT_KEY)"
if [ -z "$MERCURE_JWT_SECRET" ]; then
    MERCURE_JWT_SECRET="$(random_hex 32)"
fi

info "Detecting public IP address..."
DETECTED_IP="$(detect_public_ip)"
if [ -n "$DETECTED_IP" ]; then
    prompt_default MERCURE_PUBLIC_HOST "Public IP/hostname for Mercure (used by browsers)" "$DETECTED_IP"
else
    warn "Could not auto-detect a public IP."
    read -rp "Public IP/hostname for Mercure (used by browsers), required: " MERCURE_PUBLIC_HOST
    [ -n "$MERCURE_PUBLIC_HOST" ] || die "A public IP/hostname is required."
fi

echo

# ---------------------------------------------------------------------------
# Write docker-compose.yml
# ---------------------------------------------------------------------------

mkdir -p "$INSTALL_DIR"
COMPOSE_FILE="$INSTALL_DIR/docker-compose.yml"

if [ -e "$COMPOSE_FILE" ]; then
    read -rp "$COMPOSE_FILE already exists. Overwrite? [y/N]: " OVERWRITE
    case "$OVERWRITE" in
        y|Y|yes|YES) ;;
        *) die "Aborted: not overwriting existing $COMPOSE_FILE" ;;
    esac
fi

DATABASE_URL="mysql://$(yaml_escape "$MYSQL_USER"):$(yaml_escape "$MYSQL_APP_PASSWORD")@mysqldb:3306/$(yaml_escape "$MYSQL_DATABASE")?charset=utf8mb4&serverVersion=8.4.11"

cat > "$COMPOSE_FILE" <<EOF
services:
  novosga:
    image: novosga/novosga:2.3-standalone
    restart: always
    depends_on:
      - mysqldb
    ports:
      - "${HTTP_PORT}:8080"
    environment:
      APP_ENV: 'prod'
      # database connection
      DATABASE_URL: '${DATABASE_URL}'
      # default admin user
      NOVOSGA_ADMIN_USERNAME: '$(yaml_escape "$NOVOSGA_ADMIN_USERNAME")'
      NOVOSGA_ADMIN_PASSWORD: '$(yaml_escape "$NOVOSGA_ADMIN_PASSWORD")'
      NOVOSGA_ADMIN_FIRSTNAME: '$(yaml_escape "$NOVOSGA_ADMIN_FIRSTNAME")'
      NOVOSGA_ADMIN_LASTNAME: '$(yaml_escape "$NOVOSGA_ADMIN_LASTNAME")'
      # default unity
      NOVOSGA_UNITY_NAME: '$(yaml_escape "$NOVOSGA_UNITY_NAME")'
      NOVOSGA_UNITY_CODE: '$(yaml_escape "$NOVOSGA_UNITY_CODE")'
      # default no-priority
      NOVOSGA_NOPRIORITY_NAME: '$(yaml_escape "$NOVOSGA_NOPRIORITY_NAME")'
      NOVOSGA_NOPRIORITY_DESCRIPTION: '$(yaml_escape "$NOVOSGA_NOPRIORITY_DESCRIPTION")'
      # default priority
      NOVOSGA_PRIORITY_NAME: '$(yaml_escape "$NOVOSGA_PRIORITY_NAME")'
      NOVOSGA_PRIORITY_DESCRIPTION: '$(yaml_escape "$NOVOSGA_PRIORITY_DESCRIPTION")'
      # default place
      NOVOSGA_PLACE_NAME: '$(yaml_escape "$NOVOSGA_PLACE_NAME")'
      # Set TimeZone and locale
      TZ: '$(yaml_escape "$TZ_VALUE")'
      APP_LANGUAGE: '$(yaml_escape "$APP_LANGUAGE")'
      # Mercure JWT keys (must have the same value; Mercure runs in-process)
      # MERCURE_JWT_SECRET: used by the PHP app to publish to Mercure
      # MERCURE_PUBLISHER_JWT_KEY: config key of the embedded Mercure hub
      MERCURE_JWT_SECRET: '$(yaml_escape "$MERCURE_JWT_SECRET")'
      MERCURE_PUBLISHER_JWT_KEY: '$(yaml_escape "$MERCURE_JWT_SECRET")'
      # Mercure address to consume messages (called by the browser)
      MERCURE_PUBLIC_URL: http://${MERCURE_PUBLIC_HOST}:${HTTP_PORT}/.well-known/mercure
  mysqldb:
    image: mysql:8.4.11
    restart: always
    environment:
      MYSQL_USER: '$(yaml_escape "$MYSQL_USER")'
      MYSQL_DATABASE: '$(yaml_escape "$MYSQL_DATABASE")'
      MYSQL_ROOT_PASSWORD: '$(yaml_escape "$MYSQL_ROOT_PASSWORD")'
      MYSQL_PASSWORD: '$(yaml_escape "$MYSQL_APP_PASSWORD")'
      TZ: '$(yaml_escape "$TZ_VALUE")'
EOF

ok "Wrote $COMPOSE_FILE"

# ---------------------------------------------------------------------------
# Save credentials
# ---------------------------------------------------------------------------

CREDS_FILE="$INSTALL_DIR/CREDENTIALS.txt"
cat > "$CREDS_FILE" <<EOF
NovoSGA 2.3 - generated credentials ($(date -u +%Y-%m-%dT%H:%M:%SZ))

App URL:            http://${MERCURE_PUBLIC_HOST}:${HTTP_PORT}
Admin username:      ${NOVOSGA_ADMIN_USERNAME}
Admin password:      ${NOVOSGA_ADMIN_PASSWORD}

MySQL root password: ${MYSQL_ROOT_PASSWORD}
MySQL app user:       ${MYSQL_USER}
MySQL app password:  ${MYSQL_APP_PASSWORD}
MySQL database:      ${MYSQL_DATABASE}

Mercure JWT secret:  ${MERCURE_JWT_SECRET}
Mercure public URL:  http://${MERCURE_PUBLIC_HOST}:${HTTP_PORT}/.well-known/mercure

Keep this file safe and remove it once you've stored these values elsewhere.
EOF
chmod 600 "$CREDS_FILE"
ok "Wrote $CREDS_FILE (chmod 600)"

# ---------------------------------------------------------------------------
# Bring the stack up
# ---------------------------------------------------------------------------

info "Starting containers..."
( cd "$INSTALL_DIR" && "${COMPOSE[@]}" up -d )

# ---------------------------------------------------------------------------
# Grant privileges (mirrors the manual tutorial step)
# ---------------------------------------------------------------------------
#
# The official mysql image briefly runs a temporary bootstrap server (before
# the real one, with the final root password, takes over) while it applies
# the initial config. `mysqladmin ping` happily answers against that
# bootstrap instance, so it's not a reliable readiness signal — instead we
# just retry the actual GRANT command itself until it succeeds or times out.

info "Waiting for MySQL to initialize and granting privileges to '${MYSQL_USER}' on '${MYSQL_DATABASE}'..."

SQL_USER="$(sql_escape "$MYSQL_USER")"
SQL_DB="$(sql_escape "$MYSQL_DATABASE")"
SQL_PASS="$(sql_escape "$MYSQL_APP_PASSWORD")"

GRANT_OK=0
GRANT_OUTPUT=""
for _ in $(seq 1 45); do
    if GRANT_OUTPUT="$( cd "$INSTALL_DIR" && "${COMPOSE[@]}" exec -T mysqldb mysql -uroot -p"$MYSQL_ROOT_PASSWORD" <<SQL 2>&1
ALTER USER '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASS}';
GRANT ALL ON \`${SQL_DB}\`.* TO '${SQL_USER}'@'%';
FLUSH PRIVILEGES;
SQL
    )"; then
        GRANT_OK=1
        break
    fi
    sleep 2
done

if [ "$GRANT_OK" -ne 1 ]; then
    warn "$GRANT_OUTPUT"
    die "Timed out granting privileges. Check: cd $INSTALL_DIR && ${COMPOSE[*]} logs mysqldb"
fi

ok "Privileges granted."

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------

echo
echo "=============================================="
ok "NovoSGA 2.3 is up and running."
echo "=============================================="
echo "  App URL:        http://${MERCURE_PUBLIC_HOST}:${HTTP_PORT}"
echo "  Admin username: ${NOVOSGA_ADMIN_USERNAME}"
if [ "$ADMIN_PASSWORD_GENERATED" -eq 1 ]; then
    echo "  Admin password: ${NOVOSGA_ADMIN_PASSWORD} (auto-generated)"
else
    echo "  Admin password: (as entered)"
fi
echo
echo "  Full credentials saved to: ${CREDS_FILE}"
echo "  Compose file:               ${COMPOSE_FILE}"
echo "=============================================="
