# Serviço Produtor

Este serviço é o que capta os objetos que representam pedidos e que assim que o salvam na base, o enviam para a fila, para que o serviço consumidor consiga obter os dados de latitude/longitude relativos ao endereço do pedido.

Classes/arquivos que desenvolvi para o desafio

Controllers e Views de order
Modelos: address_attribute, request_info e user_info

Serviço de comunicação com o RabbitMQ: Publisher.rb