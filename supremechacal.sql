CREATE DATABASE lojaroupa;
USE lojaroupa;

CREATE TABLE cliente(
cd_cliente INT PRIMARY KEY AUTO_INCREMENT,
nm_nome VARCHAR(450),
cartao BOOLEAN,
idade INT(10));

CREATE TABLE fornecedor(
cd_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(450),
nomemarca VARCHAR(450));

CREATE TABLE estoque(
cd_estoque INT PRIMARY KEY AUTO_INCREMENT,
qt_roupas INT(10));

CREATE TABLE roupa(
cd_roupa INT PRIMARY KEY AUTO_INCREMENT,
vl_roupa DECIMAL(45),
ds_cor VARCHAR(100),
ds_tipo VARCHAR(100),
tamanho DECIMAL(45),
id_estoque INT,
FOREIGN KEY (id_estoque) REFERENCES estoque(cd_estoque),
id_fonecedor INT,
FOREIGN KEY (id_fonecedor) REFERENCES fornecedor(cd_fornecedor));

CREATE TABLE categoria(
cd_categoria INT PRIMARY KEY AUTO_INCREMENT,
ds_sexo VARCHAR(200),
ds_estilo VARCHAR(200),
ds_cultura VARCHAR(200),
id_roupa INT,
FOREIGN KEY (id_roupa) REFERENCES roupa(cd_roupa));

CREATE TABLE carrinho(
cd_carrinho INT PRIMARY KEY AUTO_INCREMENT,
id_roupa INT,
FOREIGN KEY (id_roupa) REFERENCES roupa(cd_roupa),
id_cliente INT,
FOREIGN KEY (id_cliente) REFERENCES cliente(cd_cliente),
quantidade INT(45));

CREATE TABLE compra(
cd_compra INT PRIMARY KEY AUTO_INCREMENT,
id_carrinho INT,
FOREIGN KEY (id_carrinho) REFERENCES carrinho(cd_carrinho));
valor DECIMAL(45);
datacompra VARCHAR(45));
