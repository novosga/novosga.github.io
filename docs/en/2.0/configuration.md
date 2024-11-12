# Configuration

Make a copy of `config/app.default.php` file named `config/app.php`.

```php
<?php

use Novosga\Entity\Unidade;
use Novosga\Entity\Usuario;

return [
    'queue' => [
        /**
         * Queue ordering
         * @param Unidade $unidade
         * @param Usuario $usuario (optional)
         * @return array
         */
        'ordering' =>  function (Unidade $unidade, Usuario $usuario = null) {
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
