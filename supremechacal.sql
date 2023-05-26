create database CRONOMETRAIS;
Use CRONOMETRAIS;

CREATE TABLE ADM(
CD_ADM INT PRIMARY KEY
AUTO_INCREMENT,
Key_senha VARCHAR(45),
NE_Email VARCHAR(45));

CREATE TABLE Provedora(
CD_Provedora INT PRIMARY KEY AUTO_INCREMENT,
NM_Provedora VARCHAR(65),
CD_CNPJ VARCHAR(35),
AS_Assinatura INT,
IM_Logo LONGTEXT,
NM_CEO VARCHAR(60));

CREATE TABLE Usuario(
cd_Usuario INT PRIMARY KEY
AUTO_INCREMENT,
NM_Nome VARCHAR(60),
Key_senha VARCHAR(60),
NE_Email VARCHAR(100),
NR_Telefone VARCHAR(20),
EN_Endereco VARCHAR(100),
AS_Assinatura INT,
IM_ImgPerfil LONGTEXT);

CREATE TABLE Rascron(
CD_Rascron INT PRIMARY KEY
AUTO_INCREMENT,
CD_Rastreamento INT,
NR_Serie INT,
NR_Modelo INT,
NR_Estoque INT);

CREATE TABLE Horarios(
CD_Horarios INT PRIMARY KEY
AUTO_INCREMENT);


CREATE TABLE Onibus(
CD_Onibus INT PRIMARY KEY
AUTO_INCREMENT,
CD_Placa VARCHAR(7),
RT_Rota LONGTEXT,
DS_Descricao VARCHAR(200),
BG_Bagagem INT,
AV_Avaliacao INT,
BA_Bagagem TINYINT,
ST_Status VARCHAR(15),
IM_Foto LONGTEXT,
id_Provedora INT,
FOREIGN KEY (id_Provedora) REFERENCES Provedora(CD_Provedora),
id_Rascron INT,
FOREIGN KEY (id_Rascron) REFERENCES Rascron(CD_Rascron),
id_Horarios INT,
FOREIGN KEY (id_Horarios) REFERENCES Horarios(CD_Horarios)
);

CREATE TABLE Tempos(
CD_Tempos INT PRIMARY KEY
AUTO_INCREMENT,
TP_Inicial INT,
TP_Final INT,
DS_Local INT,
id_Horarios INT,
FOREIGN KEY (id_Horarios)REFERENCES Horarios(CD_Horarios));

CREATE TABLE Avaliacao(
CD_Avaliacao INT PRIMARY KEY
AUTO_INCREMENT,
DS_Comentario LONGTEXT,
NT_Nota INT,
id_Usuario INT,
FOREIGN KEY (id_Usuario) REFERENCES Usuario(CD_Usuario),
id_Onibus INT,
FOREIGN KEY (id_Onibus) REFERENCES Onibus(CD_Onibus)
);
