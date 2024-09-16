-- Criação do banco de dados
CREATE DATABASE consultorioDB;

-- Criação do schema
CREATE SCHEMA consultorioSchema;

-- 'Seta' pro schema correto
SET search_path=consultorioSchema;

-- Tabela Consulta
CREATE TABLE paciente(
    pacienteId int NOT NULL PRIMARY KEY,
    nomePaciente varchar(255),
    dataNascimentoPaciente date,
    enderecoPaciente varchar(255),
    telefonePaciente varchar(15),
    emailPacinete varchar(255)    
);

CREATE TABLE medico(
    medicoId int NOT NULL PRIMARY KEY,
    nomeMedico varchar(255)    
); 

CREATE TABLE especialidade(
    especialidadeMedicoId int NOT NULL PRIMARY KEY,
    especialidadeMedico varchar(255),
    medicoId int   
); 

CREATE TABLE consulta(
    consultaId int NOT NULL PRIMARY KEY,
    dataConsulta date,
    diagnostico varchar(255),
    tratamento varchar(255),
    medicoId int, --FK para medico.medicoId
    pacienteId int   --FK para paciente.pacienteId
);


-- Tabela Receita
CREATE TABLE receita(
    receitaId int NOT NULL PRIMARY KEY,
    consultaId int NOT NULL,
    dataReceita date 
);

CREATE TABLE medicamentos(
    medicamentosId int NOT NULL PRIMARY KEY,
    receitaId int NOT NULL,
    nome varchar(255),
    dosagem varchar(255),
    frequencia varchar(255)    
);

-- Pagamento Exame

CREATE TABLE exame(
    exameId int NOT NULL PRIMARY KEY,
    tipoExame varchar(255),
    dataExame varchar(255),
    resultadoExame varchar(255),
	consultaId int
);

CREATE TABLE pagamentoExame(
    pagamentoId int NOT NULL PRIMARY KEY,
    dataPagamento date,
    valorPagamento decimal(10,2),
    metodoPagamento varchar(50),
    exameId int
);

ALTER TABLE consulta ADD
FOREIGN KEY (medicoId) REFERENCES medico(medicoId)

ALTER TABLE consulta ADD
FOREIGN KEY (pacienteId) REFERENCES paciente(pacienteId)

ALTER TABLE especialidade ADD
FOREIGN KEY (medicoId) REFERENCES medico(medicoId)

ALTER TABLE medicamentos ADD
FOREIGN KEY (receitaId) REFERENCES receita(receitaId)

ALTER TABLE exame ADD
FOREIGN KEY (consultaId) REFERENCES consulta(consultaId)

ALTER TABLE pagamentoExame ADD
FOREIGN KEY (exameId) REFERENCES exame(exameId)


-- POPULAÇÃO -- 
INSERT INTO paciente (pacienteId, nomePaciente, dataNascimentoPaciente, enderecoPaciente, telefonePaciente, emailPacinete) VALUES
(1, 'João Silva', '1980-01-15', 'Rua A, 123', '1234567890', 'joao.silva@example.com'),
(2, 'Maria Oliveira', '1990-02-20', 'Rua B, 456', '0987654321', 'maria.oliveira@example.com'),
(3, 'Carlos Souza', '1985-03-10', 'Rua C, 789', '1231231234', 'carlos.souza@example.com'),
(4, 'Ana Pereira', '1995-04-25', 'Rua D, 321', '3213214321', 'ana.pereira@example.com'),
(5, 'Luiz Costa', '2000-05-30', 'Rua E, 654', '9876543210', 'luiz.costa@example.com'),
(6, 'Paula Mendes', '1988-06-12', 'Rua F, 987', '2345678901', 'paula.mendes@example.com'),
(7, 'Rafael Lima', '1978-07-14', 'Rua G, 654', '3456789012', 'rafael.lima@example.com'),
(8, 'Fernanda Rocha', '1982-08-18', 'Rua H, 321', '4567890123', 'fernanda.rocha@example.com'),
(9, 'Roberto Alves', '1992-09-22', 'Rua I, 876', '5678901234', 'roberto.alves@example.com'),
(10, 'Patrícia Fernandes', '1987-10-30', 'Rua J, 543', '6789012345', 'patricia.fernandes@example.com');


INSERT INTO medico (medicoId, nomeMedico) VALUES
(1, 'Dr. Pedro Almeida'),
(2, 'Dra. Fernanda Ribeiro'),
(3, 'Dr. Ricardo Lopes'),
(4, 'Dra. Juliana Mendes'),
(5, 'Dr. Marcos Teixeira'),
(6, 'Dra. Carla Pinto'),
(7, 'Dr. José Santos'),
(8, 'Dra. Sofia Moreira'),
(9, 'Dr. Paulo Carvalho'),
(10, 'Dra. Beatriz Ferreira');


