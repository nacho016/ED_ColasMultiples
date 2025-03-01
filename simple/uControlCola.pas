unit uControlCola;

interface
	uses uColaPaciente, uPaciente;
	
	const
	COLAS = 3;

	type
		tArrCola = array[0..(COLAS - 1)] of tColaPaciente;
	
	var
		i: integer;

	procedure initQueueArr(var arrC: tArrCola);
	function isQueueArrEmpty(arrC: tArrCola): boolean;
	procedure next(arrC: tArrCola; var p: tPaciente);
	procedure enqueueArr(var arrC: tArrCola; p: tPaciente);
	procedure dequeueArr(var arrC: tArrCola);

implementation
	procedure initQueueArr(var arrC: tArrCola);
		begin
			for i:= 0 to (COLAS - 1) do initialize(arrC[i]);
		end;
	
	function isQueueArrEmpty(arrC: tArrCola): boolean;
		var
			index: integer;
		begin
			index:= 0;
			for i:= 0 to (COLAS - 1) do if isEmpty(arrC[i]) then index:= index + 1;
			isQueueArrEmpty:= index = COLAS;
		end;
	
	procedure next(arrC: tArrCola; var p: tPaciente);
		begin
			i:= 0;
			while isEmpty(arrC[i]) do i:= i + 1;
			first(arrC[i], p);
		end;

	procedure enqueueArr(var arrC: tArrCola; p: tPaciente);
		begin
			enqueue(arrC[p.gravedad], p);	
		end;

	procedure dequeueArr(var arrC: tArrCola);
		begin
			i:= 0;
			while isEmpty(arrC[i]) do i:= i + 1;
			dequeue(arrC[i]);
		end;
end.
