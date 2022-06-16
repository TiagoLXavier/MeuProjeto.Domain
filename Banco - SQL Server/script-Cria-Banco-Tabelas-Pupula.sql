use master;
go

CREATE DATABASE MeuProjeto
GO

use MeuProjeto;
go

CREATE TABLE Clientes (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  Nome VARCHAR(100) NOT NULL,
  Cpf VARCHAR(14) NOT NULL,
  UF VARCHAR(2) NOT NULL,
  Celular VARCHAR(20) NOT NULL
 );
GO

CREATE TABLE Financiamentos (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  IdCliente INT NOT NULL,
  Cpf VARCHAR(14) NOT NULL, 
  TipoFinanciamento VARCHAR(20) NOT NULL,
  ValorTotal DECIMAL(15,2) NOT NULL,
  DatadoUltimoVencimento DATE NOT NULL
  CONSTRAINT fk_IdCliente FOREIGN KEY (IdCliente)
  REFERENCES Clientes (Id)
 );
 GO

CREATE TABLE Parcelas (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  IdFinanciamento INT NOT NULL,
  NumerodaParcela INT NOT NULL,
  ValorParcela DECIMAL(15,2) NOT NULL, 
  DataVencimento DATE NOT NULL,
  DataPagamento DATE NULL
  CONSTRAINT fk_IdFinanciamento FOREIGN KEY (IdFinanciamento)
  REFERENCES Financiamentos (Id)
 );
 GO


 INSERT INTO CLIENTES (Nome,Cpf,UF,Celular) VALUES ('Tiago','994.689.640-00','SP','(19) 99651-1774');
 INSERT INTO CLIENTES (Nome,Cpf,UF,Celular) VALUES ('André','719.262.760-78','SP','(19) 99651-1775');
 INSERT INTO CLIENTES (Nome,Cpf,UF,Celular) VALUES ('Eliane','317.012.960-04','SP','(19) 99651-1776');
 INSERT INTO CLIENTES (Nome,Cpf,UF,Celular) VALUES ('Dita','924.898.520-35','BA','(19) 99651-1777');
 INSERT INTO CLIENTES (Nome,Cpf,UF,Celular) VALUES ('Maria','405.896.250-04','SP','(19) 99651-1778');
 INSERT INTO CLIENTES (Nome,Cpf,UF,Celular) VALUES ('Edmar','134.252.330-09','BA','(19) 99651-1779');
 GO

 INSERT INTO Financiamentos (IdCliente,Cpf,TipoFinanciamento,ValorTotal,DatadoUltimoVencimento) VALUES (1,'994.689.640-00','Crédito Imobiliário',50000.00,GETDATE()+30);
 INSERT INTO Financiamentos (IdCliente,Cpf,TipoFinanciamento,ValorTotal,DatadoUltimoVencimento) VALUES (2,'719.262.760-78','Crédito Direto',60000.00,GETDATE()+60);
 INSERT INTO Financiamentos (IdCliente,Cpf,TipoFinanciamento,ValorTotal,DatadoUltimoVencimento) VALUES (3,'317.012.960-04','Crédito Consignado',70000.00,GETDATE()+120);
 INSERT INTO Financiamentos (IdCliente,Cpf,TipoFinanciamento,ValorTotal,DatadoUltimoVencimento) VALUES (4,'924.898.520-35','Crédito Imobiliário',50000.00,GETDATE()+30);
 INSERT INTO Financiamentos (IdCliente,Cpf,TipoFinanciamento,ValorTotal,DatadoUltimoVencimento) VALUES (5,'405.896.250-04','Crédito Direto',60000.00,GETDATE()+60);
 INSERT INTO Financiamentos (IdCliente,Cpf,TipoFinanciamento,ValorTotal,DatadoUltimoVencimento) VALUES (6,'134.252.330-09','Crédito Consignado',70000.00,GETDATE()+120);
 GO

 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (1,1,12500.00,GETDATE()-60,null);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (1,2,12500.00,GETDATE()-30,null);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (1,3,12500.00,GETDATE(),null);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (1,4,12500.00,GETDATE()+30,null);
 GO

 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (2,1,12000.00,GETDATE()-90,GETDATE()-91);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (2,2,12000.00,GETDATE()-60,GETDATE()-61);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (2,3,12000.00,GETDATE()-30,null);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (2,4,12000.00,GETDATE(),null);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (2,5,12000.00,GETDATE()+30,null);
 GO

 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (3,1,11666.67,GETDATE()-120,GETDATE()-91);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (3,2,11666.67,GETDATE()-90,GETDATE()-61);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (3,3,11666.67,GETDATE()-60,GETDATE()-31);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (3,4,11666.67,GETDATE() -30,GETDATE()-1);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (3,5,11666.67,GETDATE() ,GETDATE()-1);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (3,6,11666.67,GETDATE()+30,null);
 GO

 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (4,1,12500.00,GETDATE()-60,GETDATE()-58);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (4,2,12500.00,GETDATE()-30,null);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (4,3,12500.00,GETDATE(),null);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (4,4,12500.00,GETDATE()+30,null);
 GO

 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (5,1,12000.00,GETDATE()-90,GETDATE()-93);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (5,2,12000.00,GETDATE()-60,GETDATE()-63);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (5,3,12000.00,GETDATE()-30,GETDATE()-35);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (5,4,12000.00,GETDATE(),null);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (5,5,12000.00,GETDATE()+30,null);
 GO

 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (6,1,11666.67,GETDATE()-120,GETDATE()-125);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (6,2,11666.67,GETDATE()-90,GETDATE()-95);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (6,3,11666.67,GETDATE()-60,null);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (6,4,11666.67,GETDATE()-30,null);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (6,5,11666.67,GETDATE(), null);
 INSERT INTO Parcelas (IdFinanciamento,NumerodaParcela,ValorParcela,DataVencimento,DataPagamento) VALUES (6,6,11666.67,GETDATE()+30,null);
 GO
