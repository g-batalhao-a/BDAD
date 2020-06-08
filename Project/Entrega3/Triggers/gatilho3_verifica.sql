.mode       columns
.headers    on
.nullvalue  NULL

SELECT * FROM horario natural join funcionario where horario.idhorario = 134405588;

UPDATE horario 
set hora_inicial = strftime('%H:%M', '07:00')
where idhorario = 134405588;

SELECT * FROM horario NATURAL join funcionario where horario.idhorario = 134405588;