INSERT INTO especialidade (especialidadeMedicoId, especialidadeMedico, medicoId) VALUES
(1, 'Clínico Geral', 1),
(2, 'Ortopedista', 2),
(3, 'Endocrinologista', 3),
(4, 'Cardiologista', 4),
(5, 'Pneumologista', 5),
(6, 'Dermatologista', 6),
(7, 'Oftalmologista', 7),
(8, 'Ginecologista', 8),
(9, 'Neurologista', 9),
(10, 'Pediatra', 10),
(11, 'Clínico Geral', 2),
(12, 'Dermatologista', 3),
(13, 'Cardiologista', 6),
(14, 'Ortopedista', 4),
(15, 'Ginecologista', 1);

INSERT INTO consulta (consultaId, dataConsulta, diagnostico, tratamento, medicoId, pacienteId) VALUES
(1, '2023-01-15', 'Gripe', 'Repouso e hidratação', 1, 1),
(2, '2023-02-20', 'Fratura', 'Imobilização', 2, 2),
(3, '2023-03-10', 'Diabetes Tipo 2', 'Dieta e exercício', 3, 3),
(4, '2023-04-25', 'Hipertensão', 'Medicação e dieta', 4, 4),
(5, '2023-05-30', 'Asma', 'Inalação e medicação', 5, 5),
(6, '2023-06-05', 'Alergia', 'Anti-histamínico', 1, 6),
(7, '2023-06-10', 'Enxaqueca', 'Analgésico', 2, 7),
(8, '2023-06-15', 'Infecção Urinária', 'Antibiótico', 3, 8),
(9, '2023-06-20', 'Anemia', 'Suplemento de ferro', 4, 9),
(10, '2023-06-25', 'Covid-19', 'Isolamento e medicação', 5, 10);


INSERT INTO receita (receitaId, consultaId, dataReceita) VALUES
(1, 1, '2023-01-16'),
(2, 2, '2023-02-21'),
(3, 3, '2023-03-11'),
(4, 4, '2023-04-26'),
(5, 5, '2023-05-31'),
(6, 6, '2023-06-06'),
(7, 7, '2023-06-11'),
(8, 8, '2023-06-16'),
(9, 9, '2023-06-21'),
(10, 10, '2023-06-26');



INSERT INTO medicamentos (medicamentosId, receitaId, nome, dosagem, frequencia) VALUES
(1, 1, 'Paracetamol', '500mg', '2 vezes ao dia'),
(2, 1, 'Ibuprofeno', '200mg', '3 vezes ao dia'),
(3, 2, 'Metformina', '850mg', '2 vezes ao dia'),
(4, 2, 'Lisinopril', '10mg', '1 vez ao dia'),
(5, 3, 'Salbutamol', '100mcg', 'quando necessário'),
(6, 3, 'Loratadina', '10mg', '1 vez ao dia'),
(7, 4, 'Sumatriptano', '50mg', '1 vez ao dia'),
(8, 4, 'Amoxicilina', '500mg', '3 vezes ao dia'),
(9, 5, 'Sulfato Ferroso', '300mg', '2 vezes ao dia'),
(10, 5, 'Dexametasona', '6mg', '1 vez ao dia');


INSERT INTO exame (exameId, tipoExame, dataExame, resultadoExame, consultaId) VALUES
(1, 'Hemograma', '2023-01-17', 'Normal', 1),
(2, 'Raio-X', '2023-02-22', 'Fratura confirmada', 2),
(3, 'Glicemia', '2023-03-12', 'Alto', 3),
(4, 'Eletrocardiograma', '2023-04-27', 'Alterações detectadas', 4),
(5, 'Espirometria', '2023-06-01', 'Capacidade reduzida', 5),
(6, 'Alergias', '2023-06-07', 'Alergia a pólen', 6),
(7, 'Ressonância', '2023-06-12', 'Enxaqueca crônica', 7),
(8, 'Urocultura', '2023-06-17', 'Infecção confirmada', 8),
(9, 'Ferritina', '2023-06-22', 'Baixo', 9),
(10, 'PCR', '2023-06-27', 'Positivo para Covid-19', 10),
(11, 'Dengue', '2023-03-12', 'alterado', 1),
(12, 'Lactose', '2024-03-20', 'sem alteração', 3),
(13, 'Tomografia', '2024-06-17', 'Normal', 7);


