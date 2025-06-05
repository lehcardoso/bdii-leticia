DROP DATABASE IF EXISTS supermercado;
CREATE DATABASE supermercado;
USE supermercado;

CREATE TABLE Usuarios (
    cpf CHAR(11) NOT NULL PRIMARY KEY,
    codigocliente CHAR(3),
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(80) NOT NULL,
    cidade VARCHAR(80),
    numero INT NOT NULL,
    cep CHAR(9) NOT NULL,
    datanascimento DATE,
    email VARCHAR(180)
);

CREATE TABLE Produto (
    ID_Produto VARCHAR(100) NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Preco FLOAT NOT NULL,
    Estoque INT NOT NULL,
    PRIMARY KEY (ID_Produto)
);

CREATE TABLE Venda (
    ID_Venda VARCHAR(100) NOT NULL,
    VendaData DATE NOT NULL,
    ID_Funcionario VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID_Venda)
);

CREATE TABLE Item_Venda (
    ID_Item VARCHAR(100) NOT NULL,
    ID_Venda VARCHAR(100) NOT NULL,
    ID_Produto VARCHAR(100) NOT NULL,
    Quantidade INT NOT NULL,
    SubTotal FLOAT NOT NULL,
    PRIMARY KEY (ID_Item),
    FOREIGN KEY (ID_Venda) REFERENCES Venda(ID_Venda),
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto)
);