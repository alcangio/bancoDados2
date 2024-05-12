> [!NOTE]
> Tabelas complementares à realização da atividade:
> [ALUNO e EMPRESTIMO](https://github.com/alcangio/db-ESCOLA/blob/main/Imagem01_Atividade06_BancoDeDadosI.png), 
> [LIVRO_EMPRESTIMO](https://github.com/alcangio/db-ESCOLA/blob/main/Imagem02_Atividade06_BancoDeDadosI.png) e
> [LIVRO e SESSÃO](https://github.com/alcangio/db-ESCOLA/blob/main/Imagem03_Atividade06_BancoDeDadosI.png).

# Desenvolvimentos 1 #101863 e 2 #101859
Desenvolva um banco de dados: adicione tabelas e determine quais são os atributos de cada uma, relacione tabelas através de chaves estrangeiras ou nomes de colunas iguais:
- [ ] crie uma base de dados; 
- [ ] crie tabelas nessa base de dados;
- [ ] em cada tabela, adicione atributos;
- [ ] insira dados em cada tabela;
- [ ] utilize os comandos Joins para realizar consultas nas tabelas
- [ ] execute um trigger que se relacione com algum comando, como insert, select, delete ou update

## ✔ Criando uma base de dados no MySQL
```
CREATE DATABASE db-escola;
```
## ✔ Criando as tabelas e adicionando seus atributos e dados
### 👨🏼‍🎓 Aluno
**criando a tabela 'aluno'**
```
CREATE TABLE aluno (
    id INT,
    nome VARCHAR(25) NOT NULL,
    matricula INT PRIMARY KEY NOT NULL,
    email VARCHAR(25),
    endereco VARCHAR(25),
    telefone VARCHAR(15)
);
```
**inserindo valores na tabela 'aluno'**
```
INSERT INTO aluno('id', 'nome', 'matricula', 'email', 'endereco', 'telefone')
VALUES (01, 'João Carlos', 1234, 'Jcarlos@gmail.com', 'Rua 13 de maio','(11)7825-4489');
INSERT INTO aluno('id', 'nome', 'matricula', 'email', 'endereco', 'telefone')
VALUES (02, 'José Vitor', 2345, 'Jvitor@gmail.com', 'Rua da Saudade','(11)7825-6589');
INSERT INTO aluno('id', 'nome', 'matricula', 'email', 'endereco', 'telefone')
VALUES (03, 'Paulo André', 3456, 'Pandr@gmail.com', 'Rua do Sol','(11)7825-4495');
```
**projeção da tabela 'aluno'**
```
SELECT * FROM aluno;
```
![image](https://github.com/alcangio/bancoDados2/assets/142796669/f92f4867-aa4f-4ee5-9dec-f6e96d1c4303)

### 📤 Empréstimo
**criando a tabela 'emprestimo'**
```
CREATE TABLE emprestimo (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    data_hora TIMESTAMP NOT NULL,
    matric_aluno INT NOT NULL,
    data_devolucao DATE,
    CONSTRAINT FOREIGN KEY (matric_aluno)
    	REFERENCES aluno(matricula)
);
```
**inserindo valores na tabela 'emprestimo'**
```
INSERT INTO emprestimo (data_hora, matric_aluno, data_devolucao)
VALUES ('2022-03-12 15:25:00', 1234, '2022-03-15');
INSERT INTO emprestimo (data_hora, matric_aluno, data_devolucao)
VALUES ('2022-03-15 14:32:00', 3456, '2022-03-18');
INSERT INTO emprestimo (data_hora, matric_aluno, data_devolucao)
VALUES ('2022-03-20 03:51:00', 2345, '2022-03-23');
```
**projeção da tabela 'emprestimo'**
```
SELECT * FROM emprestimo;
```
![image](https://github.com/alcangio/bancoDados2/assets/142796669/82a0fb1f-a3ed-4c43-86f5-182f9b2e1c8d)

### 📽 Sessão
**criando a tabela 'sessao'**
```
CREATE TABLE sessao (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(10) NOT NULL,
    localizacao VARCHAR(15)
);
```
**inserindo valores na tabela 'sessao'**
```
INSERT INTO sessao (descricao, localizacao)
VALUES ('Sessao1','Partilheira1');
INSERT INTO sessao (descricao, localizacao)
VALUES ('Sessao2','Partilheira2');
INSERT INTO sessao (descricao, localizacao)
VALUES ('Sessao3','Partilheira3');
```
**projeção da tabela 'sessao'**
```
SELECT * FROM sessao;
```
![image](https://github.com/alcangio/bancoDados2/assets/142796669/2859b1d3-fb12-44e5-80ee-80b3c38970fe)

### 📖 Livro
**criando a tabela 'livro'**
```
CREATE TABLE livro (
    cod_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    cod_sessao INT NOT NULL,
    CONSTRAINT FOREIGN KEY (cod_sessao)
    	REFERENCES sessao(codigo)
);
```
**inserindo valores na tabela 'livro'**
```
INSERT INTO livro (titulo, autor, cod_sessao)
VALUES ('Modelo Conceitual e Diagramas ER','Pressman, Roger S.', 3);
INSERT INTO livro (titulo, autor, cod_sessao)
VALUES ('Livro 2: Modelo Relacional e Álgebra Relacional','Heuser, Carlos Alberto', 1);
INSERT INTO livro (titulo, autor, cod_sessao)
VALUES ('Livro 3: Linguagem SQL','Beighley, Lynn', 2);
```
**projeção da tabela 'livro'**
```
SELECT * FROM livro;
```
![image](https://github.com/alcangio/bancoDados2/assets/142796669/13568841-5ca7-476e-9600-065de6023a26)

### 📑 Livro-Empréstimo
**criando a tabela 'livro-emprestimo'**
```
CREATE TABLE livro_emprestimo (
	cod_livro INT NOT NULL,
	cod_emprestimo INT NOT NULL,
	CONSTRAINT FOREIGN KEY (cod_livro)
		REFERENCES livro(cod_livro),
	CONSTRAINT FOREIGN KEY (cod_emprestimo)
		REFERENCES emprestimo(codigo)
);
```
**inserindo valores na tabela 'livro-emprestimo'**
```
INSERT INTO livro_emprestimo (cod_livro, cod_emprestimo)
VALUES (3, 1);
INSERT INTO livro_emprestimo (cod_livro, cod_emprestimo)
VALUES (1, 3);
INSERT INTO livro_emprestimo (cod_livro, cod_emprestimo)
VALUES (2, 2);
```
**projeção da tabela 'livro-emprestimo'**
```
SELECT * FROM livro-emprestimo;
```
![image](https://github.com/alcangio/bancoDados2/assets/142796669/91ebf162-300b-474c-9938-3ae7aa7222ca)

## ✔ Utilizando os comandos JOIN para realizar consultas
### 🔍 Consultando localização dos livros na biblioteca
```
SELECT titulo, localizacao
FROM livro INNER JOIN sessao
ON sessao.codigo = livro.cod_sessao;
```
![image](https://github.com/alcangio/bancoDados2/assets/142796669/a30bba83-88b5-430d-9cf9-2ad30bafcc50)
### 🔍 Consultando nome e telefone dos alunos que pegaram livros emprestados, informar a data de devolução e ordenar alfabeticamente pelo nome do aluno
```
SELECT nome, telefone, data_devolucao
FROM aluno INNER JOIN emprestimo
ON aluno.matricula = emprestimo.matric_aluno
ORDER BY aluno.nome;
```
![image](https://github.com/alcangio/bancoDados2/assets/142796669/9e53c742-475a-42e8-a89d-f8187c448479)

### 🔍 Consultando quais alunos pegaram livros emprestados, seus títulos e a data do empréstimo
```
SELECT data_hora, nome, titulo
FROM emprestimo 
INNER JOIN aluno ON 
emprestimo.matric_aluno = aluno.matricula
INNER JOIN livro_emprestimo ON 
emprestimo.codigo = livro_emprestimo.cod_emprestimo
INNER JOIN livro
ON livro.cod_livro = livro_emprestimo.cod_livro
```
![image](https://github.com/alcangio/bancoDados2/assets/142796669/89adca19-2afb-484f-80cc-572b8b05f6df)

## ✔ Adicionando um trigger (gatilho)
### 🔔 'definir_datas_emprestimo_devolucao'
Ao inserir novo registro na tabela 'emprestimo', os atributos *data_hora* e *data_devolucao* serão definidos automaticamente - data e hora atuais e 7 dias adiante:
```
DELIMITER //

CREATE TRIGGER definir_datas_emprestimo_devolucao
BEFORE INSERT ON emprestimo
FOR EACH ROW
BEGIN
	SET NEW.data_hora = CURRENT_TIMESTAMP;
    SET NEW.data_devolucao = ADDDATE(NEW.data_hora, INTERVAL 7 DAY);
END;
//

DELIMITER ;
```
![image](https://github.com/alcangio/bancoDados2/assets/142796669/a1a3c57b-ee71-40a8-8573-03a03c71eedb)

**Inserindo novo registro na tabela 'emprestimo', informando valor apenas para o atributo 'matric_aluno'**
```
INSERT INTO emprestimo (matric_aluno) VALUES (1234);
```
**Projetando a tabela 'emprestimo**
```
SELECT * FROM emprestimo;
```
![image](https://github.com/alcangio/bancoDados2/assets/142796669/c1f37612-d08c-4092-9e0d-613b0cf2f450)