INSERT INTO pagamentoExame (pagamentoId, dataPagamento, valorPagamento, metodoPagamento, exameId) VALUES
(1, '2023-01-18', 150.00, 'Cartão de Crédito',1),
(2, '2023-02-23', 200.00, 'Dinheiro',2),
(3, '2023-03-13', 100.00, 'Cartão de Débito',3),
(4, '2023-04-28', 250.00, 'Transferência Bancária',4),
(5, '2023-06-02', 300.00, 'Boleto Bancário',5),
(6, '2023-06-08', 180.00, 'Cartão de Crédito',6),
(7, '2023-06-13', 220.00, 'Dinheiro',7),
(8, '2023-06-18', 90.00, 'Cartão de Débito',8),
(9, '2023-06-23', 160.00, 'Transferência Bancária',9),
(10, '2023-06-28', 250.00, 'Boleto Bancário',10),
(11, '2023-03-12', 150.00, 'Pix',11),
(12, '2024-03-20', 900.00, 'Cartão de Débito',12),
(13, '2024-06-17', 850.00, 'Dinheiro',13);


-- Criação do banco de dados
CREATE DATABASE consultorioDB;

-- Criação do schema
CREATE SCHEMA consultorioSchema;

-- 'Seta' pro schema correto
SET search_path=consultorioSchema;

-- Tabela Consulta
CREATE TABLE paciente(
    pacienteId int NOT NULL PRIMARY KEY,
    nomePaciente varchar(255),
    dataNascimentoPaciente date,
    enderecoPaciente varchar(255),
    telefonePaciente varchar(15),
    emailPacinete varchar(255)    
);

CREATE TABLE medico(
    medicoId int NOT NULL PRIMARY KEY,
    nomeMedico varchar(255)    
); 

CREATE TABLE especialidade(
    especialidadeMedicoId int NOT NULL PRIMARY KEY,
    especialidadeMedico varchar(255),
    medicoId int   
); 

CREATE TABLE consulta(
    consultaId int NOT NULL PRIMARY KEY,
    dataConsulta date,
    diagnostico varchar(255),
    tratamento varchar(255),
    medicoId int, --FK para medico.medicoId
    pacienteId int   --FK para paciente.pacienteId
);


-- Tabela Receita
CREATE TABLE receita(
    receitaId int NOT NULL PRIMARY KEY,
    consultaId int NOT NULL,
    dataReceita date 
);

CREATE TABLE medicamentos(
    medicamentosId int NOT NULL PRIMARY KEY,
    receitaId int NOT NULL,
    nome varchar(255),
    dosagem varchar(255),
    frequencia varchar(255)    
);

-- Pagamento Exame

CREATE TABLE exame(
    exameId int NOT NULL PRIMARY KEY,
    tipoExame varchar(255),
    dataExame varchar(255),
    resultadoExame varchar(255),
	consultaId int
);

CREATE TABLE pagamentoExame(
    pagamentoId int NOT NULL PRIMARY KEY,
    dataPagamento date,
    valorPagamento decimal(10,2),
    metodoPagamento varchar(50),
    exameId int
);

ALTER TABLE consulta ADD
FOREIGN KEY (medicoId) REFERENCES medico(medicoId)

ALTER TABLE consulta ADD
FOREIGN KEY (pacienteId) REFERENCES paciente(pacienteId)

ALTER TABLE especialidade ADD
FOREIGN KEY (medicoId) REFERENCES medico(medicoId)

ALTER TABLE medicamentos ADD
FOREIGN KEY (receitaId) REFERENCES receita(receitaId)

ALTER TABLE exame ADD
FOREIGN KEY (consultaId) REFERENCES consulta(consultaId)

ALTER TABLE pagamentoExame ADD
FOREIGN KEY (exameId) REFERENCES exame(exameId)


SELECT * FROM receita;
SELECT * FROM medicamentos;
SELECT * FROM medico;
SELECT * FROM paciente;
SELECT * FROM consulta;
SELECT * FROM exame;
SELECT * FROM pagamentoExame;
SELECT * FROM especialidade;


delete from pagamentoExame;

--paciente, medico, exames e pagamento
select distinct p.nomePaciente, m.nomeMedico,
ex.tipoexame, pg.valorpagamento
from consulta c 
join medico m on c.medicoId=m.medicoId
join paciente p on c.pacienteId=p.pacienteId 
join exame ex on ex.consultaId=c.consultaId 
join pagamentoExame pg on ex.exameId=pg.pagamentoId
order by 1

