-- PostgreSQL doesn't support changing SQL_MODE like MySQL
-- Remove the following line:
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- Create schema
CREATE SCHEMA IF NOT EXISTS mydb;

-- Switch to the schema
SET search_path TO mydb;

-- Table Autores
CREATE TABLE IF NOT EXISTS Autores (
  id_autor SERIAL PRIMARY KEY,
  nome_autor VARCHAR(45) NULL
);

-- Table Livros
CREATE TABLE IF NOT EXISTS Livros (
  id_livro SERIAL PRIMARY KEY,
  nome_livro VARCHAR(45) NULL,
  Autores_id_autor INT NOT NULL,
  ano_publicacao INT NULL,
  CONSTRAINT fk_Livros_Autores1
    FOREIGN KEY (Autores_id_autor)
    REFERENCES Autores (id_autor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Table Curso
CREATE TABLE IF NOT EXISTS Curso (
  id_curso SERIAL PRIMARY KEY,
  nome_curso VARCHAR(45) NULL
);

-- Table Alunos
CREATE TABLE IF NOT EXISTS Alunos (
  id_aluno SERIAL PRIMARY KEY,
  nome_aluno VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  Curso_id_curso INT NOT NULL,
  CONSTRAINT fk_Alunos_Curso1
    FOREIGN KEY (Curso_id_curso)
    REFERENCES Curso (id_curso)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Table Emprestimo
CREATE TABLE IF NOT EXISTS Emprestimo (
  id_emprestimo SERIAL PRIMARY KEY,
  data_emprestimo VARCHAR(45) NULL,
  multa INT NULL,
  data_devolucao VARCHAR(45) NULL,
  Alunos_id_aluno1 INT NOT NULL,
  Livros_id_livro INT NOT NULL,
  CONSTRAINT fk_Emprestimo_Alunos1
    FOREIGN KEY (Alunos_id_aluno1)
    REFERENCES Alunos (id_aluno)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Emprestimo_Livros1
    FOREIGN KEY (Livros_id_livro)
    REFERENCES Livros (id_livro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);




