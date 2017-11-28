.. _using:

Usando o Novo SGA
==================

Manual de uso do Novo SGA, tanto para administradores quanto operadores do sistema.

Funcionamento
-------------

Quando um novo cliente chega à unidade de atendimento, ele passa pela triagem para definir qual serviço deseja ser atendido e se é um atendimento prioritário ou não.

Com o novo atendimento gerado, e de posse da senha, o cliente aguarda pela exibição de sua senha no painel. Esse evento (chamar a senha) é invocado pelo atendente que atende o serviço escolhido na triagem.

.. figure:: img/flow.png
    :align: center

    Fluxo de funcionamento do Novo SGA

A senha é formada por um número incremental (único na unidade) prefixada da letra do serviço. No caso do serviço identificado pela letra 'A', a primeira senha gerada na unidade para esse serviço será a senha 'A0001', já a segunda senha gerada (desta vez para o serviço 'B') será 'B0002'.

Caso aconteça um erro na triagem e o serviço definido não for realmente o que o cliente deseja, o próprio atendente pode redirecioná-lo para outro serviço mantendo sua senha com o mesmo número, evitando que o cliente caia no final da fila do novo serviço.

Ao final do atendimento o sistema terá computado a hora de cada estado do atendimento, sendo possível saber: O tempo de deslocamento do cliente até o atendente, o tempo do atendimento, e o tempo total de permanência do cliente na unidade até ser atendido.


Login no sistema
----------------

Abra seu navegador de internet (Mozilla Firefox, Google Chrome, Internet Explorer.. etc) e digite o endereço do site. 

Você será apresentado a tela de login do sistema como mostrado na figura abaixo:

.. figure:: prints/login.png
    :align: center

Para ter acesso ao sistema entre com seu nome de usuário e senha.

Feito o login, e caso a organização possua mais de uma unidade, será solicitado que selecione sua unidade de atendimento:

.. figure:: prints/escolher-unidade.png
    :align: center

Feita a seleção clique no botão enviar para seguir para tela inicial.


Tela Inicial
------------

Após o processo de login ter sido efetuado com sucesso o usuário terá acesso as opções de configuração da unidade de acordo com seu nível de acesso no NovoSGA.

A ferramenta apresenta um módulo de configuração da unidade e um módulo de configuração global. No módulo de configuração da unidade existem as seguintes opções: Triagem, Monitor, Atendimento, Configuração. No decorrer das seções seguintes cada um desses itens será detalhado.


Módulos Locais
--------------

Nos módulos Locais estão os módulos específicos de cada unidade. Estes só estarão visíveis quando o usuário logar em uma unidade, e as configurações afetarão apenas esta
unidade.

.. figure:: prints/menu-unidade.png
    :align: center


Configuração
~~~~~~~~~~~~~

Esse menu possui duas seções, são elas: Serviços e Triagem. Na aba Serviços é possível definir uma Sigla ou Letra Inicial que indicará o tipo de serviço que está sendo atendido, é possível também ativar o atendimento a um serviço, o que significa que será possível gerar as senhas na seção Triagem para tal serviço, como podemos visualizar no menu abaixo:

.. figure:: prints/modulo-unidade.png
    :align: center

.. important::

    A Sigla definida aqui será a letra exibida no Painel de Senhas quando uma senha for chamada. Ex.: C004, D005.

Na Triagem disponível nesse menu é possível ativar a impressão das senhas, incluir uma mensagem customizada para ser impressa abaixo do número da senha, como também, reiniciar a contagem de senhas. Vide figura abaixo.

.. figure:: prints/modulo-unidade-triagem.png
    :align: center

Triagem
~~~~~~~~

Nesse módulo é feita a geração das senhas em cada serviço cadastrado. Ele permite a personalização do atendimento por disponibilizar alguns campos adicionais que possibilitam o acréscimo do nome do usuário e do documento que foi apresentado ao receber a senha, como pode ser visto na figura abaixo.

.. figure:: prints/modulo-triagem.png
    :align: center

