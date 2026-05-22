-- 1. CRIAR AS TABELAS 
CREATE TABLE CLIENTES (
    id_cliente SERIAL PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE DEFAULT CURRENT_DATE,
    status_cliente VARCHAR(20) DEFAULT 'REGULAR'
);
CREATE TABLE PRODUTOS (
    id_produto SERIAL PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco DECIMAL(10, 2) NOT NULL
);
CREATE TABLE PEDIDOS (
    id_pedidos SERIAL PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10, 2) DEFAULT 0,
    CONSTRAINT fk_pedidos_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente)
);

-- 2. INSERIR DADOS 
INSERT INTO CLIENTES (nome, email, data_cadastro) VALUES ('Isabela Piazza', 'isabela@email.com', '2026-01-10');
INSERT INTO CLIENTES (nome, email, data_cadastro) VALUES ('João Silva', 'joao@email.com', '2026-01-15');
INSERT INTO CLIENTES (nome, email, data_cadastro) VALUES ('Maria Souza', 'maria@email.com', '2026-02-01');

INSERT INTO PRODUTOS (nome_produto, categoria, preco) VALUES ('Notebook Tech Pro', 'Eletrônicos', 4500.00);
INSERT INTO PRODUTOS (nome_produto, categoria, preco) VALUES ('Teclado Mecânico', 'Acessórios', 350.00);
INSERT INTO PRODUTOS (nome_produto, categoria, preco) VALUES ('Monitor 24 Polegadas', 'Eletrônicos', 1200.00);

INSERT INTO PEDIDOS (id_cliente, data_pedido, valor_total) VALUES (1, '2026-01-12', 4850.00);
INSERT INTO PEDIDOS (id_cliente, data_pedido, valor_total) VALUES (2, '2026-01-20', 350.00);
INSERT INTO PEDIDOS (id_cliente, data_pedido, valor_total) VALUES (1, '2026-02-15', 1200.00);
INSERT INTO PEDIDOS (id_cliente, data_pedido, valor_total) VALUES (3, '2026-03-05', 4500.00); 
