CREATE DATABASE estacionamento;

USE estacionamento;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE veiculos (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente)
	REFERENCES clientes(id_cliente)
);

CREATE TABLE vagas (
    id_vaga INT AUTO_INCREMENT PRIMARY KEY,
    numero INT NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    status VARCHAR(20) NOT NULL
);

CREATE TABLE entradas (
    id_entrada INT AUTO_INCREMENT PRIMARY KEY,
    data_entrada DATE NOT NULL,
    hora_entrada TIME NOT NULL,
    id_veiculo INT NOT NULL,
    id_vaga INT NOT NULL,
    FOREIGN KEY (id_veiculo)
	REFERENCES veiculos(id_veiculo),
    FOREIGN KEY (id_vaga)
	REFERENCES vagas(id_vaga)
);

CREATE TABLE saidas (
    id_saida INT AUTO_INCREMENT PRIMARY KEY,
    data_saida DATE NOT NULL,
    hora_saida TIME NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    id_entrada INT NOT NULL,
    FOREIGN KEY (id_entrada)
	REFERENCES entradas(id_entrada)
);

INSERT INTO clientes (nome, telefone) VALUES
('João Silva', '(34) 99911-2233'),
('Maria Oliveira', '(34) 99822-3344'),
('Carlos Souza', '(34) 99733-4455'),
('Ana Costa', '(34) 99644-5566'),
('Bruno Mendes', '(34) 99555-6677');

INSERT INTO veiculos (placa, modelo, tipo, id_cliente) VALUES
('ABC1D23', 'Fiat Uno', 'Carro', 1),
('EFG4H56', 'Honda CG 160', 'Moto', 1),
('IJK7L89', 'Toyota Corolla', 'Carro', 2),
('MNO1P23', 'Chevrolet Onix', 'Carro', 3),
('QRS4T56', 'Honda Biz', 'Moto', 4),
('UVW7X89', 'Volkswagen Gol', 'Carro', 5),
('YZA1B23', 'Hyundai HB20', 'Carro', 5);

INSERT INTO vagas (numero, tipo, status) VALUES
(1, 'Carro', 'Livre'),
(2, 'Carro', 'Livre'),
(3, 'Carro', 'Livre'),
(4, 'Carro', 'Livre'),
(5, 'Carro', 'Livre'),
(6, 'Carro', 'Ocupada'),
(7, 'Moto', 'Ocupada'),
(8, 'Moto', 'Livre');

INSERT INTO entradas (data_entrada, hora_entrada, id_veiculo, id_vaga) VALUES
('2026-11-20', '08:00:00', 1, 1),
('2026-11-20', '09:15:00', 3, 3),
('2026-11-21', '07:30:00', 5, 7),
('2026-11-21', '10:00:00', 6, 5),
('2026-11-23', '08:10:00', 2, 7),
('2026-11-23', '09:00:00', 4, 6);

INSERT INTO saidas (data_saida, hora_saida, valor, id_entrada) VALUES
('2026-11-20', '12:00:00', 10.00, 1),
('2026-11-20', '17:30:00', 25.00, 2),
('2026-11-21', '10:00:00', 12.00, 3),
('2026-11-21', '18:00:00', 30.00, 4);