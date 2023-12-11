-- Cria a tabela livro
CREATE TABLE livro (
    codigo SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    editora VARCHAR(255) NOT NULL,
    ano INTEGER NOT NULL CHECK (ano > 0),
    edicao INTEGER NOT NULL CHECK (edicao > 0),
    isbn VARCHAR(13) UNIQUE NOT NULL,
    exemplares INTEGER NOT NULL CHECK (exemplares >= 0)
);

select * from livro;

-- Cria a tabela aluno
CREATE TABLE aluno (
    matricula INT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(100),
    curso VARCHAR(100)
);

select * from aluno;

-- Cria a tabela autor
CREATE TABLE autor (
    id_autor SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    nacionalidade VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL
);
select * from autor;

-- Cria a tabela emprestimo
CREATE TABLE emprestimo (
    id_emprestimo INT PRIMARY KEY,
    matricula INT,
    isbn VARCHAR(13),
    data_emprestimo DATE,
    data_devolucao DATE,
    multa BOOLEAN,
    FOREIGN KEY (matricula) REFERENCES aluno(matricula),
    FOREIGN KEY (isbn) REFERENCES livro(isbn)
);

select * from emprestimo;


-- Inserir dados dos livros
INSERT INTO livro (titulo, editora, ano, edicao, isbn, exemplares) VALUES
('Data Science do Zero', 'O''Reilly Media', 2015, 1, '9781491957664', 1),
('Python para Análise de Dados', 'Novatec', 2018, 1, '9788575224467', 1),
('Banco de Dados', 'Bookman', 2009, 1, '9788576082675', 1),
('Mineração de Dados', 'Bookman', 2011, 1, '9788576083375', 1),
('Big Data: A Revolução dos Dados', 'Leya', 2014, 1, '9788582601572', 1),
('A Arte de Transformar Dados em Insight', 'Globolivros', 2017, 1, '9788550809184', 1),
('Estatística Básica', 'Saraiva', 2017, 1, '9788573076103', 1),
('Avaliação de Desempenho de Sistemas Computacionais', 'Bookman', 2013, 1, '9788576084778', 1),
('Análise de Dados com Python', 'Leya', 2018, 1, '9788582600087', 1),
('Machine Learning: Guia de Referência Rápida', 'Novatec', 2019, 1, '9788550805780', 1),
('Data Science para Negócios', 'Elsevier', 2013, 1, '9788535273806', 1),
('R para Estatísticos', 'Novatec', 2013, 1, '9788575227185', 1),
('Deep Learning', 'Elsevier', 2016, 1, '9788535279723', 1),
('Análise de Dados com Power BI', 'Alta Books', 2020, 1, '9788577805528', 1),
('Introdução à Mineração de Dados', 'Novatec', 2003, 1, '9788550808873', 1),
('Tableau: Guia Completo', 'Alta Books', 2019, 1, '9788577806068', 1),
('SQL Performance Explained', 'Alta Books', 2012, 1, '9788577806068', 1),
('Big Data: Técnicas e Tecnologias para Extração de Valor', 'Bookman', 2014, 1, '9788576089919', 1),
('Pandas: Tratamento e Análise de Dados', 'Novatec', 2018, 1, '9788550805803', 1),
('Probabilidade e Estatística para Engenharia e Ciências', 'Cengage Learning', 2016, 1, '9788575224467', 1),
('Aprendizado de Máquina', 'Novatec', 1997, 1, '9788575228120', 1),
('Mining the Social Web', 'Novatec', 2013, 1, '9788575228120', 1),
('Introduction to Data Mining', 'Novatec', 2006, 1, '9788550808644', 1),
('Estatística Aplicada à Administração e Economia', 'Cengage Learning', 2016, 1, '9788575226232', 1),
('Hadoop: The Definitive Guide', 'Novatec', 2012, 1, '9788575228021', 1),
('Data Science na Prática', 'Alta Books', 2021, 1, '9788577809489', 1),
('Avaliação de Desempenho de Sistemas Computacionais', 'Elsevier', 2015, 1, '9788535280651', 1),
('MongoDB: Construa Novas Aplicações com Novas Tecnologias', 'Alta Books', 2010, 1, '9788577801339', 1),
('Data Science para Leigos', 'Novatec', 2017, 1, '9788550809849', 1),
('Probabilidade e Estatística', 'Cengage Learning', 2012, 1, '9788575226232', 1)
ON CONFLICT (isbn) DO NOTHING;

