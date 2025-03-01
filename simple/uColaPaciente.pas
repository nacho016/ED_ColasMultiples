unit uColaPaciente;

interface
	uses uPaciente;
	
	type
	    tNodo = record
	        pac: tPaciente; 
	        sig: ^tNodo;   
	    end;
    
	    tColaPaciente = record
	        first, last: ^tNodo; 
	    end;

	procedure initialize(var c: tColaPaciente);
	function isEmpty(c: tColaPaciente): boolean;
	procedure first(c: tColaPaciente; var p: tPaciente);
	procedure enqueue(var c: tColaPaciente; p: tPaciente);
	procedure dequeue(var c: tColaPaciente);


implementation
	procedure initialize(var c: tColaPaciente);
		begin
    		c.first:= nil; 
    		c.last:= nil; 
		end;

	function isEmpty(c: tColaPaciente): boolean;
		begin
    		isEmpty:= c.first = nil; 
		end;

	procedure first(c: tColaPaciente; var p: tPaciente);
		begin
    		if not(isEmpty(c)) then p:= c.first^.pac;
		end;

	procedure enqueue(var c: tColaPaciente; p: tPaciente);
		var
		    nuevo: ^tNodo; 
		begin
	    	new(nuevo); 
	    	nuevo^.pac:= p;
	    	nuevo^.sig:= nil; 
	    	if isEmpty(c) then c.first:= nuevo else c.last^.sig:= nuevo; 
	    	c.last:= nuevo; 
		end;

	procedure dequeue(var c: tColaPaciente);
		var
    		aux: ^tNodo; 
		begin
		    if not isEmpty(c) then
    			begin
        			aux:= c.first; 
        			c.first:= c.first^.sig;
        			dispose(aux); 
        			if c.first = nil then c.last:= nil; 
    			end;
		end;
end.
