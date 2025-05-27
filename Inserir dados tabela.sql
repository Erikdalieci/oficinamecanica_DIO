                                 -- Inserindo dados para teste
USE oficinamecanica;
-- clientes
INSERT INTO clientes VALUES
('12345678900' , 'JOÃO' , 'SILVA' , '22999999999' , 'RUA VITÓRIA, 152'),
('90450235910' , 'MARTA' , 'OLIVEIRA' , '55336699772' , 'RUA CONQUISTA, 256');

-- veiculos
INSERT INTO veiculo (tipo, cor, num_placa, falha, cliente_cpf) VALUES
('carro', 'preto', 'ABC1222', 'motor', '12365245853'),
('moto', 'vermelha', 'XVC6326', 'freio', '98753562140');

-- ordem de servico
INSERT INTO ordem_de_servico (data_entrega, valor_servico, veiculo_id) VALUES
('2025-05-01', 1500.00, 1),
('2025-05-10', 800.00, 2);

-- auto pecas
INSERT INTO auto_pecas (peca, valor_peca, vendedor, ordem_numero) VALUES
('Correia', 200.00, 'Auto Peças Ltda', 1),
('Pastilha de freio', 150.00, 'Motos Peças', 2);

-- tec responsavel
INSERT INTO tec_responsavel (nome, data_manutencao, falha_encontrada, valor_mao_obra, ordem_numero) VALUES
('Carlos', '2025-04-30', 'Troca correia', 300.00, 1),
('Ana', '2025-05-08', 'Reparo freio', 250.00, 2);