.. important::

    São apresentados aqui apenas os serviços que foram habilitados no menu configuração, caso algum outro serviço existente não apareça verifique se o mesmo já está habilitado no menu configuração.

É possível gera senhas normais para atendimento convencional como também senhas especiais para pessoas que precisam de alguma prioridade no atendimento.
Para criar uma senha para atendimento convencional basta apenas clicar no botão “Normal” ou “Prioridade” correspondente, no serviço no qual o usuário deseja atendimento. Se desejado poderá adicionar o nome da pessoa e o documento que foi apresentado antes de gerar a senha. caso a senha gerada tenha sido uma senha especial, na qual é necessário especificar o tipo de prioridade do usuário, será apresentada a janela adicional abaixo. 

.. figure:: prints/modulo-triagem-prioridade.png
    :align: center

Após definir o tipo de prioridade do usuário, basta apenas clicar em “Gerar prioridade”, para que a senha seja gerada.

Após a conclusão da geração da senha é exibida a janela abaixo com as informações da senha gerada:

.. figure:: prints/modulo-triagem-senha.png
    :align: center

Para dispensar a janela, poderá clicar no botão fechar da janela, clicar com o cursor do mouse em qualquer região fora da janela ou ainda apertar a tecla ESC em seu teclado.


Monitor
~~~~~~~

Nesse menu é possível monitorar, alterar ou cancelar as senhas que aguardam atendimento. Vide figura abaixo.

.. figure:: prints/modulo-monitor.png
    :align: center

São exibidas as senhas que aguardam atendimento, para alterá-las ou cancelá-las basta clicar na senha desejada, então será exibida uma janela com as informações da senha. 

Após revisar as informações da senha podemos clicar em “Alterar” ou “Cancelar” de acordo com o que desejamos fazer, como pode ser visto na figura abaixo:

.. figure:: prints/modulo-monitor-senha.png
    :align: center

Caso a senha seja alterada ou transferida para outra fila as mudanças serão imediatas. Caso cancele a senha, esta será automaticamente removida da fila de espera.

.. important::

    O Cancelamento de senhas não pode ser desfeito. Favor revise as informações da senha antes de confirmar o cancelamento para evitar equívocos.


Atendimento
~~~~~~~~~~~

Nessa área é possível informar o número do guichê no qual o atendente irá chamar as senhas, como também definir as filas nas quais operará.

Assim que acessamos esse menu, nos é solicitado o número do guichê no qual realizaremos os atendimentos, como também se atenderemos todas as filas, se somente os atendimentos convencionais ou se também os de prioridade. Como pode ser visto na figura a seguir:

.. figure:: prints/modulo-atendimento.png
    :align: center

Após selecionar suas opções poderá clicar em salvar para ser direcionado a tela principal de atendimento.

Na tela principal de atendimento é possível chamar a próxima senha, alterar o número do guichê entre outras opções que ficam disponíveis apenas após chamar uma senha, como exibido na figura a seguir:

A fila de senhas esperando atendimento é exibido na parte inferior do vídeo sempre que se entra no menu atendimento. Após chamar uma senha são exibidas algumas outras opções, como podemos ver na figura a seguir:

Após chamar a senha pela primeira vez, é possível chamá-la novamente, iniciar o atendimento quando o usuário se apresenta ao guichê ou ainda indicar que a senha não compareceu para que a mesma seja retirada da fila e dê a vez para a próxima senha aguardando atendimento.

Após iniciar o atendimento, a opção erro de triagem aparece para que seja possível indicarmos que a pessoa foi para o guichê errado, dessa forma podemos redirecionar a senha dela para o guichê correto onde o serviço requisitado poderá ser atendido. (Vide próxima figura)

Após clicarmos em “Erro de Triagem” será exibida a caixa de seleção a seguir que nos permitirá direcionar o usuário da senha ao guichê onde o serviço desejado é atendido:

