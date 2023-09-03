use oficina;

-- RESPONDENDO PERGUNTAS DE NEGÓCIO COM QUERIES
-- As queries abaixo respondem possiveis perguntas que os stakeholders/donos da empresa podem solicitar a uma pessoa de dados.


-- Quais são os clientes que mais utilizaram os serviços da oficina?

SELECT c.nome, COUNT(h.id) AS total_servicos
FROM clientes c
LEFT JOIN veiculos v ON c.id = v.id_cliente
LEFT JOIN historico_servico h ON v.id = h.id_veiculo
GROUP BY c.nome
ORDER BY total_servicos DESC;

-- Qual é a média de valor gasto por cliente nos serviços da oficina?

SELECT c.nome, ROUND(AVG(h.valor), 2) AS media_valor
FROM clientes c
LEFT JOIN veiculos v ON c.id = v.id_cliente
LEFT JOIN historico_servico h ON v.id = h.id_veiculo
GROUP BY c.nome
HAVING AVG(h.valor) > 0;

-- Quais são os tipos de veículos mais comuns que utilizam os serviços da oficina (carros ou motos)?

SELECT tipo, COUNT(*) AS total
FROM veiculos
GROUP BY tipo;

-- Qual é a marca de veículo mais frequente na oficina?

SELECT marca, COUNT(*) AS total
FROM veiculos
GROUP BY marca
ORDER BY total DESC;

-- Quantos serviços cada mecânico realizou durante um período específico?

SELECT m.nome, COUNT(h.id) AS total_servicos
FROM mecanicos m
LEFT JOIN historico_servico h ON m.id = h.id_mecanico
WHERE h._data BETWEEN '2023-09-01' AND '2023-09-30'  -- OBS: Alterar as datas para consultar o período desejado
GROUP BY m.nome;

-- Qual é o total de receita gerada pela oficina durante um período específico?

SELECT SUM(valor) AS receita_total
FROM historico_servico
WHERE _data BETWEEN '2023-09-01' AND '2023-09-30';  -- OBS: Alterar as datas para consultar o período desejado

-- Quais clientes têm mais de um veículo registrado na oficina?

SELECT c.nome, COUNT(v.id) AS total_veiculos
FROM clientes c
JOIN veiculos v ON c.id = v.id_cliente
GROUP BY c.nome
HAVING COUNT(v.id) > 1;

