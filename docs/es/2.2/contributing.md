# Guía de contribución

Hay varias formas de contribuir a NovoSGA:

## Reportando problemas

- Acceda a la sección de Issues del repositorio.
- Verifique si el problema ya ha sido reportado para evitar la duplicación.
- Proporcione la mayor cantidad de información posible sobre el problema, incluyendo:
    - Versión de NovoSGA
    - Sistema operativo y versión de PHP
    - Pasos para reproducir el problema
    - Registros y capturas de pantalla, si es posible


## Sugerencias de mejoras y características

Si tiene ideas para nuevas características o mejoras, abra un Issue de sugerencia con una descripción detallada. Discuta su idea con la comunidad para alinearla antes de comenzar el desarrollo.


## Respondiendo preguntas

Ayude a otros usuarios respondiendo preguntas sobre el uso o la instalación del sistema.

- [Foro de discusión](https://discuss.novosga.org/)
- [Grupo de Telegram](https://t.me/novosga)

## Documentación

¿Echó de menos alguna información importante del sistema o una falta de claridad en la documentación de NovoSGA? Ayude a que nuestra documentación sea más clara y completa.

Al final de cada página hay un enlace para editarla. Si desea solicitar una nueva sección, simplemente abra una nueva Pull Request para el repositorio a continuación:

https://github.com/novosga/novosga.github.io/

Toda la documentación se encuentra en la ruta `/docs`.


## Desarrollo

### Requisitos previos

Para comenzar, asegúrese de tener los siguientes requisitos previos:

- **Git**: para el control de versiones
- **Composer**: para gestionar las dependencias de PHP
- **PHP**: verifique la versión definida en el archivo `composer.json`

### Proceso de contribución

#### 1. Bifurcar el repositorio

Haga clic en "Fork" en la página de [NovoSGA](https://github.com/novosga/novosga) para crear una copia del repositorio en su cuenta de GitHub.

#### 2. Clonar el repositorio bifurcado

Clone el repositorio en su máquina local con el siguiente comando:

```bash
git clone https://github.com/su-usuario/novosga.git
cd novosga
```

#### 3. Crear una rama

Use ramas para cada cambio o mejora. El nombre de la rama debe ser descriptivo de lo que se está haciendo:

```bash
git checkout -b mi-contribucion
```

#### 4. Instalar dependencias

Asegúrese de que todas las dependencias estén instaladas.

```bash
composer install
```

#### 5. Implementar los cambios

Realice los cambios necesarios en el código y escriba pruebas que cubran las características agregadas o los errores corregidos. Asegúrese de que el código esté limpio, documentado y siga las prácticas de código limpio.

#### 6. Ejecutar pruebas y análisis de código

Antes de enviar sus cambios, ejecute todas las pruebas para asegurarse de que todo funcione correctamente.

```bash
./vendor/bin/phpunit
./vendor/bin/phpcs
./vendor/bin/phpstan --memory-limit=1g
```

#### 7. Confirmar los cambios

Escriba mensajes de confirmación claros y concisos. Use el siguiente patrón para los mensajes de confirmación:

- `feat:` Para nuevas características
- `fix:` Para correcciones de errores
- `docs:` Para cambios en la documentación
- `style:` Ajustes de formato y estilo
- `refactor:` Refactorización de código
- `test:` Adición o modificación de pruebas

```bash
git commit -m "fix: error corregido en la autenticación de usuarios"
```

#### 8. Enviar sus cambios

Envíe sus cambios a su repositorio de GitHub:

```bash
git push origin mi-contribucion
```

#### 9. Crear una Pull Request

En GitHub, vaya a su repositorio bifurcado y haga clic en Nueva Pull Request. Describa claramente el cambio e incluya referencias a cualquier issue relacionado.

> Ejemplo de descripción: "Este PR resuelve el problema #123 e implementa la funcionalidad de inicio de sesión a través de la autenticación OAuth.

### Estándares de código

Para mantener un código coherente, siga estos estándares de estilo:

- Use PSR-12 como estándar para el formato de PHP.
- Nombre las variables y los métodos de forma clara y descriptiva.
- Evite la duplicación de código.
- Agregue documentación para clases, métodos y funciones complejas.

### Revisión de Pull Request

Los mantenedores de NovoSGA revisarán su Pull Request y podrán sugerir cambios. Recuerde:

- Sea receptivo a los comentarios.
- Esté dispuesto a discutir su implementación.
