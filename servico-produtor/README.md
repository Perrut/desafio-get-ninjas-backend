# Serviço Produtor

Este serviço é o que capta os objetos que representam pedidos e que assim que o salvam na base, o enviam para a fila, para que o serviço consumidor consiga obter os dados de latitude/longitude relativos ao endereço do pedido.

Classes/arquivos que desenvolvi para o desafio

- [Controllers](https://github.com/Perrut/desafio-get-ninjas-backend/blob/master/servico-produtor/app/controllers/orders_controller.rb) e [Views](https://github.com/Perrut/desafio-get-ninjas-backend/tree/master/servico-produtor/app/views/orders) (apenas JSON's) de [Order](https://github.com/Perrut/desafio-get-ninjas-backend/blob/master/servico-produtor/app/models/order.rb)
- Modelos auxiliares: [AddressAttribute](https://github.com/Perrut/desafio-get-ninjas-backend/blob/master/servico-produtor/app/models/address_attribute.rb), [RequestInfo](https://github.com/Perrut/desafio-get-ninjas-backend/blob/master/servico-produtor/app/models/user_info.rb) e [UserInfo](https://github.com/Perrut/desafio-get-ninjas-backend/blob/master/servico-produtor/app/models/user_info.rb)
- Serviço de comunicação com o RabbitMQ: [Publisher](https://github.com/Perrut/desafio-get-ninjas-backend/blob/master/servico-produtor/app/services/publisher.rb)
- [start.sh](https://github.com/Perrut/desafio-get-ninjas-backend/blob/master/servico-produtor/start.sh): responsável por iniciar o serviço
