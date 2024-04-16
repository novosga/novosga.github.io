# Configuração

Por padrão o Novo SGA vem com um arquivo chamado `config/app.default.php` aonde estão as configurações padrões do sistema. Para customizar algum valor ou adicionar novas configurações crie uma cópia do arquivo padrão renomeando-o para `config/app.php`.

!> Nunca altere direto no arquivo `app.default.php`. Em caso de futuras atualizações esse arquivo será sobrescrito e suas alterações perdidas.

```php
<?php

/*
 * Default Novo SGA configuration, please don't edit this file.
 * For custom configuration make a copy named app.php in the same directory
 */

return [
    'queue' => [
        /**
         * Queue ordering
         * @param \Novosga\Entity\Unidade $unidade
         * @param \Novosga\Entity\Usuario $usuario (optional)
         * @return array
         */
        'ordering' =>  function (\Novosga\Entity\Unidade $unidade, \Novosga\Entity\Usuario $usuario = null) {
            $ordering = [];

            if ($usuario) {
                // peso servico x usuario
                $ordering[] = [
                    'exp' => 'servicoUsuario.peso',
                    'order' => 'DESC',
                ];
            }

            return array_merge($ordering, [
                // priority
                [
                    'exp'   => 'prioridade.peso',
                    'order' => 'DESC',
                ],
                // peso servico x unidade
                [
                    'exp'   => 'servicoUnidade.peso',
                    'order' => 'DESC',
                ],
                // dataChegada
                [
                    'exp'   => 'atendimento.dataChegada',
                    'order' => 'ASC',
                ]
            ]);
        },
    ]
];
```
