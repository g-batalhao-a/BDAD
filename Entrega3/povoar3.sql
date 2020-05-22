PRAGMA foreign_keys = on;

-- Localizacoes de supermercados
INSERT INTO localizacao VALUES (563756815, '4250-376', 'Rua da Prelada', 'Porto');
INSERT INTO localizacao VALUES (862327734, '4250-507', 'Rua Joao dos Santos Ferreira', 'Porto');
INSERT INTO localizacao VALUES (799350542, '4050-586', 'Rua de Serpa Pinto', 'Porto');
INSERT INTO localizacao VALUES (439859621, '4150-138', 'Alameda de Basilio Teles', 'Porto');
INSERT INTO localizacao VALUES (170694894, '4460-841', 'Rua Sara Afonso', 'Matosinhos');
-- Localizacoes de pessoas
INSERT INTO localizacao VALUES (528401149, '4250-001', 'Rua do Padre Diamantino Gomes', 'Porto');
INSERT INTO localizacao VALUES (364812492, '4250-550', 'Rua Lus Ferreira', 'Porto');
INSERT INTO localizacao VALUES (271859601, '4450-004', 'Rua Antnio Aleixo', 'Matosinhos');
INSERT INTO localizacao VALUES (395264973, '4450-404', 'Rua de Santa Eufmia', 'Matosinhos');
INSERT INTO localizacao VALUES (150694764, '4150-136', 'Rua Bernardino Machado', 'Porto');
INSERT INTO localizacao VALUES (675398189, '4150-308', 'Rua Faial', 'Porto');
INSERT INTO localizacao VALUES (217908498, '4460-134', 'Rua Alberto Augusto Mendona', 'Senhora da Hora');
INSERT INTO localizacao VALUES (914493203, '4460-895', 'Rua de Dili', 'Guifoes');
INSERT INTO localizacao VALUES (793529968, '4760-100', 'Rua do Marques', 'Famalicao');


-- horarios
INSERT INTO horario VALUES (246510889,strftime('%H:%M', '07:30'), strftime('%H:%M', '22:30'));
INSERT INTO horario VALUES (134405588,strftime('%H:%M', '09:00'), strftime('%H:%M', '21:00'));

-- supermercados
INSERT INTO supermercado VALUES(687815497, 'Continente', 563756815, 246510889);
INSERT INTO supermercado VALUES(947563740, 'Lidl', 862327734, 134405588);
INSERT INTO supermercado VALUES(233626926, 'Pingo Doce', 799350542, 246510889);
INSERT INTO supermercado VALUES(348947416, 'Auchan', 439859621, 246510889);
INSERT INTO supermercado VALUES(465441082, 'Bolama', 170694894, 246510889);
INSERT INTO supermercado VALUES(342202605, 'Mercadona', 170694894, 246510889);

-- pessoas
INSERT INTO pessoa VALUES(610417904, 265962470, 'Pedro Jorge Seixas', strftime('%Y-%m-%d', '1996-11-17'), 919977336, '?',528401149);
INSERT INTO pessoa VALUES(258220554, 143908874, 'Celina Beltrao Camacho', strftime('%Y-%m-%d', '1987-04-13'), 924837466, 'F',364812492);
INSERT INTO pessoa VALUES(972632319, 148160561, 'Andre Bidao Falecimento', strftime('%Y-%m-%d', '1975-08-09'), 936385638, 'M',271859601);
INSERT INTO pessoa VALUES(499179157, 357006933, 'Ana Amanda Teresa', strftime('%Y-%m-%d', '1999-07-03'), 917693406, 'F',395264973);
INSERT INTO pessoa VALUES(210152906, 319868184, 'Antonio Potro', strftime('%Y-%m-%d', '1969-10-25'), 927892843, 'M',150694764);
INSERT INTO pessoa VALUES(112789160, 295852251, 'Diogo Rosas', strftime('%Y-%m-%d', '1993-08-10'), 937273625, 'M',675398189);
INSERT INTO pessoa VALUES(448987473, 145185881, 'Sofia Sorridente Machipster', strftime('%Y-%m-%d', '1994-05-14'), 926473638, 'F',217908498);
INSERT INTO pessoa VALUES(136306590, 238698418, 'Ines Reluzita Svetlana', strftime('%Y-%m-%d', '1978-08-16'), 918374623, '?',914493203);
INSERT INTO pessoa VALUES(596188989, 322614211, 'Gonalo Batalhas', strftime('%Y-%m-%d', '1980-08-26'), 912332456, 'F',793529968);

