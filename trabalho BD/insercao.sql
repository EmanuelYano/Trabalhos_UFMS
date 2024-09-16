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
