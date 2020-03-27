PRAGMA foreign_keys = off;

DROP TABLE IF EXISTS localizacao;
DROP TABLE IF EXISTS supermercado;
DROP TABLE IF EXISTS pessoa;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS horario;
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
morada VARCHAR2(200) NOT NULL,
localidade VARCHAR2(50) NOT NULL,
CONSTRAINT localizacao_pk PRIMARY KEY (idlocalizacao)
);

CREATE TABLE supermercado(
idsupermercado INTEGER,
nome VARCHAR2(50) NOT NULL,
idlocalidade INTEGER REFERENCES localizacao(idlocalizacao) ON DELETE SET NULL ON UPDATE CASCADE,
idhorario INTEGER REFERENCES horario(idhorario) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT supermercado_pk PRIMARY KEY (idsupermercado),
CONSTRAINT supermercado_fk1 FOREIGN KEY (idlocalidade) REFERENCES localizacao(idlocalizacao),
CONSTRAINT supermercado_fk2 FOREIGN KEY (idhorario) REFERENCES horario(idhorario)
);

CREATE TABLE pessoa(
idpessoa INTEGER,
nif INTEGER CHECK((nif>100000000)AND (nif<400000000)),
nome VARCHAR2(50) NOT NULL,
data_de_nascimento DATE,
telefone INTEGER,
genero CHAR(1) DEFAULT '?',
idlocalidade INTEGER REFERENCES localizacao(idlocalidade) ON DELETE SET NULL ON UPDATE CASCADE,
UNIQUE(nif),
UNIQUE(nome,data_de_nascimento),
UNIQUE(nome,idlocalidade),
CONSTRAINT pessoa_pk PRIMARY KEY (idpessoa),
CONSTRAINT pessoa_fk1 FOREIGN KEY (idlocalidade) REFERENCES localizacao(idlocalidade)
);

CREATE TABLE funcionario(
idpessoa INTEGER REFERENCES pessoa(idpessoa) ON DELETE SET NULL ON UPDATE CASCADE,
id INTEGER NOT NULL,
salario INTEGER NOT NULL,
idsupermercado INTEGER REFERENCES supermercado(idsupermercado) ON DELETE SET NULL ON UPDATE CASCADE,
idhorario INTEGER REFERENCES horario(idhorario) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT funcionario_pk PRIMARY KEY (idpessoa,id),
CONSTRAINT pessoa_fk1 FOREIGN KEY (idpessoa) REFERENCES pessoa(idpessoa),
CONSTRAINT pessoa_fk2 FOREIGN KEY (idsupermercado) REFERENCES supermercado(idsupermercado),
CONSTRAINT pessoa_fk3 FOREIGN KEY (idhorario) REFERENCES horario(idhorario)
);

CREATE TABLE cliente(
idpessoa INTEGER REFERENCES pessoa(idpessoa) ON DELETE SET NULL ON UPDATE CASCADE,
idcliente INTEGER NOT NULL,
numero_de_cliente INTEGER NOT NULL,
CONSTRAINT cliente_pk PRIMARY KEY (idpessoa,idcliente),
CONSTRAINT pessoa_fk1 FOREIGN KEY (idpessoa) REFERENCES pessoa(idpessoa)
);

CREATE TABLE horario(
idhorario INTEGER,
hora_inicial DATE NOT NULL,
hora_final DATE NOT NULL,
dia_da_semana VARCHAR2(50) NOT NULL,
CONSTRAINT horario_pk PRIMARY KEY (idhorario),
CONSTRAINT date_check CHECK(hora_inicial<hora_final),
CONSTRAINT day_check CHECK(dia_da_semana=="Segunda" OR dia_da_semana=="Terca" OR dia_da_semana=="Quarta" OR dia_da_semana=="Quinta" OR dia_da_semana=="Sexta" OR dia_da_semana=="Sabado")
);

CREATE TABLE pausa(
idfuncionario INTEGER REFERENCES funcionario(id) ON DELETE SET NULL ON UPDATE CASCADE,
idhorario INTEGER REFERENCES horario(idhorario) ON DELETE SET NULL ON UPDATE CASCADE,
hora_inicial_pausa_manha DATE NOT NULL,
hora_final_pausa_manha DATE NOT NULL,
hora_inicial_pausa_almoço DATE NOT NULL,
hora_final_pausa_almoço DATE NOT NULL,
hora_inicial_pausa_tarde DATE NOT NULL,
hora_final_pausa_tarde DATE NOT NULL,
CONSTRAINT pausa_pk PRIMARY KEY (idfuncionario),
CONSTRAINT pausa_fk1 FOREIGN KEY (idfuncionario) REFERENCES funcionario(funcionario_pk),
CONSTRAINT pessoa_fk2 FOREIGN KEY (idhorario) REFERENCES horario(idhorario),
CONSTRAINT date_check CHECK(hora_inicial_pausa_manha <hora_final_pausa_manha AND hora_final_pausa_manha<hora_inicial_pausa_almoço AND hora_inicial_pausa_almoço<hora_final_pausa_almoço AND hora_final_pausa_almoço<hora_inicial_pausa_tarde AND hora_inicial_pausa_tarde<hora_final_pausa_tarde)
);

