-- Criação do banco de dados
CREATE DATABASE consultorioDB;

-- Criação do schema
CREATE SCHEMA consultorioSchema;

-- 'Seta' pro schema correto
SET search_path=consultorioSchema;


-- Tabela Consulta
CREATE TABLE consulta(
    consultaId int NOT NULL PRIMARY KEY,
    dataConsulta date,
    diagnostico varchar(255),
    tratamento varchar(255),
    medicoId int, --FK para medico.medicoId
    pacienteId int   --FK para paciente.pacienteId
);

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

ALTER TABLE consulta ADD
FOREIGN KEY (medicoId) REFERENCES medico(medicoId)

ALTER TABLE consulta ADD
FOREIGN KEY (pacienteId) REFERENCES paciente(pacienteId)

ALTER TABLE especialidade ADD
FOREIGN KEY (medicoId) REFERENCES medico(medicoId)

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

ALTER TABLE medicamentos ADD
FOREIGN KEY (receitaId) REFERENCES receita(receitaId)


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
    metodoPagamento varchar(50)
);

ALTER TABLE exame ADD
FOREIGN KEY (consultaId) REFERENCES consulta(consultaId)

site:instagram.com

"nomepessoa" filetype:pdf or filetype:xlsx or filetype:docx