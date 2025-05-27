-- CREATE DATABASE ecommerce;
-- USE ecommerce;

-- =========================================
-- TABELA: Fornecedor
-- Finalidade: Armazena informações de fornecedores.
-- PK: idFornecedor
-- =========================================
CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY,
    Razao_social VARCHAR(45),
    CNPJ VARCHAR(45)
);

-- =========================================
-- TABELA: Terceiro_Vendedor
-- Finalidade: Representa vendedores terceiros.
-- PK: idTerceiro_Vendedor
-- =========================================
CREATE TABLE Terceiro_Vendedor (
    idTerceiro_Vendedor INT PRIMARY KEY,
    Razao_social VARCHAR(45)
);

-- =========================================
-- TABELA: Produto
-- Finalidade: Armazena os produtos do e-commerce.
-- PK: idProduto
-- =========================================
CREATE TABLE Produto (
    idProduto INT PRIMARY KEY,
    Categoria VARCHAR(45),
    Descricao VARCHAR(45),
    Valor VARCHAR(45)
);

-- =========================================
-- TABELA: Estoque
-- Finalidade: Controla os locais de estoque.
-- PK: idEstoque
-- =========================================
CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY,
    Local VARCHAR(45)
);

-- =========================================
-- TABELA: Produto_has_Estoque
-- Finalidade: Relação N:N entre Produto e Estoque, controlando quantidade.
-- PK: Produto_idProduto, Estoque_idEstoque
-- FK: Produto_idProduto → Produto, Estoque_idEstoque → Estoque
-- =========================================
CREATE TABLE Produto_has_Estoque (
    Produto_idProduto INT,
    Estoque_idEstoque INT,
    Quantidade INT,
    PRIMARY KEY (Produto_idProduto, Estoque_idEstoque),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque)
);

-- =========================================
-- TABELA: Produto_por_vendedor
-- Finalidade: Relação N:N entre Terceiro_Vendedor e Produto.
-- PK: Terceiro_Vendedor_idTerceiro, Produto_idProduto
-- =========================================
CREATE TABLE Produto_por_vendedor (
    Terceiro_Vendedor_idTerceiro INT,
    Produto_idProduto INT,
    Quantidade INT,
    PRIMARY KEY (Terceiro_Vendedor_idTerceiro, Produto_idProduto),
    FOREIGN KEY (Terceiro_Vendedor_idTerceiro) REFERENCES Terceiro_Vendedor(idTerceiro_Vendedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- =========================================
-- TABELA: Disponibilizando_um_produto
-- Finalidade: Indica quais produtos cada fornecedor disponibiliza.
-- PK: Fornecedor_idFornecedor, Produto_idProduto
-- =========================================
CREATE TABLE Disponibilizando_um_produto (
    Fornecedor_idFornecedor INT,
    Produto_idProduto INT,
    PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
    FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- =========================================
-- TABELA: Entrega
-- Finalidade: Informações sobre as entregas realizadas.
-- PK: idEntrega
-- =========================================
CREATE TABLE Entrega (
    idEntrega INT PRIMARY KEY,
    Cancelar VARCHAR(45),
    Recebido VARCHAR(45)
);

-- =========================================
-- TABELA: Produtos_e_Entregas
-- Finalidade: Liga Produto e Entrega com informações adicionais.
-- PK: Produto_idProduto, Entrega_idEntrega
-- =========================================
CREATE TABLE Produtos_e_Entregas (
    Produto_idProduto INT,
    Entrega_idEntrega INT,
    Localizacao_pedido INT,
    Cancelado VARCHAR(45),
    Entregue VARCHAR(45),
    PRIMARY KEY (Produto_idProduto, Entrega_idEntrega),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Entrega_idEntrega) REFERENCES Entrega(idEntrega)
);

-- =========================================
-- TABELA: Pedido
-- Finalidade: Armazena os pedidos realizados.
-- PK: idPedido
-- =========================================
CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY,
    Status_do_pedido VARCHAR(45),
    Descricao VARCHAR(45),
    Frete FLOAT
);

-- =========================================
-- TABELA: Relacao_de_Produto_Pedido
-- Finalidade: Controla os produtos vinculados a cada pedido.
-- PK: Pedido_idPedido, Produto_idProduto
-- =========================================
CREATE TABLE Relacao_de_Produto_Pedido (
    Pedido_idPedido INT,
    Produto_idProduto INT,
    Quantidade VARCHAR(45),
    Status_pedido VARCHAR(45),
    PRIMARY KEY (Pedido_idPedido, Produto_idProduto),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- =========================================
-- TABELA: Cliente
-- Finalidade: Armazena informações de clientes.
-- PK: idCliente
-- =========================================
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    Nome VARCHAR(45),
    Identificacao VARCHAR(45),
    Endereco VARCHAR(45),
    Pedido_idPedido INT,
    Pessoa_Juridica VARCHAR(45),
    Pessoa_Fisica VARCHAR(45),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);

-- =========================================
-- TABELA: Pag_cliente_por_vendedor
-- Finalidade: Controle de pagamentos de cliente para vendedor.
-- PK: Cliente_Vendedor, Terceiro_Vendedor_idTerceiro
-- =========================================
CREATE TABLE Pag_cliente_por_vendedor (
    Cliente_Vendedor INT,
    Pagamento VARCHAR(45),
    Terceiro_Vendedor_idTerceiro INT,
    Boleto VARCHAR(45),
    Pix VARCHAR(45),
    PRIMARY KEY (Cliente_Vendedor, Terceiro_Vendedor_idTerceiro),
    FOREIGN KEY (Cliente_Vendedor) REFERENCES Cliente(idCliente),
    FOREIGN KEY (Terceiro_Vendedor_idTerceiro) REFERENCES Terceiro_Vendedor(idTerceiro_Vendedor)
);

