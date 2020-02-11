--DML
--INSERÇÃO DE DADOS NAS TABELAS

USE SpMedGroup_Tarde;

INSERT INTO StConsulta (Situacao)
VALUES ('Realizada'), ('Agendada'), ('Cancelada');

INSERT INTO Especialidade (Nome)
VALUES ('Acupuntura'),
	('Anestesiologia'),
	('Angiologia'),
	('Cardiologia'),
	('Cirurgia Cardiovascular'),
	('Cirurgia da Mão'),
	('Cirurgia do Aparelho Digestivo'),
	('Cirurgia Geral'),
	('Cirurgia Pediátrica'),
	('Cirurgia Plástica'),
	('Cirurgia Torácica'),
	('Cirurgia Vascular'),
	('Dermatologia'),
	('Radiologia'),
	('Urologia'),
	('Pediatria'),
	('Psiquiatria');

INSERT INTO Clinica (Nome, CNPJ, RazaoSocial, Endereco)
VALUES ('CLinica Possarle','86400902000130','SP Medical Group','Al. Barão de Limeira, 539 - São Paulo');

INSERT INTO Prontuario (Nome, Email, Senha, DataNascimento, Telefone, RG, CPF, Endereco, CEP)
VALUES ('Ligia','ligia@gmail.com','ligia123','13/10/1983','11 3456-7654','435225435','94839859000','Rua Estado de Israel 240','4022000'),
	('Alexandre','alexandre@gmail.com','alexandre123','23/07/2001','11 98765-6543','326543457','73556944057','Av. Paulista, 1578 ','1310200'),
	('Fernando','fernando@gmail.com','fernando123','10/10/1978','11 97208-4453','546365253','16839338002','Av. Ibirapuera , 2927','4029200'),
	('Henrique','henrique@gmail.com','henrique123','13/10/1985','11 3456-6543','543663625','14332654765','R. Vitória, 120','6402030'),
	('João','joao@hotmail.com','joao123','27/08/1975','11 7656-6377','325444441','91305348010','R. Ver. Geraldo de Camargo, 66','9405380'),
	('Bruno','bruno@gmail.com','bruno123','21/03/1972','11 95436-8769','545662667','79799299004','Alameda dos Arapanés, 945','4524001'),
	('Mariana','mariana@outlook.com','mariana123','05/03/2018','','545662668','13771913039','R Sao Antonio, 232','6407140');

INSERT INTO Administrador (Nome, Email, Senha, IdClinica)
VALUES ('ADM-1','adm1@email.com','adm123','1');

INSERT INTO Medico (Crm, Nome, Email, Senha, IdEspecialidade, IdClinica)
VALUES ('54356-SP','Ricardo Lemos','ricardo.lemos@spmedicalgroup.com.br','ricardo123','2','1'),
	('53452-SP','Roberto Possarle','roberto.possarle@spmedicalgroup.com.br','roberto123','17','1'),
	('65463-SP','Helena Strada','helena.souza@spmedicalgroup.com.br','helena123','16','1');

INSERT INTO Consulta (IdProntuario, IdMedico, DataConsulta, IdStConsulta)
VALUES ('7','3','20/01/2020 15:00','1'),
	('2','2','06/01/2020 10:00','3'),
	('3','2','07/01/2020 11:00','1'),
	('2','2','06/02/2018 10:00','1'),
	('4','1','07/02/2019 11:00','3'),
	('7','3','08/03/2020 15:00','2'),
	('4','1','09/03/2020 11:00','2');

SELECT * FROM StConsulta;
SELECT * FROM Especialidade;
SELECT * FROM Clinica;
SELECT * FROM Prontuario;
SELECT * FROM Administrador;
SELECT * FROM Medico;
SELECT * FROM Consulta;

