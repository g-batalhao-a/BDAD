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
INSERT INTO horario VALUES (246510889,strftime('07:30','HH:MM'), strftime('22:30','HH:MM'));
INSERT INTO horario VALUES (134405588,strftime('09:00','HH:MM'), strftime('21:00','HH:MM'));

-- supermercados
INSERT INTO supermercado VALUES(687815497, 'Supermercado KYF', 563756815, 246510889);
INSERT INTO supermercado VALUES(947563740, 'Mercado Boa Alimentacao', 862327734, 134405588);
INSERT INTO supermercado VALUES(233626926, 'Super Pungo Doce', 799350542, 246510889);
INSERT INTO supermercado VALUES(348947416, 'Autchim', 439859621, 246510889);
INSERT INTO supermercado VALUES(465441082, 'Europa', 170694894, 246510889);
INSERT INTO supermercado VALUES(342202605, 'Europa pos- Brexit', 170694894, 246510889);

-- pessoas
INSERT INTO pessoa VALUES(610417904, 265962470, 'Pedro Jorge Seixoca', strftime('17-11-1996','DD-MM-YYYY'), 919977336, '?',528401149);
INSERT INTO pessoa VALUES(258220554, 143908874, 'Celina Beltrão Camacho', strftime('13-04-1987','DD-MM-YYYY'), 924837466, 'F',364812492);
INSERT INTO pessoa VALUES(972632319, 148160561, 'Andre Bidao Falecimento', strftime('09-08-1975','DD-MM-YYYY'), 936385638, 'M',271859601);
INSERT INTO pessoa VALUES(499179157, 357006933, 'Ana Amanda Teresa Ressabiat', strftime('03-07-1999','DD-MM-YYYY'), 917693406, 'F',395264973);
INSERT INTO pessoa VALUES(210152906, 319868184, 'Antonio Gaylord Potro', strftime('25-10-1969','DD-MM-YYYY'), 927892843, 'M',150694764);
INSERT INTO pessoa VALUES(112789160, 295852251, 'Diogo Rosas', strftime('10-08-1993','DD-MM-YYYY'), 937273625, 'M',675398189);
INSERT INTO pessoa VALUES(448987473, 145185881, 'Sofia Sorridente Machipster', strftime('14-05-1994','DD-MM-YYYY'), 926473638, 'F',217908498);
INSERT INTO pessoa VALUES(136306590, 238698418, 'Ines Reluzita Svetlana', strftime('16-08-1978','DD-MM-YYYY'), 918374623, '?',914493203);

