-- =========================================
-- TABELA: clientes
-- =========================================
CREATE TABLE clientes (
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(45),
    sobrenome VARCHAR(45),
    telefone VARCHAR(15),
    endereco VARCHAR(45)
);

-- =========================================
-- TABELA: veiculo
-- =========================================
CREATE TABLE veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(45),
    cor VARCHAR(45),
    num_placa VARCHAR(45) UNIQUE,
    falha VARCHAR(45),
    cliente_cpf VARCHAR(14),
    FOREIGN KEY (cliente_cpf) REFERENCES clientes(cpf)
);

-- =========================================
-- TABELA: ordem_de_servico
-- =========================================
CREATE TABLE ordem_de_servico (
    numero_ordem INT AUTO_INCREMENT PRIMARY KEY,
    data_entrega DATE,
    valor_servico DECIMAL(10,2),
    veiculo_id INT,
    FOREIGN KEY (veiculo_id) REFERENCES veiculo(id_veiculo)
);

-- =========================================
-- TABELA: auto_pecas
-- =========================================
CREATE TABLE auto_pecas (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    peca VARCHAR(45),
    valor_peca DECIMAL(10,2),
    vendedor VARCHAR(45),
    ordem_numero INT,
    FOREIGN KEY (ordem_numero) REFERENCES ordem_de_servico(numero_ordem)
);

-- =========================================
-- TABELA: tec_responsavel
-- =========================================
CREATE TABLE tec_responsavel (
    id_tecnico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    data_manutencao DATE,
    falha_encontrada VARCHAR(45),
    valor_mao_obra DECIMAL(10,2),
    ordem_numero INT,
    FOREIGN KEY (ordem_numero) REFERENCES ordem_de_servico(numero_ordem)
);
