create database lista01;
use lista01;

CREATE TABLE editora (
cod_editora INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
endereco VARCHAR(45)
);

CREATE TABLE autor (
cod_autor INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
sexo CHAR(1) NOT NULL,
data_nascimento DATE NOT NULL
);

CREATE TABLE livro (
cod_livro INT AUTO_INCREMENT PRIMARY KEY,
isbn VARCHAR(45),
titulo VARCHAR(45),
num_edicao INT,
preco FLOAT,
editora_cod_editora INT,
FOREIGN KEY (editora_cod_editora) REFERENCES editora(cod_editora)
ON UPDATE CASCADE
ON DELETE CASCADE
);

CREATE TABLE livro_autor (
cod_livro INT,
cod_autor INT,
PRIMARY KEY(cod_livro, cod_autor),
FOREIGN KEY (cod_livro) REFERENCES livro(cod_livro) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (cod_autor) REFERENCES autor(cod_autor) ON UPDATE CASCADE ON DELETE CASCADE
);

ALTER TABLE editora
RENAME COLUMN nome TO descricao;

ALTER TABLE autor 
MODIFY sexo VARCHAR(1) NOT NULL;

ALTER TABLE livro 
ADD CONSTRAINT uk_livro_isbn UNIQUE (isbn);

ALTER TABLE livro 
ALTER COLUMN preco SET DEFAULT 10.00;

ALTER TABLE livro 
DROP COLUMN num_edicao;
 
CREATE TABLE grupo (
id_grupo INT PRIMARY KEY NOT NULL,
nome VARCHAR (50) NOT NULL
);
ALTER TABLE editora
ADD COLUMN id_grupo INT;

ALTER TABLE editora
ADD CONSTRAINT fk_editora_grupo
FOREIGN KEY (id_grupo)
REFERENCES grupo(id_grupo)
ON DELETE CASCADE
ON UPDATE CASCADE;
