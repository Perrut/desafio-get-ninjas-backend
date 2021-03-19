# Desafio GetNinjas Backend

Repositório com uma proposta de solução para o desafio proposto em https://github.com/getninjas/backend-service-challenge

## Instruções de execução

- `docker-compose build` para construir as imagens
- Basta possuir o Docker instalado em sua máquina e rodar `docker-compose up`
  - Na primeira execução do projeto, é necessário encerrar e dar `docker-compose up` novamente para configuração correta da fila, o script que detecta se o serviço produtor está de pé não funciona 100% nessa primeira execução
  - Caso haja algum problema com o script `wait-for-it.sh` do projeto Consumidor, basta que se dê um `chmod +x` para se permitir a execução do mesmo e o serviço consumer possa iniciar.
- As url's são:
  - `POST`: http://localhost:3000/orders para criar um pedido novo
  - `GET`: http://localhost:3000/orders para listar todos os pedidos
  - `GET`: http://localhost:3000/orders/:id para listar um pedido pelo seu id
  - `PUT`: http://localhost:3000/orders/:id para atualizar um pedido
  - `DELETE`: http://localhost:3000/orders/:id para excluir um pedido

O formato de objeto a ser enviado para a API é exatamente o mesmo proposto na página do desafio.

Há uma [collection do Postman](https://github.com/Perrut/desafio-get-ninjas-backend/blob/master/DesafioGetNinjas.postman_collection.json) de exemplo caso queira se utilizar.

Como o formato de geração do projeto Rails não foi feito com a flag --api, deve se passar nos requests o header `Accept` com o valor `application/json` para não se receber as respostas em  (a collection do Postman já tem em todos eles).

O projeto se consitui de 4 serviços, um banco de dados para o serviço produtor, os serviços de produtor e consumidor da fila e uma instância do RabbitMQ.

Os endpoints chamados são recebidos pelo serviço produtor, que envia as informações para a fila para que o serviço consumidor leia o endereço consumindo a mesma, e preencha os dados de latitude e longitude do pedido consultando um api externa.

A url do management do RabbitMQ é http://localhost:15672

Olhar também o README dos projetos [Consumidor](https://github.com/Perrut/desafio-get-ninjas-backend/tree/master/servico-consumidor) e [Produtor](https://github.com/Perrut/desafio-get-ninjas-backend/tree/master/servico-produtor) para mais informarções.
