CREATE DATABASE melhor_preco;

CREATE TABLE provincias(
    codigo_provincia int auto_increment PRIMARY KEY,
    nome varchar(50)
); 

CREATE TABLE municipios(
    codigo_municipio int auto_increment PRIMARY KEY,
    nome varchar(50),
    codigo_provincia int,
    FOREIGN KEY (codigo_provincia) REFERENCES provincias(codigo_provincia)
);

CREATE TABLE bairros(
    codigo_bairro int auto_increment PRIMARY KEY,
    codigo_municipio int,
    nome varchar(50),
    FOREIGN KEY (codigo_municipio) REFERENCES municipios(codigo_municipio)
);

CREATE TABLE ruas(
    codigo_rua int  auto_increment PRIMARY KEY,
    nome varchar(50),
    codigo_municipio int,
    FOREIGN KEY (codigo_municipio) REFERENCES municipios(codigo_municipio)
);

CREATE TABLE lojas(
    codigo_loja int  auto_increment PRIMARY KEY,
    nome varchar(50),
    descricao text,
    foto varchar(32),
    codigo_bairro int,
    codigo_rua int,        
    FOREIGN KEY (codigo_bairro) REFERENCES bairros(codigo_bairro),
    FOREIGN KEY (codigo_rua) REFERENCES ruas(codigo_rua)
);

CREATE TABLE produtos(
    codigo_produto int  auto_increment PRIMARY KEY,
    nome varchar(50),
    descricao text,   
    foto varchar(32)
);

CREATE TABLE stocks(
    codigo_produto int,
    codigo_loja int,
    preco float,
    quantidade int,    
    PRIMARY KEY (codigo_produto, codigo_loja),
    FOREIGN KEY (codigo_produto) REFERENCES produtos(codigo_produto),
    FOREIGN KEY (codigo_loja) REFERENCES lojas(codigo_loja)
);

CREATE TABLE utilizadores(
	codigo_utilizador int auto_increment PRIMARY KEY,
    nome varchar(50),
    nome_utilizador varchar(20),
    email varchar(50),
    palavra_passe varchar(50),
    tipo char(1),
    foto varchar(32)
);

CREATE TABLE listas_compras(
    codigo_utilizador int,
    codigo_produto int,
    codigo_loja int,
    quantidade int,
    data_hora_criacao datetime,
    estado char(1),
    PRIMARY KEY (codigo_utilizador, codigo_produto, codigo_loja),
    FOREIGN KEY (codigo_utilizador) REFERENCES utilizadores(codigo_utilizador),
    FOREIGN KEY (codigo_produto) REFERENCES produtos(codigo_produto),
    FOREIGN KEY (codigo_loja) REFERENCES lojas(codigo_loja)
);

CREATE USER 'newuser'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost';