CREATE TABLE caixa(
idcaixa INTEGER,
numero INTEGER NOT NULL,
aberta BOOLEAN DEFAULT false,
CONSTRAINT caixa_pk PRIMARY KEY (idcaixa)
);

CREATE TABLE automatica(
idcaixa INTEGER REFERENCES caixa(idcaixa) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT automatica_pk PRIMARY KEY (idcaixa),
CONSTRAINT automatica_fk1 FOREIGN KEY (idcaixa) REFERENCES caixa(idcaixa)
);

CREATE TABLE manual(
idcaixa INTEGER REFERENCES caixa(idcaixa) ON DELETE SET NULL ON UPDATE CASCADE,
idfuncionario INTEGER REFERENCES funcionario(id) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT manual_pk PRIMARY KEY (idcaixa,idfuncionario),
CONSTRAINT manual_fk1 FOREIGN KEY (idfuncionario) REFERENCES funcionario(funcionario_pk)
);

CREATE TABLE seccao(
idseccao INTEGER,
nome VARCHAR2(50) NOT NULL,
idfuncionario INTEGER REFERENCES funcionario(id) ON DELETE SET NULL ON UPDATE CASCADE,
idsupermercado INTEGER REFERENCES supermercado(idsupermercado) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT seccao_pk PRIMARY KEY (idseccao),
CONSTRAINT seccao_fk1 FOREIGN KEY (idfuncionario) REFERENCES funcionario(funcionario_pk),
CONSTRAINT pessoa_fk2 FOREIGN KEY (idsupermercado) REFERENCES supermercado(idsupermercado)
);

CREATE TABLE compra(
idcompra INTEGER,
dia DATE NOT NULL,
hora DATE NOT NULL,
idcliente INTEGER REFERENCES cliente(cliente_pk) ON DELETE SET NULL ON UPDATE CASCADE,
idcaixa INTEGER REFERENCES caixa(idcaixa) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT compra_pk PRIMARY KEY (idcompra),
CONSTRAINT compra_fk1 FOREIGN KEY (idcliente) REFERENCES cliente(cliente_pk),
CONSTRAINT pessoa_fk2 FOREIGN KEY (idcaixa) REFERENCES caixa(idcaixa)
);

CREATE TABLE produto(
idproduto INTEGER,
preco INTEGER CHECK(preco>0),
quantidade_disponivel INTEGER CHECK(quantidade_disponivel>=0),
idseccao INTEGER REFERENCES seccao(idseccao) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT produto_pk PRIMARY KEY (idproduto),
CONSTRAINT produto_fk1 FOREIGN KEY (idseccao) REFERENCES seccao(idseccao)
);

CREATE TABLE quantidade(
idproduto INTEGER REFERENCES produto(idproduto) ON DELETE SET NULL ON UPDATE CASCADE,
idcompra INTEGER REFERENCES compra(idcompra) ON DELETE SET NULL ON UPDATE CASCADE,
quantidade INTEGER CHECK(quantidade>0),
CONSTRAINT quantidade_pk PRIMARY KEY (idproduto, idcompra),
CONSTRAINT quantidade_fk1 FOREIGN KEY (idproduto) REFERENCES produto(idproduto),
CONSTRAINT quantidade_fk2 FOREIGN KEY (idcompra) REFERENCES compra(idcompra)
);

CREATE TABLE responsavel(
idcaixa INTEGER REFERENCES caixa(idcaixa) ON DELETE SET NULL ON UPDATE CASCADE,
idfuncionario INTEGER REFERENCES funcionario(id) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT responsavel_pk PRIMARY KEY (idcaixa,idfuncionario),
CONSTRAINT responsavel_fk1 FOREIGN KEY (idcaixa) REFERENCES caixa(idcaixa),
CONSTRAINT responsavel_fk2 FOREIGN KEY (idfuncionario) REFERENCES funcionario(funcionario_pk)
);

CREATE TABLE trabalha(
idfuncionario INTEGER REFERENCES funcionario(id) ON DELETE SET NULL ON UPDATE CASCADE,
idseccao INTEGER REFERENCES seccao(idseccao) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT trabalha_pk PRIMARY KEY (idfuncionario,idseccao),
CONSTRAINT trabalha_fk1 FOREIGN KEY (idfuncionario) REFERENCES funcionario(funcionario_pk),
CONSTRAINT trabalha_fk2 FOREIGN KEY (idseccao) REFERENCES seccao(idseccao)
);

CREATE TABLE possui(
idcompra INTEGER REFERENCES compra(idcompra) ON DELETE SET NULL ON UPDATE CASCADE,
idproduto INTEGER REFERENCES produto(idproduto) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT possui_pk PRIMARY KEY (idcompra,idproduto),
CONSTRAINT possui_fk1 FOREIGN KEY (idcompra) REFERENCES compra(idcompra),
CONSTRAINT possui_fk2 FOREIGN KEY (idproduto) REFERENCES produto(idproduto)
);

PRAGMA foreign_keys = on;
