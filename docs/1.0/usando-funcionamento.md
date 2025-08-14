# Funcionamento

!> **Atenção** Você está vendo uma documentação antiga. A versão v1.0.0 foi lançada em Dezembro de 2013.

Quando um novo cliente chega à unidade de atendimento, ele passa pela triagem para definir qual serviço deseja ser atendido e se é um atendimento prioritário ou não.

Com o novo atendimento gerado, e de posse da senha, o cliente aguarda pela exibição de sua senha no painel. Esse evento (chamar a senha) é invocado pelo atendente que atende o serviço escolhido na triagem.

![flow](_images/flow.png)


Fluxo de funcionamento do NovoSGA

A senha é formada por um número incremental (único na unidade) prefixada da letra do serviço. No caso do serviço identificado pela letra ‘A’, a primeira senha gerada na unidade para esse serviço será a senha ‘A0001’, já a segunda senha gerada (desta vez para o serviço ‘B’) será ‘B0002’.

Caso aconteça um erro na triagem e o serviço definido não for realmente o que o cliente deseja, o próprio atendente pode redirecioná-lo para outro serviço mantendo sua senha com o mesmo número, evitando que o cliente caia no final da fila do novo serviço.

Ao final do atendimento o sistema terá computado a hora de cada estado do atendimento, sendo possível saber: O tempo de deslocamento do cliente até o atendente, o tempo do atendimento, e o tempo total de permanência do cliente na unidade até ser atendido.
