.mode       columns
.headers    on
.nullvalue  NULL

-- Horarios dos Funcionarios

SELECT funcionario.idpessoa, pessoa.nome, horario.hora_inicial, horario.hora_final, horariofuncionario.dia_da_semana
FROM funcionario NATURAL JOIN pessoa NATURAL JOIN horario NATURAL JOIN horariofuncionario
WHERE horariofuncionario.idhorario = horario.idhorario;