-- funcionarios
INSERT INTO funcionario VALUES(610417904,970,687815497,246510889);
INSERT INTO funcionario VALUES(258220554,970,233626926,246510889);
INSERT INTO funcionario VALUES(972632319,970,947563740,246510889);
INSERT INTO funcionario VALUES(499179157,946,348947416,134405588);
INSERT INTO funcionario VALUES(596188989,946,348947416,134405588);

-- horarios funcionarios
INSERT INTO horariofuncionario VALUES(610417904,246510889,'Segunda',strftime('%H:%M', '10:30'), strftime('%H:%M', '10:50'),strftime('%H:%M', '13:15'), strftime('%H:%M', '14:15'),strftime('%H:%M', '17:00'), strftime('%H:%M', '17:20'));
INSERT INTO horariofuncionario VALUES(258220554,246510889,'Terca',strftime('%H:%M', '10:10'), strftime('%H:%M', '10:30'),strftime('%H:%M', '12:30'), strftime('%H:%M', '13:30'),strftime('%H:%M', '16:15'), strftime('%H:%M', '16:30'));
INSERT INTO horariofuncionario VALUES(972632319,246510889,'Quarta',strftime('%H:%M', '11:00'), strftime('%H:%M', '11:15'),strftime('%H:%M', '13:45'), strftime('%H:%M', '14:45'),strftime('%H:%M', '17:50'), strftime('%H:%M', '18:10'));
INSERT INTO horariofuncionario VALUES(499179157,134405588,'Quinta',strftime('%H:%M', '09:45'), strftime('%H:%M', '10:05'),strftime('%H:%M', '12:00'), strftime('%H:%M', '13:00'),strftime('%H:%M', '15:45'), strftime('%H:%M', '16:15'));
INSERT INTO horariofuncionario VALUES(596188989,134405588,'Sexta',strftime('%H:%M', '10:10'), strftime('%H:%M', '10:30'),strftime('%H:%M', '12:30'), strftime('%H:%M', '13:30'),strftime('%H:%M', '16:15'), strftime('%H:%M', '16:30'));

-- clientes
INSERT INTO cliente VALUES(210152906, 0);
INSERT INTO cliente VALUES(112789160, 1);
INSERT INTO cliente VALUES(448987473, 2);
INSERT INTO cliente VALUES(136306590, 3);

-- caixas
INSERT INTO caixa VALUES(292889018, 1, 0, 687815497);
INSERT INTO caixa VALUES(702102145, 2, 1, 687815497);
INSERT INTO caixa VALUES(314874835, 3, 1, 348947416);
INSERT INTO caixa VALUES(623031402, 4, 0, 348947416);
INSERT INTO caixa VALUES(247958751, 5, 0, 348947416);

-- caixas automaticas
INSERT INTO automatica VALUES(292889018);
INSERT INTO automatica VALUES(702102145);

-- caixas manuais
INSERT INTO manual VALUES(314874835,258220554);
INSERT INTO manual VALUES(623031402,610417904);
INSERT INTO manual VALUES(247958751,610417904);

-- secoes

INSERT INTO seccao VALUES(131786185, "Laticinios", 348947416);
INSERT INTO seccao VALUES(103508880, "Proteina", 348947416);
INSERT INTO seccao VALUES(812637375, "Charcutaria", 348947416);
INSERT INTO seccao VALUES(251447700, "Papel Higinico", 348947416);
INSERT INTO seccao VALUES(329010548, "Alcool", 348947416);
INSERT INTO seccao VALUES(589382998, "Roupa", 348947416);
INSERT INTO seccao VALUES(532218423, "Padaria", 348947416);
INSERT INTO seccao VALUES(185067429, "Fritos", 348947416);
INSERT INTO seccao VALUES(559224318, "Frutas", 348947416);
INSERT INTO seccao VALUES(646326494, "Congelados", 348947416);