Após o devido atendimento dos serviços solicitados pelo usuário é necessário fazer a codificação do atendimento que foi realizado. Após clicar em “Encerrar atendimento” o atendente no guichê será direcionado para janela abaixo onde poderá selecionar os serviços que foram atendidos a pedido do usuário em questão. Ao clicar nos “Serviços disponíveis” que foram atendidos, isso os move para seção “Serviços realizados”. Finalmente, após codificar os serviços atendidos clique em “Encerrar atendimento” para finalizar seu atendimento. (Vide próxima figura)


Desse modo é possível rastrear quais atendimentos demandaram mais tempo, entre outras informações que auxiliarão o gestor na tomada de decisão posterior caso decida-se alterar o fluxo de atendimento.

.. figure:: prints/modulo-atendimento2.png
    :align: center

.. figure:: prints/modulo-atendimento3.png
    :align: center

.. figure:: prints/modulo-atendimento-redirecionar.png
    :align: center

.. figure:: prints/modulo-atendimento-encerrar.png
    :align: center


.. important::

    1. Os serviços disponíveis para codificação do atendimento têm de ser cadastrados previamente na ferramenta para que estejam disponíveis para os atendentes selecionarem na página de encerramento do atendimento. Caso algum serviço não apareça, isso indicará que tal serviço não foi cadastrado.

    2. Caso exista algum serviço adicional que o atendente não possa fazer, porém é contemplado por outro guichê, nesse caso o atendente poderá ao encerrar redirecionar a senha para outro guichê marcando antes de clicar em “Encerrar atendimento” a opção “Redirecionar atendimento ao encerrar”. 


Módulos Globais
---------------

Os módulos globais são aqueles que afetam todas as unidades, ou que por algum motivo não tem relação com nenhuma unidade em particular.

.. figure:: prints/menu-global.png
    :align: center



Prioridades
~~~~~~~~~~~~~

Nesse menu é possível definir novos tipos de Prioridades para atendimentos especiais, como também definir o peso que as prioridades existentes terão umas sobre as outras.

Por padrão a ferramenta oferece as prioridades que seguem: Sem Prioridade, Gestante, Idoso, Portador de Deficiência e Outros.

Na configuração padrão todas as prioridades possuem peso ou valor “1”, com exceção do tipo chamado “Sem Prioridade” que tem peso ou valor “0”.

O menu ainda permite a criação de novas prioridades como também a edição dos dados de alguma prioridade previamente existente. Ao clicar em “Novo” será exibida a tela abaixo onde poderão ser completados os dados da nova prioridade.

Ao clicar em “Salvar” a nova prioridade é criada e passa a constar na lista de prioridades existentes. 

.. figure:: prints/modulo-prioridades.png
    :align: center

O mesmo ocorre quando se deseja alterar uma prioridade previamente criada. Após clicar no botão “Editar” é exibida janela similar onde após alterar os dados desejados é possível “Salvar” todas as alterações realizadas.

.. figure:: prints/modulo-prioridades2.png
    :align: center

.. important::

    1. Caso a Prioridade conste como “Inativa” em seu status exibido nesse menu, isso significará que a mesma não estará disponível para seleção no menu “Triagem”. Atente para este detalhe ao alterar uma prioridade existente ou criar uma nova.

    2. Lembre-se que alterar o valor padrão das prioridades influenciará diretamente a ordem de enfileiramento das senhas de atendimento prioridade no Menu Triagem. A tarefa de definição de pesos para os atendimentos de prioridade exige planejamento prévio para que não ocasione desentendimentos e confusões entre os atendentes nos guichês, assim como para os usuários.


Serviços
~~~~~~~~~

Nesse menu é onde configuramos os serviços que estarão disponíveis para os atendentes codificarem o atendimento realizado ao encerrar seu atendimento. 

Os serviços configurados nesse menu também são aqueles que serão apresentados durante a Triagem, onde é feita a geração das senhas.

.. figure:: prints/modulo-servicos.png
    :align: center

