QT DECIMAL(18, 2);
VF DECIMAL(18, 2);

IF :object_type = '18' AND (:transaction_type = 'A' OR :transaction_type = 'U') THEN
         SELECT (SUM(T2."Quantity") * 100) / SUM(T4."Quantity"), 
		(SUM(T1."DocTotal") * 100) / SUM(T3."DocTotal")INTO QT , VF
        FROM "OPCH" T1
        INNER JOIN "PCH1" T2 ON T2."DocEntry" = T1."DocEntry"
        INNER JOIN "OPOR" T3 ON T2."BaseEntry" = T3."DocEntry"
        INNER JOIN "POR1" T4 ON T2."BaseEntry" = T4."DocEntry"
        WHERE T1."DocEntry" = :list_of_cols_val_tab_del;

        IF VP >= 110 AND VF >= 110 THEN 
            error := 1;
            error_message := 'Quantidade do Documento maior que  pedido de compra "10%';
        END IF;
    END IF;