-- paciente e remedios
select p.nomePaciente, me.nome, me.dosagem, me.frequencia, r.dataReceita
from consulta c
join paciente p on c.pacienteId=p.pacienteId 
join receita r on r.consultaId=c.pacienteId
join medicamentos me on r.receitaId=me.receitaId

-- receita e medicamentos
select r.consultaId,r.receitaId,me.nome,me.dosagem,me.frequencia 
from receita r join medicamentos me on me.receitaId=r.receitaId 

CREATE VIEW receitaMensal as 
    SELECT e.especialidadeMedico, EXTRACT(YEAR FROM pex.dataPagamento) AS ano,
        EXTRACT(MONTH FROM pex.dataPagamento) AS mes, SUM(pex.valorPagamento) AS faturamento
    FROM pagamentoExame pex
    JOIN exame ex ON pex.exameId = ex.exameId
    JOIN consulta c ON ex.consultaId = c.consultaId
    JOIN medico m ON c.medicoId = m.medicoId
    JOIN especialidade e ON m.medicoId = e.medicoId
    WHERE  EXTRACT(YEAR FROM pex.dataPagamento) IN (2023, 2024)
    GROUP BY e.especialidadeMedico, EXTRACT(YEAR FROM pex.dataPagamento), 
    EXTRACT(MONTH FROM pex.dataPagamento);

SELECT especialidadeMedico, ano, mes, faturamento
FROM receitaMensal
ORDER BY especialidadeMedico, ano, mes;



-- POPULAÇÃO -- 
INSERT INTO paciente (pacienteId, nomePaciente, dataNascimentoPaciente, enderecoPaciente, telefonePaciente, emailPacinete) VALUES
(1, 'João Silva', '1980-01-15', 'Rua A, 123', '1234567890', 'joao.silva@example.com'),
(2, 'Maria Oliveira', '1990-02-20', 'Rua B, 456', '0987654321', 'maria.oliveira@example.com'),
(3, 'Carlos Souza', '1985-03-10', 'Rua C, 789', '1231231234', 'carlos.souza@example.com'),
(4, 'Ana Pereira', '1995-04-25', 'Rua D, 321', '3213214321', 'ana.pereira@example.com'),
(5, 'Luiz Costa', '2000-05-30', 'Rua E, 654', '9876543210', 'luiz.costa@example.com'),
(6, 'Paula Mendes', '1988-06-12', 'Rua F, 987', '2345678901', 'paula.mendes@example.com'),
(7, 'Rafael Lima', '1978-07-14', 'Rua G, 654', '3456789012', 'rafael.lima@example.com'),
(8, 'Fernanda Rocha', '1982-08-18', 'Rua H, 321', '4567890123', 'fernanda.rocha@example.com'),
(9, 'Roberto Alves', '1992-09-22', 'Rua I, 876', '5678901234', 'roberto.alves@example.com'),
(10, 'Patrícia Fernandes', '1987-10-30', 'Rua J, 543', '6789012345', 'patricia.fernandes@example.com');


INSERT INTO medico (medicoId, nomeMedico) VALUES
(1, 'Dr. Pedro Almeida'),
(2, 'Dra. Fernanda Ribeiro'),
(3, 'Dr. Ricardo Lopes'),
(4, 'Dra. Juliana Mendes'),
(5, 'Dr. Marcos Teixeira'),
(6, 'Dra. Carla Pinto'),
(7, 'Dr. José Santos'),
(8, 'Dra. Sofia Moreira'),
(9, 'Dr. Paulo Carvalho'),
(10, 'Dra. Beatriz Ferreira');


INSERT INTO especialidade (especialidadeMedicoId, especialidadeMedico, medicoId) VALUES
(1, 'Clínico Geral', 1),
(2, 'Ortopedista', 2),
(3, 'Endocrinologista', 3),
(4, 'Cardiologista', 4),
(5, 'Pneumologista', 5),
(6, 'Dermatologista', 6),
(7, 'Oftalmologista', 7),
(8, 'Ginecologista', 8),
(9, 'Neurologista', 9),
(10, 'Pediatra', 10),
(11, 'Clínico Geral', 2),
(12, 'Dermatologista', 3),
(13, 'Cardiologista', 6),
(14, 'Ortopedista', 4),
(15, 'Ginecologista', 1);

