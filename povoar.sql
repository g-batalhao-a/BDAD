PRAGMA foreign_keys = on;

-- Localizacoes de supermercados
INSERT INTO localizacao VALUES (563756815, '4250-376', 'Rua da Prelada', 'Porto');
INSERT INTO localizacao VALUES (862327734, '4250-507', 'Rua Joao dos Santos Ferreira', 'Porto');
INSERT INTO localizacao VALUES (799350542, '4050-586', 'Rua de Serpa Pinto', 'Porto');
INSERT INTO localizacao VALUES (439859621, '4150-138', 'Alameda de Basilio Teles', 'Porto');
INSERT INTO localizacao VALUES (170694894, '4460-841', 'Rua Sara Afonso', 'Matosinhos');
-- Localizacoes de pessoas
INSERT INTO localizacao VALUES (528401149, '4250-001', 'Rua do Padre Diamantino Gomes', 'Porto');
INSERT INTO localizacao VALUES (364812492, '4250-550', 'Rua Luís Ferreira', 'Porto');
INSERT INTO localizacao VALUES (271859601, '4450-004', 'Rua António Aleixo', 'Matosinhos');
INSERT INTO localizacao VALUES (395264973, '4450-404', 'Rua de Santa Eufémia', 'Matosinhos');
INSERT INTO localizacao VALUES (150694764, '4150-136', 'Rua Bernardino Machado', 'Porto');
INSERT INTO localizacao VALUES (675398189, '4150-308', 'Rua Faial', 'Porto');
INSERT INTO localizacao VALUES (217908498, '4460-134', 'Rua Alberto Augusto Mendonça', 'Senhora da Hora');
INSERT INTO localizacao VALUES (914493203, '4460-895', 'Rua de Dili', 'Guifoes');

-- horarios
INSERT INTO horario VALUES (246510889,strftime('%H:%M', '07:30'), strftime('%H:%M', '22:30'));
INSERT INTO horario VALUES (134405588,strftime('%H:%M', '09:00'), strftime('%H:%M', '21:00'));

-- horarios funcionarios
INSERT INTO horariofuncionario VALUES(404483088,246510889,'Segunda');
INSERT INTO horariofuncionario VALUES(572949826,246510889,'Terca');
INSERT INTO horariofuncionario VALUES(139851411,246510889,'Quarta');
INSERT INTO horariofuncionario VALUES(672536309,246510889,'Quinta');
INSERT INTO horariofuncionario VALUES(360000174,246510889,'Sexta');
INSERT INTO horariofuncionario VALUES(964736760,134405588,'Sabado');
INSERT INTO horariofuncionario VALUES(520539707,134405588,'Domingo');

-- supermercados
INSERT INTO supermercado VALUES(687815497, 'Supermercado KYF', 563756815, 246510889);
INSERT INTO supermercado VALUES(947563740, 'Mercado Boa Alimentacao', 862327734, 134405588);
INSERT INTO supermercado VALUES(233626926, 'Super Pungo Doce', 799350542, 246510889);
INSERT INTO supermercado VALUES(348947416, 'Autchim', 439859621, 246510889);
INSERT INTO supermercado VALUES(465441082, 'Europa', 170694894, 246510889);
INSERT INTO supermercado VALUES(342202605, 'Europa pos-Brexit', 170694894, 246510889);

-- pessoas
INSERT INTO pessoa VALUES(610417904, 265962470, 'Pedro Jorge Seixoca', strftime('%Y-%m-%d', '1996-11-17'), 919977336, '?',528401149);
INSERT INTO pessoa VALUES(258220554, 143908874, 'Celina Beltrao Camacho', strftime('%Y-%m-%d', '1987-04-13'), 924837466, 'F',364812492);
INSERT INTO pessoa VALUES(972632319, 148160561, 'Andre Bidao Falecimento', strftime('%Y-%m-%d', '1975-08-09'), 936385638, 'M',271859601);
INSERT INTO pessoa VALUES(499179157, 357006933, 'Ana Amanda Teresa Ressabiat', strftime('%Y-%m-%d', '1999-07-03'), 917693406, 'F',395264973);
INSERT INTO pessoa VALUES(210152906, 319868184, 'Antonio Gaylord Potro', strftime('%Y-%m-%d', '1969-10-25'), 927892843, 'M',150694764);
INSERT INTO pessoa VALUES(112789160, 295852251, 'Diogo Rosas', strftime('%Y-%m-%d', '1993-08-10'), 937273625, 'M',675398189);
INSERT INTO pessoa VALUES(448987473, 145185881, 'Sofia Sorridente Machipster', strftime('%Y-%m-%d', '1994-05-14'), 926473638, 'F',217908498);
INSERT INTO pessoa VALUES(136306590, 238698418, 'Ines Reluzita Svetlana', strftime('%Y-%m-%d', '1978-08-16'), 918374623, '?',914493203);

-- funcionarios
INSERT INTO funcionario VALUES(610417904,274739829,800,687815497,246510889, 404483088);
INSERT INTO funcionario VALUES(258220554,405279753,750,233626926,246510889, 572949826);
INSERT INTO funcionario VALUES(972632319,870890765,900,947563740,246510889, 360000174);
INSERT INTO funcionario VALUES(499179157,974056496,1500,348947416,246510889, 672536309);

-- pausas
INSERT INTO pausa VALUES (610417904,274739829,246510889,404483088,strftime('%H:%M', '10:30'), strftime('%H:%M', '10:50'),strftime('%H:%M', '13:15'), strftime('%H:%M', '14:15'),strftime('%H:%M', '17:00'), strftime('%H:%M', '17:20'));
INSERT INTO pausa VALUES (258220554,405279753,246510889,572949826,strftime('%H:%M', '10:10'), strftime('%H:%M', '10:30'),strftime('%H:%M', '12:30'), strftime('%H:%M', '13:30'),strftime('%H:%M', '16:15'), strftime('%H:%M', '16:30'));
INSERT INTO pausa VALUES (972632319,870890765,246510889,360000174,strftime('%H:%M', '11:00'), strftime('%H:%M', '11:15'),strftime('%H:%M', '13:45'), strftime('%H:%M', '14:45'),strftime('%H:%M', '17:50'), strftime('%H:%M', '18:10'));
INSERT INTO pausa VALUES (499179157,974056496,246510889,672536309,strftime('%H:%M', '9:45'), strftime('%H:%M', '10:05'),strftime('%H:%M', '12:00'), strftime('%H:%M', '13:00'),strftime('%H:%M', '15:45'), strftime('%H:%M', '16:15'));

-- clientes
INSERT INTO cliente VALUES(210152906, 804168374, 0);
INSERT INTO cliente VALUES(112789160, 275281926, 1);
INSERT INTO cliente VALUES(448987473, 207470234, 2);
INSERT INTO cliente VALUES(136306590, 959742821, 3);

