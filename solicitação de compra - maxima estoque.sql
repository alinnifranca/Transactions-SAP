if :object_type = '1470000113'  and (:transaction_type = 'A'  )  then	
	SELECT 
		count(1) into error	
			FROM "OPRQ" T0 	
			inner join "PRQ1" T1 on T1."DocEntry" = T0."DocEntry"	
			Inner JOIN "OITM" T2 ON T2."ItemCode" = T1."ItemCode"  
			inner join "OITW" T3 on T3."ItemCode" = T2."ItemCode"
			WHERE (T3."OnHand" + T3."IsCommited" + T3."OnOrder") <= T3."MaxStock"
			and T1."Quantity" > T3."MaxStock"
			AND  T0."DocEntry" = :list_of_cols_val_tab_del;
		 IF(:error > 0) THEN        
			error := 1;
         	error_message := 'Não é possivel adicionar uma solicitação de compra, pois está ultrapassando a quantidade máxima do estoque.';  
	End if;
End IF;	