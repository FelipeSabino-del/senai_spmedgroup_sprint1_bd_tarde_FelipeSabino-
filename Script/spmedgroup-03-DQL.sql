--DQL
--CRIAR VINCULO DE MOSTRAGEM ENTRE TABELAS DO DB

USE SpMedGroup_Tarde;

--PRONTUARIOS E SUAS CONSULTAS
SELECT Prontuario.Nome,Consulta.DataConsulta , Prontuario.Email, Prontuario.DataNascimento, Prontuario.CPF FROM Consulta
INNER JOIN Prontuario ON Prontuario.IdProntuario = Consulta.IdProntuario;

--PRONTUARIOS, SUAS CONSULTAS E SEUS RESPECTIVOS MEDICOS
SELECT Prontuario.Nome AS Paciente, Prontuario.CPF ,Prontuario.DataNascimento,Consulta.DataConsulta, Medico.Nome AS NomeMedico, Especialidade.Nome AS EspecialidadeMedica FROM Consulta
INNER JOIN Prontuario ON Prontuario.IdProntuario = Consulta.IdProntuario
INNER JOIN Medico ON Medico.IdMedico = Consulta.IdMedico
INNER JOIN Especialidade ON Especialidade.IdEspecialidade = Medico.IdEspecialidade;

--MEDICOS E SUAS ESPECIALIDADES
SELECT Medico.Crm, Medico.Nome, Especialidade.Nome AS EspecialidadeMedica FROM Medico
INNER JOIN Especialidade ON Especialidade.IdEspecialidade = Medico.IdEspecialidade;

--MEDICOS, SUAS ESPECIALIDADES E CLINICA DE ATUAÇÃO
SELECT Medico.Crm, Medico.Nome, Especialidade.Nome AS EspecialidadeMedica, Clinica.Nome AS ClinicaDeAtuação, Clinica.Endereco FROM Medico
INNER JOIN Especialidade ON Especialidade.IdEspecialidade = Medico.IdEspecialidade
INNER JOIN Clinica ON Clinica.IdClinica = Medico.IdClinica;

--IDADE DOS PACIENTES
SELECT Prontuario.Nome, Prontuario.DataNascimento, 
CASE WHEN
DATEPART(MONTH,Prontuario.DataNascimento)<= DATEPART(MONTH,GETDATE()) AND
DATEPART(DAY,Prontuario.DataNascimento)<= DATEPART(DAY,GETDATE())
THEN
(DATEDIFF(YEAR,Prontuario.DataNascimento,GETDATE()))
ELSE
(DATEDIFF(YEAR,Prontuario.DataNascimento,GETDATE()))- 1
 END AS IDADEATUAL
from Prontuario;

--STORED PROCEDURE CALCULO IDADE
CREATE PROCEDURE CalcularIdade
AS
SELECT Prontuario.Nome, Prontuario.DataNascimento, 
CASE WHEN
DATEPART(MONTH,Prontuario.DataNascimento)<= DATEPART(MONTH,GETDATE()) AND
DATEPART(DAY,Prontuario.DataNascimento)<= DATEPART(DAY,GETDATE())
THEN
(DATEDIFF(YEAR,Prontuario.DataNascimento,GETDATE()))
ELSE
(DATEDIFF(YEAR,Prontuario.DataNascimento,GETDATE()))- 1
 END AS IDADEATUAL
from Prontuario
ORDER BY IDADEATUAL;

--EXECUTAR PROCEDURE
EXEC CalcularIdade;


CREATE PROCEDURE MedicoEspecialidade
@ID INT
AS
SELECT Medico.Nome AS NomeMedico, Especialidade.Nome AS EspecialidadeMedica FROM Medico
INNER JOIN Especialidade ON Especialidade.IdEspecialidade = Medico.IdEspecialidade
WHERE Especialidade.IdEspecialidade = @ID;

EXEC MedicoEspecialidade @Id;

SELECT * FROM Especialidade;

DROP PROCEDURE MedicoEspecialidade;
