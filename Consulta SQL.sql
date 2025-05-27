-- Recuperações Simples com SELECT
-- Pergunta: Quais são os clientes cadastrados?
SELECT nome, sobrenome, telefone FROM clientes;

-- Filtros com WHERE
-- Pergunta: Quais veículos da cor "Preto" estão cadastrados?
SELECT tipo, cor, num_placa FROM veiculo
WHERE cor = 'Preto';

-- Expressões para Atributos Derivados
-- Pergunta: Qual é o custo total (serviço + peças + mão de obra) de cada ordem?
SELECT os.numero_ordem,
       os.valor_servico,
       SUM(ap.valor_peca) AS total_pecas,
       SUM(tr.valor_mao_obra) AS total_mao_obra,
       (os.valor_servico + SUM(ap.valor_peca) + SUM(tr.valor_mao_obra)) AS custo_total
FROM ordem_de_servico os
LEFT JOIN auto_pecas ap ON os.numero_ordem = ap.ordem_numero
LEFT JOIN tec_responsavel tr ON os.numero_ordem = tr.ordem_numero
GROUP BY os.numero_ordem;

-- Ordenações com ORDER BY
-- Pergunta: Quais ordens de serviço foram concluídas, ordenadas pelo valor do serviço (do maior para o menor)?
SELECT numero_ordem, data_entrega, valor_servico 
FROM ordem_de_servico
ORDER BY valor_servico DESC;

-- Condições com HAVING
-- Pergunta: Quais ordens de serviço tiveram custo total superior a R$2000?
SELECT os.numero_ordem,
       (os.valor_servico + SUM(ap.valor_peca) + SUM(tr.valor_mao_obra)) AS custo_total
FROM ordem_de_servico os
LEFT JOIN auto_pecas ap ON os.numero_ordem = ap.ordem_numero
LEFT JOIN tec_responsavel tr ON os.numero_ordem = tr.ordem_numero
GROUP BY os.numero_ordem
HAVING custo_total > 2000;

-- Junções entre Tabelas
-- Pergunta: Liste todos os clientes com os veículos e a falha reportada.
SELECT c.nome, c.sobrenome, v.tipo, v.num_placa, v.falha
FROM clientes c
INNER JOIN veiculo v ON c.cpf = v.cliente_cpf;

-- Pergunta: Quais peças foram usadas em cada ordem, com nome do cliente e valor da peça?
SELECT c.nome, c.sobrenome, ap.peca, ap.valor_peca, os.numero_ordem
FROM clientes c
INNER JOIN veiculo v ON c.cpf = v.cliente_cpf
INNER JOIN ordem_de_servico os ON v.id_veiculo = os.veiculo_id
INNER JOIN auto_pecas ap ON os.numero_ordem = ap.ordem_numero;



