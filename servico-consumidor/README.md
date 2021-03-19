# Serviço Consumidor

Este serviço roda um job que consome dados da fila para obter dados geográficos (latitude/longitude) de um dado endereço fornecido no parâmetro.

A API utilizada para a busca das informações é a [PositionStack](https://positionstack.com/). Foi escolhida por fornecer o serviço de forma gratuita.

Classes/arquivos que eu desenvolvi para a execução do projeto do desafio.

- [OrderWorker](https://github.com/Perrut/desafio-get-ninjas-backend/blob/master/servico-consumidor/app/workers/order_worker.rb): processo que se comunica com a fila do RabbitMQ e consome as informações para obter os dados de endereço e enviar para o serviço de pedidos
- [RabbitMQ task](https://github.com/Perrut/desafio-get-ninjas-backend/blob/master/servico-consumidor/lib/tasks/rabbitmq.rake): responsável pela criação da fila que se alimenta dos dados produzidos pelo serviço consumidor
- [start.sh](https://github.com/Perrut/desafio-get-ninjas-backend/blob/master/servico-consumidor/start.sh): responsável por iniciar o serviço
- [wait-for-it.sh](https://github.com/Perrut/desafio-get-ninjas-backend/blob/master/servico-consumidor/wait-for-it.sh): responsável por detectar se o serviço produtor está funcionando para que o serviço consumidor possa iniciar