Nesse menu é possível a criação de um novo serviço, ou ainda editar as opções de algum serviço criado previamente. (Vide figura abaixo)

.. figure:: prints/modulo-servicos2.png
    :align: center

Caso crie um novo serviço, após preencher os dados do mesmo poderá clicar em salvar para que o novo serviço passe a ser listado na página inicial desse menu. 

Os serviços podem estar encadeados indicando que são subserviços componentes de uma categoria específica. Caso esteja criando “subserviços” vinculados a uma categoria, então precisará indicar o serviço “Macro” ou pai desses subserviços. Tal serviço macro tem que ter sido criado previamente para que seja possível vincular a este os novos subserviços.

.. figure:: prints/modulo-servicos3.png
    :align: center

Na figura anterior é mostrada a tela inicial do menu serviços, onde podem ser vistos serviços principais como categorias em negrito e seus correspondentes subserviços:

.. important::

    É importante notar que nessa versão do novosga, por padrão, as estatísticas são geradas apenas para os serviços principais criados. Isto é, caso deseje criar subserviços, não será possível visualizar as estatísticas por subserviço criado. Caso a intenção seja rastrear detalhadamente as estatísticas para cada serviço criado então é recomendado a criação de todos os subserviços como se fossem serviços principais.


Grupos
~~~~~~

Nesse menu criamos os grupos onde residirão as nossas unidades de atendimento. Abaixo podemos ver a tela inicial desse menu:

.. figure:: prints/modulo-grupos.png
    :align: center

Aqui podemos criar novos grupos ou ainda editar grupos previamente criados. Caso criemos um novo grupo, devemos primeiro preencher os dados específicos, então ao terminar o preenchimento dos dados clicamos em “Salvar”. É possível criar subgrupos caso seja necessário. Para isso, basta definir o “Pai” do grupo como sendo algum dos outros grupos previamente criados, antes de finalmente clicarmos em “Salvar”. Como mostrado nas figuras abaixo.

.. figure:: prints/modulo-grupos2.png
    :align: center

.. figure:: prints/modulo-grupos3.png
    :align: center

.. important::
    1. O grupo raiz ('Raiz') não pode ser removido, apenas editado

    2. É importante lembrarmos que só podemos colocar uma unidade de atendimento por Grupo. NÃO É POSSÍVEL AMPLIAR ESSE NÚMERO. Cada unidade deverá possuir seu grupo específico. Certifique-se de criar a quantidade de grupos necessários para abrigar suas unidades de atendimento. Isso afetará a criação de novas unidades, o parâmetro grupo é obrigatório para todas as unidades.


Unidades
~~~~~~~~

Aqui criaremos nossas unidades de atendimento e decidiremos quais estão ativas ou inativas. Na figura abaixo a tela inicial desse menu é apresentada.

.. figure:: prints/modulo-unidades.png
    :align: center

.. figure:: prints/modulo-unidades2.png
    :align: center

.. figure:: prints/modulo-unidades3.png
    :align: center

Ao criar uma nova unidade é necessário informar o Grupo ao qual esta faz parte e definir se a mesma será criada como ativa ou inativa. Ainda é possível realizar alterações nas unidades previamente criadas. Após clicar no botão editar, a direita da unidade desejada, é necessário informar os novos dados, então finalmente clicar em “Salvar” para efetuar as mudanças desejadas.

.. important::
    Toda unidade deve estar vinculada a um grupo folha (último nível), e caso o grupo que unidade esteja associada receba um novo filho, a unidade passará a estar vinculada a esse novo grupo folha.


Cargos
~~~~~~~

Nesse menu definimos os papéis que terão parte nas atividades de gerenciamento do sistema de atendimento. Serão definidas as permissões que cada papel terá. Por padrão a ferramenta oferece apenas o papel Administrador. 

.. figure:: prints/modulo-cargos.png
    :align: center

Abaixo é apresentada a tela inicial do menu. Nessa tela é possível editar os Cargos criados anteriormente e criar um novo cargo conforme necessário.

