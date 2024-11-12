# Guia de contribuição

Há várias formas de contribuir para o NovoSGA:

## Reportando Problemas

- Acesse a seção Issues do repositório.
- Verifique se o problema já foi reportado para evitar duplicidade.
- Forneça o máximo de informações possível sobre o problema, incluindo:
    - Versão do NovoSGA
    - Sistema operacional e versão do PHP
    - Passos para reproduzir o problema
    - Logs e screenshots, se possível


## Sugestões de Melhorias e Funcionalidades

Se você tiver ideias para novas funcionalidades ou melhorias, abra uma Issue de sugestão com uma descrição detalhada. Discuta sua ideia com a comunidade para alinhamento antes de iniciar o desenvolvimento.


## Respondendo dúvidas

Ajude outros usuários respondendo dúvidas de uso ou sobre instalação do sistema.

- [Fórum de discussão](https://discuss.novosga.org/)
- [Grupo do Telegram](https://t.me/novosga)

## Documentação

Sentiu falta de alguma informação importante do sistema, ou uma falta de clareza na documentação do Novo SGA? Ajude a tornar nossa documentação mais clara e abrangente.

Ao final de cada página há um link para realizar a edição da mesma. Caso deseja solicitar uma nova seção, basta abrir um novo Pull Request para o repositório abaixo:

https://github.com/novosga/novosga.github.io/

Toda documentação fica no caminho `/docs`.


## Desenvolvimento

### Pré-requisitos

Para começar, verifique se você possui os seguintes pré-requisitos:

- **Git**: para controle de versão
- **Composer**: para gerenciar dependências PHP
- **PHP**: verifique a versão definida no arquivo `composer.json`

### Processo de Contribuição

#### 1. Crie o fork do repositório

Clique em "Fork" na página do [NovoSGA](https://github.com/novosga/novosga) para criar uma cópia do repositório em sua conta do GitHub.

#### 2. Clone o repositório Forkado

Clone o repositório para sua máquina local usando o seguinte comando:

```bash
git clone https://github.com/seu-usuario/novosga.git
cd novosga
```

#### 3. Crie um branch

Use branches para cada alteração ou melhoria. O nome do branch deve ser descritivo para o que está sendo feito:

```bash
git checkout -b minha-contribuicao
```

#### 4. Instale dependências

Certifique-se de que todas as dependências estão instaladas.

```bash
composer install
```

#### 5. Implemente as alterações

Faça as alterações necessárias no código e escreva testes que cubram as funcionalidades adicionadas ou os bugs corrigidos. Certifique-se de que o código esteja limpo, documentado e que siga as práticas de clean code.

#### 6. Execute os testes e análises do código

Antes de enviar suas alterações, execute todos os testes para garantir que tudo esteja funcionando corretamente.

```bash
./vendor/bin/phpunit
./vendor/bin/phpcs
./vendor/bin/phpstan --memory-limit=1g
```

#### 7. Faça o commit das mudanças

Escreva mensagens de commit claras e concisas. Use o seguinte padrão para mensagens de commit:

- `feat:` Para novas funcionalidades
- `fix:` Para correção de bugs
- `docs:` Para mudanças na documentação
- `style:` Ajustes de formatação e estilo
- `refactor:` Refatoração de código
- `test:` Adição ou modificação de testes

```bash
git commit -m "fix: corrigido bug na autenticação de usuários"
```

#### 8. Envie suas alterações

Envie suas alterações para seu repositório GitHub:

```bash
git push origin minha-contribuicao
```

#### 9. Crie um Pull Request

No GitHub, vá até o seu repositório forkado e clique em New Pull Request. Descreva claramente a mudança e inclua referências a quaisquer issues relacionadas.

> Exemplo de descrição: "Este PR resolve o problema #123 e implementa a funcionalidade de login via autenticação OAuth.

### Normas de código

Para manter um código consistente, siga estas normas de estilo:

- Use PSR-12 como padrão para formatação do PHP.
- Nomeie variáveis e métodos de forma clara e descritiva.
- Evite duplicação de código.
- Adicione documentação para classes, métodos e funções complexas.

### Revisão de Pull Request

Os mantenedores do NovoSGA revisarão seu Pull Request e poderão sugerir mudanças. Lembre-se:

- Seja receptivo ao feedback.
- Esteja disposto a discutir sua implementação.
