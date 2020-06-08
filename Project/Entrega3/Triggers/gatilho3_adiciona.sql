create trigger updateSalary
After UPDATE on horario
BEGIN
	UPDATE funcionario
    set salario = round((JulianDay(new.hora_final) - JulianDay(new.hora_inicial)) * 24 * 8 + 850, 0)
    where funcionario.idhorario = new.idhorario;
end;