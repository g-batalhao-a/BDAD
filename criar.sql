PRAGMA foreign_keys = off;

DROP TABLE IF EXISTS localizacao;
DROP TABLE IF EXISTS supermercado;
DROP TABLE IF EXISTS pessoa;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS horario;
DROP TABLE IF EXISTS horariofuncionario;
DROP TABLE IF EXISTS pausa;
DROP TABLE IF EXISTS caixa;
DROP TABLE IF EXISTS automatica;
DROP TABLE IF EXISTS manual;
DROP TABLE IF EXISTS seccao;
DROP TABLE IF EXISTS compra;
DROP TABLE IF EXISTS produto;
DROP TABLE IF EXISTS quantidade;
DROP TABLE IF EXISTS responsavel;
DROP TABLE IF EXISTS trabalha;
DROP TABLE IF EXISTS possui;


CREATE TABLE localizacao(
idlocalizacao INTEGER,
codigo_postal VARCHAR2(50) NOT NULL,
morada VARCHAR2(255) NOT NULL,
localidade VARCHAR2(255) NOT NULL,
CONSTRAINT localizacao_pk PRIMARY KEY (idlocalizacao)
);

CREATE TABLE horario(
idhorario INTEGER,
hora_inicial DATE ,
hora_final DATE ,
CONSTRAINT horario_pk PRIMARY KEY (idhorario),
CONSTRAINT date_check CHECK(hora_inicial<hora_final)
);

CREATE TABLE horariofuncionario(
idhorariofuncionario INTEGER,
idhorario INTEGER REFERENCES horario ON DELETE SET NULL ON UPDATE CASCADE,
dia_da_semana VARCHAR2(50),
CONSTRAINT horariofuncionario_pk PRIMARY KEY (idhorario, idhorariofuncionario),
CONSTRAINT horariofuncionario_fk1 FOREIGN KEY (idhorario) REFERENCES horario,
CONSTRAINT day_check CHECK(dia_da_semana=="Segunda" OR dia_da_semana=="Terca" OR dia_da_semana=="Quarta" OR dia_da_semana=="Quinta" OR dia_da_semana=="Sexta" OR dia_da_semana=="Sabado" OR dia_da_semana=="Domingo")
);

CREATE TABLE supermercado(
idsupermercado INTEGER,
nome VARCHAR2(50) NOT NULL,
idlocalidade INTEGER REFERENCES localizacao ON DELETE SET NULL ON UPDATE CASCADE,
idhorario INTEGER REFERENCES horario ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT supermercado_pk PRIMARY KEY (idsupermercado),
CONSTRAINT supermercado_fk1 FOREIGN KEY (idlocalidade) REFERENCES localizacao,
CONSTRAINT supermercado_fk2 FOREIGN KEY (idhorario) REFERENCES horario
);

CREATE TABLE pessoa(
idpessoa INTEGER,
nif INTEGER CHECK((nif>100000000)AND (nif<400000000)),
nome VARCHAR2(50) NOT NULL,
data_de_nascimento DATE,
telefone INTEGER,
genero CHAR(1) DEFAULT '?',
idlocalidade INTEGER REFERENCES localizacao ON DELETE SET NULL ON UPDATE CASCADE,
UNIQUE(nif),
UNIQUE(nome,data_de_nascimento),
UNIQUE(telefone),
CONSTRAINT pessoa_pk PRIMARY KEY (idpessoa),
CONSTRAINT pessoa_fk1 FOREIGN KEY (idlocalidade) REFERENCES localizacao
);

CREATE TABLE funcionario(
idpessoa INTEGER REFERENCES pessoa ON DELETE SET NULL ON UPDATE CASCADE,
id INTEGER,
salario INTEGER NOT NULL,
idsupermercado INTEGER REFERENCES supermercado ON DELETE SET NULL ON UPDATE CASCADE,
idhorario INTEGER NOT NULL,
idhorariofuncionario INTEGER NOT NULL,
CONSTRAINT funcionario_pk PRIMARY KEY (idpessoa,id),
CONSTRAINT pessoa_fk1 FOREIGN KEY (idpessoa) REFERENCES pessoa,
CONSTRAINT pessoa_fk2 FOREIGN KEY (idsupermercado) REFERENCES supermercado,
CONSTRAINT pessoa_fk3 FOREIGN KEY (idhorario, idhorariofuncionario ) REFERENCES horariofuncionario(idhorario, idhorariofuncionario ) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT salario_check CHECK(salario>=700)
);

CREATE TABLE cliente(
idpessoa INTEGER REFERENCES pessoa ON DELETE SET NULL ON UPDATE CASCADE,
idcliente INTEGER,
numero_de_cliente INTEGER NOT NULL,
CONSTRAINT cliente_pk PRIMARY KEY (idpessoa,idcliente),
CONSTRAINT pessoa_fk1 FOREIGN KEY (idpessoa) REFERENCES pessoa
);

