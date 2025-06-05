drop table if exists Produto;
CREATE TABLE Produto (
    ID_Produto INTEGER NOT NULL PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    Preco FLOAT NOT NULL,
    Estoque INTEGER NOT NULL
);

CREATE TABLE Cliente (
    ID_Cliente INTEGER NOT NULL,
    CPF VARCHAR(15) NOT NULL PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    Ativo BOOLEAN NOT NULL
);

CREATE TABLE Funcionario (
    ID_Funcionario INTEGER NOT NULL PRIMARY KEY,
    CPF VARCHAR(15) NOT NULL,
    Cargo VARCHAR(100) NOT NULL,
    Nome VARCHAR(150) NOT NULL
);

CREATE TABLE Caixa (
    ID_Caixa INTEGER NOT NULL PRIMARY KEY,
    Num_Caixa INTEGER NOT NULL
);

CREATE TABLE Venda (
    ID_Venda INTEGER NOT NULL PRIMARY KEY,
    ID_Item INTEGER NOT NULL,
    Data DATE NOT NULL,
    ID_Funcionario INTEGER NOT NULL,
    Total FLOAT NOT NULL,
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario)
);

CREATE TABLE Item_Venda (
    ID_Item INTEGER NOT NULL PRIMARY KEY,
    ID_Venda INTEGER NOT NULL,
    ID_Produto INTEGER NOT NULL,
    Quantidade INTEGER NOT NULL,
    SubTotal FLOAT NOT NULL,
    FOREIGN KEY (ID_Venda) REFERENCES Venda(ID_Venda),
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto)
);

CREATE TABLE Pagamento (
    ID_Pagamento INTEGER NOT NULL PRIMARY KEY,
    Tipo VARCHAR(100) NOT NULL,
    Data DATE NOT NULL,
    Valor FLOAT NOT NULL
);

select * from Produto;

INSERT INTO Usuarios (cpf, codigocliente, nome, sobrenomecliente, endereco, numero, cep, datanascimento, email)
VALUES 
('123456789', '001', 'João', 'Silva', 'Rua A', 100, '12345678', '01011990', 'joao@email.com'),
('987654321', '002', 'Maria', 'Oliveira', 'Rua B', 200, '87654321', '02021985', 'maria@email.com');

INSERT INTO Produto (ID_Produto, Nome, Preco, Estoque)
VALUES 
('P001', 'Notebook', 3500.00, 10),
('P002', 'Mouse', 50.00, 100),
('P003', 'Teclado', 100.00, 50);

INSERT INTO Item_Venda (ID_Item, ID_Venda, ID_Produto, Quantidade, SubTotal)
VALUES 
('I001', '1', 'P001', 2, 7000.00),
('I002', '1', 'P002', 1, 50.00),
('I003', '2', 'P003', 1, 100.00);

INSERT INTO Venda (ID_Venda, VendaData, ID_Funcionario)
VALUES 
('1', '2025-04-08', 'F001'),
('2', '2025-04-07', 'F002');