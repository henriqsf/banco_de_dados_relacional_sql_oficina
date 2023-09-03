
# Banco de Relacional de uma Oficina


O projeto teve o objetivo de resolver um desafio que consistia em criar um banco de dados relacional de uma oficina. Foi desenvolvido o esquema lógico, scrip SQL para criação do banco de dados, scrip para iserção de dados e elaboração de queries que possam responder perguntas de negócios.

**As queries criadas deviam conter:**

* Recuperações com SELECT Statement;
* Filtros com WHERE Statement;
* Expressões para gerar atributos derivados;
* Definição de ordenações dos dados com ORDER BY;
* Condições de filtros aos grupos – HAVING Statement;
* junções entre tabelas para fornecer uma perspectiva mais complexa dos dados.

# Solução:

O projeto foi desenvolvido para armazenar informações sobre clientes, veículos, mecânicos, histórico de serviços e estoque de itens/peças. O banco de dados foi criado utilizando a linguagem SQL e pode ser utilizado para acompanhar e gerenciar as operações diárias da oficina.

# Estrutura do Banco de Dados:

O banco de dados da oficina é composto por cinco tabelas principais:

**Clientes:** Armazena informações sobre os clientes da oficina, incluindo nome, telefone e endereço.

**Veículos:** Registra informações sobre os veículos dos clientes, como tipo (carro ou moto), placa, marca, modelo, ano e cor. Esta tabela também está relacionada à tabela de clientes para associar veículos a clientes.

**Mecânicos:** Contém informações sobre os mecânicos da oficina, incluindo nome e telefone.

**Histórico de Serviço:** Registra os serviços realizados, incluindo o mecânico responsável, o veículo atendido, a data, a hora e o valor do serviço. Esta tabela está relacionada tanto à tabela de mecânicos quanto à tabela de veículos.

**Estoque:** Mantém um registro do estoque de peças e itens da oficina, incluindo o nome do item, uma descrição e a quantidade disponível.

# Respostas para Perguntas de Negócio com Queries:

Listas de perguntas de negócio que foram respondidas pelas queries:

* Quais são os clientes que mais utilizaram os serviços da oficina?
* Qual é a média de valor gasto por cliente nos serviços da oficina?
* Quais são os tipos de veículos mais comuns que utilizam os serviços da oficina (carros ou motos)?
* Qual é a marca de veículo mais frequente na oficina?
* Quantos serviços cada mecânico realizou durante um período específico?
* Qual é o total de receita gerada pela oficina durante um período específico?
* Quais clientes têm mais de um veículo registrado na oficina?