CREATE TABLE pausa(
idfuncionario INTEGER NOT NULL,
id INTEGER NOT NULL,
idhorario INTEGER NOT NULL,
idhorariofuncionario INTEGER NOT NULL,
hora_inicial_pausa_manha DATE,
hora_final_pausa_manha DATE,
hora_inicial_pausa_almoço DATE,
hora_final_pausa_almoço DATE,
hora_inicial_pausa_tarde DATE,
hora_final_pausa_tarde DATE,
CONSTRAINT pausa_pk PRIMARY KEY (idfuncionario,id),
CONSTRAINT pausa_fk1 FOREIGN KEY (idfuncionario,id) REFERENCES funcionario(idpessoa,id)ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT pessoa_fk2 FOREIGN KEY (idhorario,idhorariofuncionario) REFERENCES horariofuncionario(idhorario,idhorariofuncionario) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT date_check CHECK(hora_inicial_pausa_manha <hora_final_pausa_manha AND hora_final_pausa_manha<hora_inicial_pausa_almoço AND hora_inicial_pausa_almoço<hora_final_pausa_almoço AND hora_final_pausa_almoço<hora_inicial_pausa_tarde AND hora_inicial_pausa_tarde<hora_final_pausa_tarde)
);

CREATE TABLE caixa(
idcaixa INTEGER,
numero INTEGER NOT NULL,
aberta BOOLEAN DEFAULT false,
CONSTRAINT caixa_pk PRIMARY KEY (idcaixa)
);

CREATE TABLE automatica(
idcaixa INTEGER REFERENCES caixa ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT automatica_pk PRIMARY KEY (idcaixa),
CONSTRAINT automatica_fk1 FOREIGN KEY (idcaixa) REFERENCES caixa
);

CREATE TABLE manual(
idcaixa INTEGER REFERENCES caixa ON DELETE SET NULL ON UPDATE CASCADE,
idfuncionario INTEGER REFERENCES funcionario ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT manual_pk PRIMARY KEY (idcaixa,idfuncionario),
CONSTRAINT manual_fk1 FOREIGN KEY (idfuncionario) REFERENCES funcionario
);

CREATE TABLE seccao(
idseccao INTEGER,
nome VARCHAR2(50) NOT NULL,
idfuncionario INTEGER REFERENCES funcionario ON DELETE SET NULL ON UPDATE CASCADE,
idsupermercado INTEGER REFERENCES supermercado ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT seccao_pk PRIMARY KEY (idseccao),
CONSTRAINT seccao_fk1 FOREIGN KEY (idfuncionario) REFERENCES funcionario,
CONSTRAINT pessoa_fk2 FOREIGN KEY (idsupermercado) REFERENCES supermercado
);

CREATE TABLE compra(
idcompra INTEGER,
dia DATE NOT NULL,
hora DATE NOT NULL,
idcliente INTEGER REFERENCES cliente ON DELETE SET NULL ON UPDATE CASCADE,
idcaixa INTEGER REFERENCES caixa ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT compra_pk PRIMARY KEY (idcompra),
CONSTRAINT compra_fk1 FOREIGN KEY (idcliente) REFERENCES cliente,
CONSTRAINT pessoa_fk2 FOREIGN KEY (idcaixa) REFERENCES caixa
);

CREATE TABLE produto(
idproduto INTEGER,
preco INTEGER CHECK(preco>0),
quantidade_disponivel INTEGER CHECK(quantidade_disponivel>=0),
idseccao INTEGER REFERENCES seccao ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT produto_pk PRIMARY KEY (idproduto),
CONSTRAINT produto_fk1 FOREIGN KEY (idseccao) REFERENCES seccao
);

CREATE TABLE quantidade(
idproduto INTEGER REFERENCES produto ON DELETE SET NULL ON UPDATE CASCADE,
idcompra INTEGER REFERENCES compra ON DELETE SET NULL ON UPDATE CASCADE,
quantidade INTEGER CHECK(quantidade>0),
CONSTRAINT quantidade_pk PRIMARY KEY (idproduto, idcompra),
CONSTRAINT quantidade_fk1 FOREIGN KEY (idproduto) REFERENCES produto,
CONSTRAINT quantidade_fk2 FOREIGN KEY (idcompra) REFERENCES compra
);

CREATE TABLE responsavel(
idcaixa INTEGER REFERENCES caixa ON DELETE SET NULL ON UPDATE CASCADE,
idfuncionario INTEGER REFERENCES funcionario ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT responsavel_pk PRIMARY KEY (idcaixa,idfuncionario),
CONSTRAINT responsavel_fk1 FOREIGN KEY (idcaixa) REFERENCES caixa,
CONSTRAINT responsavel_fk2 FOREIGN KEY (idfuncionario) REFERENCES funcionario
);

CREATE TABLE trabalha(
idfuncionario INTEGER REFERENCES funcionario ON DELETE SET NULL ON UPDATE CASCADE,
idseccao INTEGER REFERENCES seccao ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT trabalha_pk PRIMARY KEY (idfuncionario,idseccao),
CONSTRAINT trabalha_fk1 FOREIGN KEY (idfuncionario) REFERENCES funcionario,
CONSTRAINT trabalha_fk2 FOREIGN KEY (idseccao) REFERENCES seccao
);

CREATE TABLE possui(
idcompra INTEGER REFERENCES compra ON DELETE SET NULL ON UPDATE CASCADE,
idproduto INTEGER REFERENCES produto ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT possui_pk PRIMARY KEY (idcompra,idproduto),
CONSTRAINT possui_fk1 FOREIGN KEY (idcompra) REFERENCES compra,
CONSTRAINT possui_fk2 FOREIGN KEY (idproduto) REFERENCES  produto
);

PRAGMA foreign_keys = on;
