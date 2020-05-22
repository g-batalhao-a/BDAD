SELECT * FROM horario natural join funcionario;

UPDATE horario 
set hora_inicial = strftime('%H:%M', '07:00')
where idhorario = 134405588;

SELECT * FROM horario NATURAL join funcionario;