# Administração

## Sistema

Configuração global do sistema. Nesta seção é possível reiniciar todas as senhas (movendo-as para o histórico) e/ou apagar todos os dados de atendimento para um novo início do sistema.

## Unidades

Cadastro das unidade de atendimento do sistema. Unidade de atendimento é o local físico aonde os atendimentos são executados. Por exemplo: Uma unidade de saúde, um departamento de atendimento ao cliente, ou uma localidade.

## Serviços

Cadastro dos serviços que são realizados no sistema. O serviço é um cadastro global, podendo estar disponível ou não nas unidades cadastradas. Um mesmo serviço pode ser atendido em mais de uma unidade.

## Perfis

Cadastro dos perfis de acesso ao sistema. Um perfil define quais módulos os usuários poderão acessar. O relacionamento do perfil com o usuário se dar através da `lotação`, que é a configuração de acesso de um usuário à uma `unidade` pelo `perfil` escolhido.

## Prioridades

Cadastro das prioridades de atendimento. Por padrão existem duas prioridades cadastradas: `Sem prioridade` e `Prioridade`. A prioridade possui um campo de `peso` que influencia na ordem da fila. Sendo por padrão `Sem prioridade` peso `0` e `Prioridade` peso `1`.

## Locais

Cadastro dos locais aonde o atendente realiza o seu atendimento. O local serve para orientar o cliente para que ele saiba para onde se dirigir quando for chamado. Por exemplo: Guichê, sala, mesa.

## Módulos

Visualização dos módulos disponíveis. É possível habilitar e desabilitar os módulos instalados.

## Web API

Cadastro dos clientes `OAuth2` para integração com outras aplicações via API web do sistema.
