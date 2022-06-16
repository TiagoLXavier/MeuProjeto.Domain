 use MeuProjeto;
 go
 
 --query
 ---1) - Listar todos os clientes do estado de SP que possuem mais de 60% das parcelas pagas;
 With ClientesSelecionados AS
   (SELECT 
    C.Nome,
	C.Cpf,
	C.Celular,
	C.UF,
	CASE
    WHEN (0.6 * COUNT(P.Id)) <= (SELECT COUNT(P1.Id) FROM Parcelas P1 WHERE P1.IdFinanciamento = F.Id AND P1.DataPagamento IS NOT NULL)  THEN 'Sim'
        ELSE 'Não'
    END AS Selecionado
    FROM Clientes C 
            INNER JOIN Financiamentos F ON F.IdCliente = C.Id
			INNER JOIN Parcelas P ON P.IdFinanciamento = F.Id
			WHERE c.UF ='SP'
	Group by  C.Nome, C.Cpf, C.Celular, C.UF,F.Id
	)
	SELECT 
	C.Nome,
	C.Cpf,
	C.Celular,
	C.UF 
	FROM ClientesSelecionados C WHERE C.Selecionado ='Sim'
	ORDER BY c.Nome
    
 --query
 ---2) - Listar os primeiros quatro clientes que possuem alguma parcela com mais de cinco diasem atraso (Data Vencimento maior que data atual E data pagamento nula).
    SELECT Top 4
    C.Nome,
	C.Cpf,
	C.Celular,
	C.UF 
    FROM Clientes C 
            INNER JOIN Financiamentos F ON F.IdCliente = C.Id
			INNER JOIN Parcelas P ON P.IdFinanciamento = F.Id 
	where (P.DataPagamento is null and (DATEDIFF(day,cast(GETDATE() as date),P.DataVencimento) <= -5))
	Group by  C.Nome, C.Cpf, C.Celular, C.UF
	Order by c.Nome