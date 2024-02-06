if :object_type = '4'  and (:transaction_type = 'A')  then
Select 
		count(1) 
		into error
		From "OITM" T0						
		Where 
			Ifnull(T0."ItemName", '') = ''
			and
			T0."ItemCode" = list_of_cols_val_tab_del;
					
			IF(:error > 0) THEN        
				error := 1;
         		error_message := 'Para cadastrar um item a descrição não pode estar em branco';   
			End if; 			
End if;