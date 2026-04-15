CREATE DATABASE IF NOT EXISTS rota_livre;
USE rota_livre;

CREATE TABLE Cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    status VARCHAR(20),
    PRIMARY KEY (id_cliente)
);

CREATE TABLE Categoria_Veiculo (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50),
    valor_diaria DECIMAL(10,2),
    PRIMARY KEY (id_categoria)
);

CREATE TABLE Veiculo (
    id_veiculo INT NOT NULL AUTO_INCREMENT,
    placa VARCHAR(10) UNIQUE,
    modelo VARCHAR(50),
    marca VARCHAR(50),
    ano INT,
    id_categoria INT,
    status VARCHAR(20),
    PRIMARY KEY (id_veiculo),
    FOREIGN KEY (id_categoria) REFERENCES Categoria_Veiculo(id_categoria)
);

CREATE TABLE Funcionario (
    id_funcionario INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    login VARCHAR(50),
    senha VARCHAR(50),
    PRIMARY KEY (id_funcionario)
);

CREATE TABLE Contrato (
    id_contrato INT NOT NULL AUTO_INCREMENT,
    id_cliente INT,
    id_veiculo INT,
    id_funcionario INT,
    data_retirada DATE,
    data_prevista_devolucao DATE,
    km_inicial INT,
    valor_diaria DECIMAL(10,2),
    tipo_seguro VARCHAR(50),
    status VARCHAR(20),
    PRIMARY KEY (id_contrato),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);

CREATE TABLE Pagamento (
    id_pagamento INT NOT NULL AUTO_INCREMENT,
    id_contrato INT,
    valor DECIMAL(10,2),
    data_pagamento DATE,
    status VARCHAR(20),
    PRIMARY KEY (id_pagamento),
    FOREIGN KEY (id_contrato) REFERENCES Contrato(id_contrato)
);

CREATE TABLE Multa (
    id_multa INT NOT NULL AUTO_INCREMENT,
    id_contrato INT,
    data DATE,
    valor DECIMAL(10,2),
    descricao TEXT,
    PRIMARY KEY (id_multa),
    FOREIGN KEY (id_contrato) REFERENCES Contrato(id_contrato)
);

CREATE TABLE Manutencao (
    id_manutencao INT NOT NULL AUTO_INCREMENT,
    id_veiculo INT,
    tipo VARCHAR(20),
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE,
    PRIMARY KEY (id_manutencao),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
);

CREATE TABLE Historico_Quilometragem (
    id_historico INT NOT NULL AUTO_INCREMENT,
    id_veiculo INT,
    km INT,
    data DATE,
    PRIMARY KEY (id_historico),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
);

CREATE TABLE Devolucao (
    id_devolucao INT NOT NULL AUTO_INCREMENT,
    id_contrato INT,
    km_final INT,
    danos TEXT,
    combustivel_faltante DECIMAL(5,2),
    valor_extra DECIMAL(10,2),
    PRIMARY KEY (id_devolucao),
    FOREIGN KEY (id_contrato) REFERENCES Contrato(id_contrato)
);

INSERT INTO Cliente (nome, cpf, telefone, email, status) VALUES
('João Silva','111.111.111-11','11999999999','joao@email.com','ativo'),
('Maria Souza','222.222.222-22','11988888888','maria@email.com','inadimplente'),
('Carlos Lima','333.333.333-33','11977777777','carlos@email.com','ativo'),
('Ana Costa','444.444.444-44','11966666666','ana@email.com','ativo'),
('Pedro Alves','555.555.555-55','11955555555','pedro@email.com','ativo');

INSERT INTO Categoria_Veiculo (nome, valor_diaria) VALUES
('Popular',100),
('Sedan',150),
('SUV',200),
('Van',250),
('Utilitario',180);

INSERT INTO Veiculo (placa, modelo, marca, ano, id_categoria, status) VALUES
('ABC1234','Onix','Chevrolet',2022,1,'disponivel'),
('DEF5678','Corolla','Toyota',2021,2,'alugado'),
('GHI9012','Compass','Jeep',2023,3,'manutencao'),
('JKL3456','Kombi','Volkswagen',2019,4,'disponivel'),
('MNO7890','Strada','Fiat',2022,5,'reservado');

INSERT INTO Funcionario (nome, cargo, login, senha) VALUES
('Lucas','Atendente','lucas','123'),
('Fernanda','Gerente','fer','123'),
('Rafael','Atendente','rafa','123'),
('Juliana','Financeiro','ju','123'),
('Bruno','Atendente','bru','123');

INSERT INTO Contrato (id_cliente, id_veiculo, id_funcionario, data_retirada, data_prevista_devolucao, km_inicial, valor_diaria, tipo_seguro, status) VALUES
(1,1,1,'2026-03-01','2026-03-05',10000,100,'basico','ativo'),
(2,2,2,'2026-03-02','2026-03-06',20000,150,'completo','ativo'),
(3,3,3,'2026-03-03','2026-03-07',30000,200,'basico','cancelado'),
(4,4,4,'2026-03-04','2026-03-08',15000,250,'completo','ativo'),
(5,5,5,'2026-03-05','2026-03-09',18000,180,'basico','ativo');

INSERT INTO Pagamento (id_contrato, valor, data_pagamento, status) VALUES
(1,500,'2026-03-05','pago'),
(2,600,'2026-03-06','pendente'),
(3,700,'2026-03-07','atrasado'),
(4,800,'2026-03-08','pago'),
(5,900,'2026-03-09','pago');

INSERT INTO Multa (id_contrato, data, valor, descricao) VALUES
(1,'2026-03-10',150,'Excesso de velocidade'),
(2,'2026-03-11',200,'Avanco de sinal'),
(3,'2026-03-12',100,'Estacionamento irregular'),
(4,'2026-03-13',250,'Uso de celular'),
(5,'2026-03-14',180,'Sem cinto');

INSERT INTO Manutencao (id_veiculo, tipo, descricao, data_inicio, data_fim) VALUES
(1,'preventiva','Troca de oleo','2026-02-01','2026-02-02'),
(2,'corretiva','Freio','2026-02-03','2026-02-05'),
(3,'preventiva','Revisao','2026-02-06','2026-02-07'),
(4,'corretiva','Motor','2026-02-08','2026-02-10'),
(5,'preventiva','Pneus','2026-02-11','2026-02-12');

INSERT INTO Historico_Quilometragem (id_veiculo, km, data) VALUES
(1,10000,'2026-01-01'),
(2,20000,'2026-01-02'),
(3,30000,'2026-01-03'),
(4,15000,'2026-01-04'),
(5,18000,'2026-01-05');

INSERT INTO Devolucao (id_contrato, km_final, danos, combustivel_faltante, valor_extra) VALUES
(1,10500,'Nenhum',10,50),
(2,21000,'Arranhado',5,100),
(3,31000,'Nenhum',0,0),
(4,16000,'Retrovisor quebrado',8,200),
(5,19000,'Nenhum',3,30);

SELECT * FROM Cliente;
SELECT * FROM Categoria_Veiculo;
SELECT * FROM Veiculo;
SELECT * FROM Funcionario;
SELECT * FROM Contrato;
SELECT * FROM Pagamento;
SELECT * FROM Multa;
SELECT * FROM Manutencao;
SELECT * FROM Historico_Quilometragem;
SELECT * FROM Devolucao;
