> [!NOTE]
> Tabelas complementares à realização da atividade:
> [ALUNO e EMPRESTIMO](https://github.com/alcangio/db-ESCOLA/blob/main/Imagem01_Atividade06_BancoDeDadosI.png), 
> [LIVRO_EMPRESTIMO](https://github.com/alcangio/db-ESCOLA/blob/main/Imagem02_Atividade06_BancoDeDadosI.png) e
> [LIVRO e SESSÃO](https://github.com/alcangio/db-ESCOLA/blob/main/Imagem03_Atividade06_BancoDeDadosI.png).


# 🗃 Criando um novo banco de dados
- [ ] no Sistema de Gerenciamento de Banco de Dados (SGBD) crie um novo banco de dados:
```
CREATE DATABASE escola;
```
- [ ] selecione o banco de dados recém-criado "escola" no ambiente:
```
USE escola;
```

## 🧾 Criando uma nova tabela
- [ ] crie uma tabela chamada ALUNO
### 🔖 Defina os atributos da tabela:
- [ ] adicione a chave primária de nome ID
- [ ] adicione um atributo nome do tipo varchar
- [ ] adicione um atributo e-mail do tipo varchar
- [ ] adicione um atributo endereço do tipo varchar
```
--criar tabela aluno
CREATE TABLE ALUNO (
  ID SERIAL PRIMARY KEY,
  nome VARCHAR(20) NOT NULL,
  email VARCHAR(20),
  endereco VARCHAR(50)
);

--incluir atributos na tabela ALUNO conforme tabela complementar
ALTER table aluno
add COLUMN matricula VARCHAR(5) NOT NULL,
add COLUMN telefone VARCHAR(15);

--inserir valores na tabela ALUNO
INSERT INTO ALUNO (nome, email, endereco, matricula, telefone) VALUES
  ('João Carlos','Jcarlos@gmail.com', 'Rua 13 de maio', 1234, '(11)7825-4489'),
  ('José Vitor', 'Jvitor@gmail.com', 'Rua da sSudade', 2345, '(11)7825-6589'),
  ('Paulo André', 'Pandr@gmail.com', 'Rua do Sol', 3456, '(11)7825-4495');
```