-- Inserir dados dos autores
INSERT INTO autor (nome, nacionalidade, data_nascimento) VALUES
('Joel Grus', 'Americano', '30/12/1981'),
('Wes McKinney', 'Americano', '15/10/1981'),
('Carlos A. Heuser', 'Brasileiro', '23/04/1952'),
('Ian H. Witten', 'Neozelandês', '01/01/1957'),
('Kenneth Cukier', 'Americano', '01/01/1968'),
('Alberto Cairo', 'Espanhol', '01/01/1974'),
('Wilton O. Bussab', 'Brasileiro', '07/03/1934'),
('Paulo Lício de Geus', 'Brasileiro', '01/01/1945'),
('Tom M. Mitchell', 'Americano', '09/08/1951'),
('Matt Harrison', 'Americano', '01/01/1978'),
('Foster Provost', 'Americano', '01/01/1965'),
('Peter Dalgaard', 'Dinamarquês', '01/01/1959'),
('Ian Goodfellow', 'Americano', '01/01/1987'),
('Cristofer Englund', 'Austríaco', '01/01/1970'),
('Margaret H. Dunham', 'Americana', '01/01/1950'),
('George Peck', 'Americano', '01/01/1945'),
('Markus Winand', 'Austríaco', '01/01/1976'),
('Ricardo Pezzuol Jacobi', 'Brasileiro', '01/01/1955'),
('Jay L. Devore', 'Americano', '01/01/1947'),
('Tom White', 'Americano', '01/01/1970'),
('Daniel C. Furtado', 'Brasileiro', '01/01/1945'),
('Ruy de Oliveira', 'Brasileiro', '01/01/1940'),
('Kyle Banker', 'Americano', '01/01/1980'),
('Lillian Pierson', 'Americana', '01/01/1985'),
('George C. Canavos', 'Americano', '01/01/1933');

-- Inserir dados dos alunos
INSERT INTO aluno (matricula, nome, email, curso) VALUES
(1001, 'João Silva', 'joao.silva@universidade.com.br', 'Ciência de Dados'),
(1002, 'Maria Santos', 'maria.santos@universidade.com.br', 'Engenharia de Dados'),
(1003, 'Pedro Oliveira', 'pedro.oliveira@universidade.com.br', 'Estatística'),
(1004, 'Ana Pereira', 'ana.pereira@universidade.com.br', 'Ciência da Computação'),
(1005, 'Carlos Rocha', 'carlos.rocha@universidade.com.br', 'Sistemas de Informação'),
(1006, 'Fernanda Lima', 'fernanda.lima@universidade.com.br', 'Matemática Aplicada'),
(1007, 'Lucas Souza', 'lucas.souza@universidade.com.br', 'Engenharia Eletrônica'),
(1008, 'Mariana Oliveira', 'mariana.oliveira@universidade.com.br', 'Análise de Sistemas'),
(1009, 'Rodrigo Santos', 'rodrigo.santos@universidade.com.br', 'Inteligência Artificial'),
(1010, 'Juliana Costa', 'juliana.costa@universidade.com.br', 'Banco de Dados'),
(1011, 'Daniel Pereira', 'daniel.pereira@universidade.com.br', 'Ciência da Informação'),
(1012, 'Patrícia Lima', 'patricia.lima@universidade.com.br', 'Gestão da Tecnologia da Informação');

-- Inserir dados dos empréstimos
insert into emprestimo (id_emprestimo, matricula, isbn, data_emprestimo, data_devolucao, multa) VALUES
(1, 1001, '9781491957664', '01/12/2023', '15/12/2023', FALSE),
(2, 1002, '9788575224467', '05/12/2023', '19/12/2023', TRUE),
(3, 1003, '9788576082675', '10/12/2023', '24/12/2023', FALSE),
(4, 1004, '9788576083375', '15/12/2023', NULL, FALSE),
(5, 1005, '9788582601572', '20/12/2023', NULL, FALSE),
(6, 1006, '9788550809184', '25/12/2023', NULL, FALSE),
(7, 1007, '9788573076103', '30/12/2023', NULL, FALSE),
(8, 1008, '9788576084778', '05/01/2024', NULL, FALSE),
(9, 1009, '9788582600087', '10/01/2024', NULL, FALSE),
(10, 1010, '9788550805780', '15/01/2024', NULL, FALSE),
(11, 1011, '9788535273806', '20/01/2024', NULL, TRUE),
(12, 1012, '9788577806068', '25/01/2024', NULL, FALSE);

-- analise de dados Consultas

select count(*) as total_livros from livro; 

select titulo, ano from livro order by ano asc limit 3;

select nome, data_nascimento from autor order by data_nascimento desc limit 5;