-- compras

INSERT INTO compra VALUES(531978268, strftime('%Y-%m-%d', '2020-03-20'), strftime('%H:%M','09:30'), 210152906, 292889018);
INSERT INTO compra VALUES(929586195, strftime('%Y-%m-%d', '2020-03-20'), strftime('%H:%M','17:00'), 112789160, 702102145);
INSERT INTO compra VALUES(150315947, strftime('%Y-%m-%d', '2020-03-22'), strftime('%H:%M','10:40'), 112789160, 292889018);
INSERT INTO compra VALUES(487008916, strftime('%Y-%m-%d', '2020-04-01'), strftime('%H:%M','12:15'), 448987473, 314874835);
INSERT INTO compra VALUES(470833102, strftime('%Y-%m-%d', '2020-03-02'), strftime('%H:%M','13:28'), 136306590, 314874835);
INSERT INTO compra VALUES(112149442, strftime('%Y-%m-%d', '2020-04-20'), strftime('%H:%M','08:54'), 136306590, 247958751);
INSERT INTO compra VALUES(345231345, strftime('%Y-%m-%d', '2020-05-20'), strftime('%H:%M','10:30'), 448987473, 623031402);

-- produtos

INSERT INTO produto VALUES(609423556, 'Alheira', 1.99, 100, 812637375);
INSERT INTO produto VALUES(594887697, 'Frango Enlatado', 1.67, 250, 103508880);
INSERT INTO produto VALUES(646430620, 'Ovos', 0.99, 500, 103508880);
INSERT INTO produto VALUES(194614821, 'Camisola Sponge Bob Criana', 9.99, 10, 589382998);
INSERT INTO produto VALUES(449266516, 'Papel Tripla Folha', 50.99, 5, 251447700);
INSERT INTO produto VALUES(270295948, 'Leite Meio Gordo', 4.99, 15, 131786185);

-- quantidades

INSERT INTO quantidade VALUES(594887697, 531978268, 6);
INSERT INTO quantidade VALUES(646430620, 531978268, 24);
INSERT INTO quantidade VALUES(194614821, 929586195, 1);
INSERT INTO quantidade VALUES(449266516, 150315947, 2);
INSERT INTO quantidade VALUES(609423556, 487008916, 1);
INSERT INTO quantidade VALUES(449266516, 470833102, 1);
INSERT INTO quantidade VALUES(270295948, 112149442, 4);
INSERT INTO quantidade VALUES(270295948, 345231345, 2);

-- responsaveis caixa

INSERT INTO responsavelcaixa VALUES(292889018, 610417904);
INSERT INTO responsavelcaixa VALUES(702102145, 258220554);
INSERT INTO responsavelcaixa VALUES(314874835, 610417904);
INSERT INTO responsavelcaixa VALUES(623031402, 258220554);
INSERT INTO responsavelcaixa VALUES(247958751, 972632319);

-- responsaveis seccao

INSERT INTO responsavel VALUES(131786185, 499179157);
INSERT INTO responsavel VALUES(103508880, 499179157);
INSERT INTO responsavel VALUES(812637375, 499179157);
INSERT INTO responsavel VALUES(251447700, 596188989);
INSERT INTO responsavel VALUES(329010548, 596188989);

-- trabalhos

INSERT INTO trabalha VALUES(972632319, 131786185);
INSERT INTO trabalha VALUES(972632319, 103508880);
INSERT INTO trabalha VALUES(972632319, 329010548);
INSERT INTO trabalha VALUES(499179157, 812637375);
INSERT INTO trabalha VALUES(499179157, 251447700);
INSERT INTO trabalha VALUES(499179157, 589382998);
INSERT INTO trabalha VALUES(596188989, 532218423);
INSERT INTO trabalha VALUES(596188989, 185067429);
INSERT INTO trabalha VALUES(596188989, 559224318);
INSERT INTO trabalha VALUES(596188989, 646326494);