.mode       columns
.headers    on
.nullvalue  NULL

-- Horas úteis dos funcionários

Select funcionario.idpessoa as Funcionario, pessoa.nome , strftime('%H:%M', round(
  Cast ((JulianDay(horario.hora_final) - JulianDay(horario.hora_inicial)) * 24 * 60
       - (JulianDay(horariofuncionario.hora_final_pausa_manha) - JulianDay(horariofuncionario.hora_inicial_pausa_manha)) * 24 * 60
       - (JulianDay(horariofuncionario.hora_final_pausa_almoco) - JulianDay(horariofuncionario.hora_inicial_pausa_almoco)) * 24 * 60
       - (JulianDay(horariofuncionario.hora_final_pausa_tarde) - JulianDay(horariofuncionario.hora_inicial_pausa_tarde)) * 24 * 60 
        As REAL) * 60 ,2), 'unixepoch') as Horas_Uteis
from funcionario natural join pessoa Natural join horario natural join horariofuncionario;