INSERT INTO consulta (consultaId, dataConsulta, diagnostico, tratamento, medicoId, pacienteId) VALUES
(1, '2023-01-15', 'Gripe', 'Repouso e hidratação', 1, 1),
(2, '2023-02-20', 'Fratura', 'Imobilização', 2, 2),
(3, '2023-03-10', 'Diabetes Tipo 2', 'Dieta e exercício', 3, 3),
(4, '2023-04-25', 'Hipertensão', 'Medicação e dieta', 4, 4),
(5, '2023-05-30', 'Asma', 'Inalação e medicação', 5, 5),
(6, '2023-06-05', 'Alergia', 'Anti-histamínico', 1, 6),
(7, '2023-06-10', 'Enxaqueca', 'Analgésico', 2, 7),
(8, '2023-06-15', 'Infecção Urinária', 'Antibiótico', 3, 8),
(9, '2023-06-20', 'Anemia', 'Suplemento de ferro', 4, 9),
(10, '2023-06-25', 'Covid-19', 'Isolamento e medicação', 5, 10);


INSERT INTO receita (receitaId, consultaId, dataReceita) VALUES
(1, 1, '2023-01-16'),
(2, 2, '2023-02-21'),
(3, 3, '2023-03-11'),
(4, 4, '2023-04-26'),
(5, 5, '2023-05-31'),
(6, 6, '2023-06-06'),
(7, 7, '2023-06-11'),
(8, 8, '2023-06-16'),
(9, 9, '2023-06-21'),
(10, 10, '2023-06-26');



INSERT INTO medicamentos (medicamentosId, receitaId, nome, dosagem, frequencia) VALUES
(1, 1, 'Paracetamol', '500mg', '2 vezes ao dia'),
(2, 1, 'Ibuprofeno', '200mg', '3 vezes ao dia'),
(3, 2, 'Metformina', '850mg', '2 vezes ao dia'),
(4, 2, 'Lisinopril', '10mg', '1 vez ao dia'),
(5, 3, 'Salbutamol', '100mcg', 'quando necessário'),
(6, 3, 'Loratadina', '10mg', '1 vez ao dia'),
(7, 4, 'Sumatriptano', '50mg', '1 vez ao dia'),
(8, 4, 'Amoxicilina', '500mg', '3 vezes ao dia'),
(9, 5, 'Sulfato Ferroso', '300mg', '2 vezes ao dia'),
(10, 5, 'Dexametasona', '6mg', '1 vez ao dia');


INSERT INTO exame (exameId, tipoExame, dataExame, resultadoExame, consultaId) VALUES
(1, 'Hemograma', '2023-01-17', 'Normal', 1),
(2, 'Raio-X', '2023-02-22', 'Fratura confirmada', 2),
(3, 'Glicemia', '2023-03-12', 'Alto', 3),
(4, 'Eletrocardiograma', '2023-04-27', 'Alterações detectadas', 4),
(5, 'Espirometria', '2023-06-01', 'Capacidade reduzida', 5),
(6, 'Alergias', '2023-06-07', 'Alergia a pólen', 6),
(7, 'Ressonância', '2023-06-12', 'Enxaqueca crônica', 7),
(8, 'Urocultura', '2023-06-17', 'Infecção confirmada', 8),
(9, 'Ferritina', '2023-06-22', 'Baixo', 9),
(10, 'PCR', '2023-06-27', 'Positivo para Covid-19', 10),
(11, 'Dengue', '2023-03-12', 'alterado', 1),
(12, 'Lactose', '2024-03-20', 'sem alteração', 3),
(13, 'Tomografia', '2024-06-17', 'Normal', 7);


INSERT INTO pagamentoExame (pagamentoId, dataPagamento, valorPagamento, metodoPagamento, exameId) VALUES
(1, '2023-01-18', 150.00, 'Cartão de Crédito',1),
(2, '2023-02-23', 200.00, 'Dinheiro',2),
(3, '2023-03-13', 100.00, 'Cartão de Débito',3),
(4, '2023-04-28', 250.00, 'Transferência Bancária',4),
(5, '2023-06-02', 300.00, 'Boleto Bancário',5),
(6, '2023-06-08', 180.00, 'Cartão de Crédito',6),
(7, '2023-06-13', 220.00, 'Dinheiro',7),
(8, '2023-06-18', 90.00, 'Cartão de Débito',8),
(9, '2023-06-23', 160.00, 'Transferência Bancária',9),
(10, '2023-06-28', 250.00, 'Boleto Bancário',10),
(11, '2023-03-12', 150.00, 'Pix',11),
(12, '2024-03-20', 900.00, 'Cartão de Débito',12),
(13, '2024-06-17', 850.00, 'Dinheiro',13);