.. figure:: prints/modulo-cargos-geral.png
    :align: center

.. figure:: prints/modulo-cargos-geral2.png
    :align: center

Ao clicar no botão “Novo” é apresentada a tela abaixo, onde é possível ajustar as permissões nos módulos disponíveis e informações relacionadas ao novo cargo criado.

Quando editamos um cargo existente é possível redefinir as permissões de acesso que este terá, como também, alterar outras propriedades como descrição, nome e objeto pai. Para confirmar as novas propriedades é necessário clicar no botão “Salvar”, depois de realizadas as alterações. (Vide figura abaixo)

.. figure:: prints/modulo-cargos-permissoes.png
    :align: center

.. important::

    1. O cargo raiz ('Administrador') não pode ser removido, apenas editado

    2. Note que é necessário que o novo cargo possua um Cargo “Pai”. Sem que isso seja especificado não é possível finalizar a criação do mesmo.


Usuários
~~~~~~~~

Nesse menu os usuários são criados. A criação de usuários pode ser feita manualmente, ou automática. Quando o sistema está configurado para funcionar integrado ao Active Directory, os usuários são criados automaticamente. 

Abaixo visualizamos a tela inicial desse menu:

.. figure:: prints/modulo-usuarios.png
    :align: center

Nessa tela podemos editar as configurações para um usuário específico, excluir algum usuário ou criar um novo usuário.

Na aba acesso encontramos as opções Lotações e Atendimento

.. figure:: prints/modulo-usuarios-acesso.png
    :align: center

Em Lotações você define em quais unidades de atendimento o usuário terá acesso e poderá realizar atendimentos.

Em Atendimento definimos os serviços, ou filas, nas quais o usuário em questão terá acesso para as lotações definidas anteriormente.

Na tela de edição do usuário, basta modificarmos as opções necessárias, para confirmar as alterações clicamos em “Salvar”.

Na aba Geral podemos modificar outras opções, são elas: Nome de usuário, Nome, Sobrenome, Status e Senha.

.. figure:: prints/modulo-usuarios-geral.png
    :align: center

Após a realização das alterações necessárias, para que elas sejam aplicadas, é necessário clicar no botão salvar, como podemos visualizar na figura abaixo:


.. important::

    1. Se o usuário for lotado em um grupo raiz (ou não folha) automaticamente terá acesso a todas as unidades vinculadas aos nós folha desse grupo com o cargo dessa lotação.

    2. Para que seja possível adicionar as configurações de Lotação e Atendimento do modo adequado é necessário que, antes disso, os Grupos, Unidades, Cargos e Serviços também tenham sido configurados previamente. Caso não encontre um Cargo, Unidade, Grupo ou Serviço específico para configurar no usuário, isso poderá significar que alguma etapa da configuração inicial ainda não foi feita. Revise a configuração dos menus citados anteriormente.


Módulos
~~~~~~~

Nesse menu é possível editar o código fonte dos módulos existentes na aplicação. Abaixo é exibido a tela inicial do menu.

.. figure:: prints/modulo-modulos.png
    :align: center

Esse menu permite a criação de novos módulos como também editar os módulos atuais. Essa ferramenta visa facilitar o trabalho dos desenvolvedores.

Ao clicar no botão “Editar” em algum dos módulos disponíveis é exibido o CSS e Javascript do módulo correspondente. (Vide figura abaixo)

.. figure:: prints/modulo-modulos-javascript.png
    :align: center

Após realizar as alterações necessárias é possível salvar as alterações e recarregar o módulo de modo que as alterações realizadas possam ser aplicadas.


Estatísticas
~~~~~~~~~~~~

Nesse menu podemos visualizar as estatísticas de atendimento para as unidades existentes.

Abaixo é exibida a tela inicial desse menu:

.. figure:: prints/modulo-estatisticas.png
    :align: center

Esse menu traz 3 abas onde podemos visualizar as estatísticas das unidades em formas diferentes.

