# Serviço Consumidor

Este serviço roda um job que consome dados da fila para obter dados geográficos (latitude/longitude) de um dado endereço fornecido no parâmetro.

A API utilizada para a busca das informações é a [PositionStack](https://positionstack.com/). Foi escolhida por fornecer o serviço de forma gratuita.

Classes/arquivos que eu desenvolvi para a execução do projeto do desafio.

- OrderWorker: processo que se comunica com a fila do RabbitMQ e consome as informações para obter os dados de endereço e enviar para o serviço de pedidos
- RabbitMQ task: responsável pela criação da fila que se alimenta dos dados produzidos pelo serviço consumidor
