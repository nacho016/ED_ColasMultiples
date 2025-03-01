program colasHospital;

uses crt, uControlCola, uPaciente;

var
	pac: tPaciente;
	colaHosp: tArrCola;
	opc: integer;

begin
	initQueueArr(colaHosp);
	
	//Código de prueba
	pac.id:= '00000001';
	pac.gravedad:= 2;
	enqueueArr(colaHosp, pac);
	pac.id:= '00000002';
	pac.gravedad:= 0;
	enqueueArr(colaHosp, pac);
	pac.id:= '00000003';
	pac.gravedad:= 1;
	enqueueArr(colaHosp, pac);
	//************************
	{El resultado esperado es que se les atienda en este orden en este orden
		1. 00000002
		2. 00000003
		3. 00000001
	}
	repeat
		writeln('| <> <> <> Escoge una opción <> <> <> ');
		writeln('|1. Añadir a una persona a la cola.   ');
		writeln('|2. Sacar al siguiente de la cola.    ');
		writeln('|3. Consultar el siguiente en la cola.');
		writeln('|4. Salir.                            ');
		readln(opc);
		case opc of
			1:	//Añadir persona a la cola
				begin
					write('Introduzca el ID del paciente:');
					readln(pac.id);
					writeln('Introduzca su gravedad: ');
					writeln('0. Grave');
					writeln('1. Moderado');
					writeln('2. Leve');
					readln(pac.gravedad);
					enqueueArr(colaHosp, pac);
					writeln('Paciente añadido.');
				end;
			2:	//Sacar a la persona de la cola
				begin
					if not(isQueueArrEmpty(colaHosp)) then
						begin
							dequeueArr(colaHosp);
							writeln('Se ha sacado al paciente de la cola.');
						end
					else writeln('La cola está vacía.');
				end;
			3:	//Consultar siguiente paciente en la cola
				begin
					if not(isQueueArrEmpty(colaHosp)) then
						begin
							next(colaHosp, pac);
							writeln('El siguiente en la cola es: ', pac.id);
						end
					else writeln('La cola está vacía.');
				end;
			4: writeln('Ha cerrado el programa.');
			else writeln('Esa no es una opción válida.');
		end;
		readln();
		ClrScr;
	until opc = 4;
end.
