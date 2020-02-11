SELECT Prontuario.Nome,Consulta.DataConsulta , Prontuario.Email, Prontuario.DataNascimento, Prontuario.CPF FROM Consulta
INNER JOIN Prontuario ON Prontuario.IdProntuario = Consulta.IdProntuario;