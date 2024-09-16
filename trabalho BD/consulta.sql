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