Na aba “Hoje” são exibidas as estatísticas para o dia atual dividido em duas categorias: “Atendimentos por Situação”, isto é por status, e ainda “Atendimentos por Serviço” o que contabilizará os atendimentos por serviços. Não é possível filtrar os gráficos por unidade, as informações de todas as unidades são apresentadas de uma só vez.

Na aba “Gráficos” são apresentados 3 tipos de gráficos que podem ser exibidos por unidade num período de tempo especificado:

.. figure:: prints/modulo-estatisticas-graficos.png
    :align: center

.. figure:: prints/modulo-estatisticas-graficos2.png
    :align: center

Além dos gráficos de “Atendimento por Serviço” e “Atendimento por Situação” que foram mencionados anteriormente, também é possível a geração de um gráfico de “Tempo médio de atendimento”. Após a seleção do tipo de gráfico, a unidade de atendimento e o intervalo de tempo poderemos então clicar em “Gerar Gráfico”.

Na aba “Relatórios” é possível extrair relatórios customizados para os seguintes itens: Serviços disponíveis – Global, Serviços Disponíveis – Unidade, Serviços Codificados, Atendimentos Concluídos, Atendimento em Todos os Status, Tempos médios por Atendente, Lotações e Cargos.(Vide figura abaixo)

.. figure:: prints/modulo-estatisticas-relatorios.png
    :align: center

.. figure:: prints/modulo-estatisticas-relatorios2.png
    :align: center

Para gerar um novo relatório é necessário selecionar o tipo de relatório desejado e definir o intervalo de tempo que será auditado. Após selecionar esses parâmetros, podemos clicar em “Gerar Relatório” para que seja aberta uma outra aba no navegador exibindo os dados solicitados, como pode ser visto na figura abaixo:



Administração
~~~~~~~~~~~~~~

Nesse menu é possível realizar as configurações principais que nortearão o funcionamento do sistema com relação ao modo de autenticação, geração das senhas na triagem e integração com outros aplicativos.

Abaixo é apresentada a tela inicial desse menu.

.. figure:: prints/modulo-administracao.png
    :align: center

Existem 3 abas onde podem ser feitas as configurações necessárias.

Sistema: Nessa aba são revisadas as configurações de banco de dados, como também a integração com uma base LDAP de sua escolha. (Vide figura acima)

Triagem: Nessa aba é feita a configuração relacionada  ao tipo de numeração das senhas que serão geradas na Triagem. 

.. figure:: prints/modulo-administracao-triagem.png
    :align: center

Caso seja selecionado o tipo “Incremental por serviço”, cada serviço configurado para a unidade terá sua própria fila de senhas. Por exemplo: Temos os serviços “Atendimento Cidadão” e “Atendimento Advogado”, para cada um dos serviços haverá uma fila única onde a senha gerada em um deles não interfere na ordem das senhas geradas para o outro serviço. Nesse caso: A001, A003 e B001, B002.

Caso seja selecionado “Incremental única”, não importa quantos serviços existam, haverá apenas uma fila geral. Por exemplo: Caso existam os serviços “Atendimento Cidadão” e “Atendimento Advogado” existirá uma única fila que incluirá as senhas dos dois serviços na ordem em que foram geradas. Isto é: A001, A002, A003.

A figura acima mostra a tela da Triagem no Menu Administração. É possível ainda reiniciar a geração das senhas.

.. important::

    Cuidado! Ao reiniciar as senha utilizando esse menu, não somente as senha de uma unidade são reiniciadas, mas as senhas de todas as unidades são reiniciadas. Usar esse recurso parcimoniosamente.

API: Nessa aba é possível integrar outros aplicativos ao sistema. Como por exemplo, a “Triagem Touch” e “Painel Web”.

.. figure:: prints/modulo-administracao-api.png
    :align: center

Em alguns casos é necessário configurar uma senha para controlar o acesso da aplicação às informações disponíveis no sistema. Isso não é necessário para o “Painel Web”.


.. sectionauthor:: Clécio Anderson <clecioanderson@gmail.com>