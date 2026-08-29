CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE Autores (
    id_autor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero_literario VARCHAR(50) NOT NULL
);

CREATE TABLE Livros (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    id_autor INT,
    ano_publicacao INT NOT NULL,
    genero VARCHAR(50),
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor)
);

CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL, 
    email VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

CREATE TABLE Emprestimos (
    id_emprestimo INT PRIMARY KEY,
    id_livro INT NOT NULL,
    id_usuario INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    FOREIGN KEY (id_livro) REFERENCES Livros(id_livro),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

INSERT INTO Autores VALUES 
(1, 'Machado de Assis', 'Brasileira', '1839-06-21', 'Romance'),
(2, 'J.K. Rowling', 'Britânica', '1965-07-31', 'Fantasia'),
(3, 'George Orwell', 'Britânica', '1903-06-25', 'Distopia');

INSERT INTO Livros VALUES 
(1, 'Dom Casmurro', 1, 1899, 'Romance'),
(2, 'Harry Potter e a Pedra Filosofal', 2, 1997, 'Fantasia'),
(3, '1984', 3, 1949, 'Distopia');

INSERT INTO Usuarios VALUES 
(1, 'Ana Silva', 'ana@gmail.com', '1990-05-10', 'São Paulo'),
(2, 'Carlos Souza', 'carlos@gmail.com', '1985-09-20', 'Rio de Janeiro'),
(3, 'Mariana Lima', 'mariana@gmail.com', '2000-12-01', 'Belo Horizonte');

INSERT INTO Emprestimos VALUES 
(1, 1, 1, '2025-04-01', '2025-04-10'),
(2, 2, 2, '2025-04-02', NULL),
(3, 3, 3, '2025-04-05', NULL);

INSERT INTO Autores VALUES 
(4, 'Clarice Lispector', 'Brasileira', '1920-12-10', 'Romance'),
(5, 'José Saramago', 'Portuguesa', '1922-11-16', 'Romance'),
(6, 'Agatha Christie', 'Britânica', '1890-09-15', 'Mistério'),
(7, 'Stephen King', 'Americana', '1947-09-21', 'Terror'),
(8, 'Gabriel García Márquez', 'Colombiana', '1927-03-06', 'Realismo Mágico');


INSERT INTO Livros VALUES 
(4, 'A Hora da Estrela', 4, 1977, 'Romance'),
(5, 'Ensaio sobre a Cegueira', 5, 1995, 'Romance'),
(6, 'O Alienista', 1, 1882, 'Romance'),
(7, 'Memórias Póstumas de Brás Cubas', 1, 1881, 'Romance'),
(8, 'Assassinato no Expresso do Oriente', 6, 1934, 'Mistério'),
(9, 'O Iluminado', 7, 1977, 'Terror'),
(10, 'Cem Anos de Solidão', 8, 1967, 'Realismo Mágico'),
(11, 'Harry Potter e a Câmara Secreta', 2, 1998, 'Fantasia'),
(12, 'Harry Potter e o Prisioneiro de Azkaban', 2, 1999, 'Fantasia'),
(13, 'A Revolução dos Bichos', 3, 1945, 'Distopia'),
(14, 'O Cortiço', 4, 1890, 'Romance');

INSERT INTO Usuarios VALUES 
(4, 'João Pereira', 'joao@gmail.com', '1995-08-15', 'Curitiba'),
(5, 'Fernanda Oliveira', 'fernanda@gmail.com', '1992-03-25', 'São Paulo'),
(6, 'Pedro Santos', 'pedro@gmail.com', '1988-11-12', 'Curitiba'),
(7, 'Juliana Costa', 'juliana@gmail.com', '1997-07-08', 'Rio de Janeiro'),
(8, 'Rafael Almeida', 'rafael@gmail.com', '1983-02-18', 'Belo Horizonte'),
(9, 'Beatriz Martins', 'beatriz@gmail.com', '2001-06-30', 'São Paulo'),
(10, 'Lucas Ferreira', 'lucas@gmail.com', '1994-10-05', 'Brasília'),
(11, 'Camila Rodrigues', 'camila@gmail.com', '1999-01-22', 'Curitiba'),
(12, 'Gustavo Mendes', 'gustavo@gmail.com', '1987-04-17', 'Brasília'),
(13, 'Larissa Gomes', 'larissa@gmail.com', '1996-09-14', 'Goiânia'),
(14, 'Bruno Carvalho', 'bruno@gmail.com', '1991-12-03', 'Uberlândia');

INSERT INTO Emprestimos VALUES 
(4, 4, 4, '2025-01-10', '2025-01-25'),
(5, 5, 5, '2025-01-15', NULL),
(6, 6, 6, '2025-02-01', '2025-03-10'),
(7, 7, 7, '2025-02-05', '2025-02-20'),
(8, 8, 8, '2025-02-10', NULL),
(9, 9, 9, '2025-02-15', '2025-03-20'),
(10, 10, 10, '2025-03-01', NULL),
(11, 1, 11, '2025-03-05', '2025-03-15'),
(12, 2, 12, '2025-03-10', NULL),
(13, 3, 13, '2025-03-15', '2025-04-20'),
(14, 4, 1, '2025-04-01', '2025-04-15'),
(15, 5, 6, '2025-04-05', NULL),
(16, 1, 7, '2025-04-10', NULL),
(17, 6, 2, '2025-04-15', '2025-04-25'),
(18, 7, 3, '2025-04-20', NULL),
(19, 8, 11, '2025-05-01', '2025-05-20'),
(20, 9, 5, '2025-05-05', NULL),
(21, 10, 4, '2025-05-10', '2025-06-15'),
(22, 11, 5, '2025-05-15', NULL),
(23, 12, 8, '2025-05-20', '2025-06-05');

-- 1 
UPDATE usuarios
SET cidade = 'Brasilia'
WHERE nome = 'Carlos Souza';

-- 2
INSERT INTO usuarios(id_usuario, nome, email, data_nascimento, cidade) 
VALUES ('15', 'João Pereira', 'joao@gmail.com', '1995-08-15', 'Curitiba');

-- 3 
ALTER TABLE usuarios
ADD COLUMN telefone VARCHAR(20);

-- 4
SELECT nome, email FROM usuarios
WHERE cidade = 'São Paulo';

-- 5 
CREATE TABLE reservas (
	id_reserva INT PRIMARY KEY,
    id_usuario INT,
    id_livro INT,
    data_reserva DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
    );
    
-- 6 
SELECT u.nome, l.titulo FROM usuarios u
JOIN emprestimos e ON u.id_usuario = e.id_usuario 
JOIN livros l ON e.id_livro = l.id_livro
WHERE data_devolucao IS NULL;

-- 7 
SELECT a.nome FROM autores a
JOIN livros l ON a.id_autor = l.id_autor
WHERE l.id_livro IN (SELECT id_livro FROM emprestimos WHERE data_devolucao IS NULL
);

-- 8 
SELECT l.titulo FROM livros l
JOIN emprestimos e ON l.id_livro = e.id_livro
WHERE e.data_emprestimo = (SELECT MAX(data_emprestimo) FROM emprestimos);

-- 9 
SELECT u.nome, a.nome FROM usuarios u
JOIN emprestimos e ON u.id_usuario = e.id_usuario
JOIN livros l ON e.id_livro = l.id_livro
JOIN autores a ON l.id_autor = a.id_autor;

-- 10
SELECT u.nome FROM usuarios u
JOIN emprestimos e ON u.id_usuario = e.id_usuario 
WHERE data_emprestimo IS NULL

-- 11
SELECT u.nome, l.titulo, e.data_emprestimo FROM usuarios u
JOIN E
