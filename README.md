# Desafio GetNinjas Backend

Repositório com uma proposta de solução para o desafio proposto em https://github.com/getninjas/backend-service-challenge

## Instruções de execução

- Basta possuir o Docker instalado em sua máquina e rodar `docker-compose up`
- As url's são:
  - `POST`: http://localhost:3000/orders para criar um pedido novo
  - `GET`: http://localhost:3000/orders para listar todos os pedidos
  - `GET`: http://localhost:3000/orders/:id para listar um pedido pelo seu id
  - `PUT`: http://localhost:3000/orders/:id para atualizar um pedido
  - `DELETE`: http://localhost:3000/orders/:id para excluir um pedido

O formato de objeto a ser enviado para a API é exatamente o mesmo proposto na página do desafio.

Há uma collection do Postman de exemplo caso queira se utilizar.