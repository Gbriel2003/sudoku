program sudoku;
uses crt;
const
  filas = 9;
  columnas = 9;
  cuadrantes = 3;
  pistas = 36;
  sol = 81;
type
  matriz = array[1..9, 1..9] of integer;
  pistasT = array[1..9, 1..9] of boolean;
  cuadrante = array[1..3, 1..3] of integer;
var
  tablero, solucion: matriz;
  pistasTablero: pistasT;
  nombre, nick, rendirse : string;
  op: Integer;

//CREAMOS PROCEDIMIENTO PARA MOSTRAR EL TABLERO

procedure mostrarTablero(matriz: matriz);
var
	i, j: integer;
begin
	writeln('------------------------');
	for i := 1 to filas do
		begin
			for j := 1 to columnas do
				begin
					if pistasTablero[i,j] then
						textcolor(lightcyan)
					else if tablero[i,j] = 0 then
						textcolor(white)
					else
						textcolor(lightcyan);
					write(tablero[i,j], ' ');
						
					if j mod cuadrantes = 0 then
						write('| ');
				end;
			writeln;
			if i mod cuadrantes = 0 then
				writeln('------------------------');
		end;
		textcolor(white);
end;

//CREAMOS UN PROCEDIMIENTO PARA INICIAR LA MATRIZ CON CEROS Y AGREGAR LAS PISTAS

procedure inicioPistas(var tablero, solucion: matriz);
var
  i,j, p: integer; 
begin
  //INICIAMOS LA MATRIZ CON CEROS
  for i := 1 to filas do 
    for j := 1 to columnas do 
    begin   
      tablero[i,j] := 0;
      solucion[i,j] := 0;    
    end;

  //SE PROCEDE A CARGAR LAS PISTAS DEL TABLERO
  
  for p := 1 to pistas do
  begin
	  tablero[1,6] := 1;
	  tablero[1,7] := 6;
	  tablero[1,8] := 9;
	  tablero[1,9] := 3;
	  tablero[2,1] := 6;
	  tablero[2,3] := 9;
	  tablero[2,5] := 3;
	  tablero[2,8] := 8;
	  tablero[3,1] := 3;
	  tablero[3,5] := 2;
	  tablero[3,6] := 9;
	  tablero[3,7] := 5;
	  tablero[4,2] := 9;
	  tablero[4,4] := 1;
	  tablero[4,5] := 7;
	  tablero[4,9] := 4;
	  tablero[5,1] := 7;
	  tablero[5,3] := 4;
	  tablero[5,7] := 1;
	  tablero[5,9] := 6;
	  tablero[6,1] := 1;
	  tablero[6,5] := 8;
	  tablero[6,6] := 2;
	  tablero[6,8] := 7;
	  tablero[7,3] := 3;
	  tablero[7,4] := 9;
	  tablero[7,5] := 1;
	  tablero[7,9] := 2;
	  tablero[8,2] := 2;
	  tablero[8,5] := 5;
	  tablero[8,7] := 3;
	  tablero[8,9] := 8;
	  tablero[9,1] := 8;
	  tablero[9,2] := 7;
	  tablero[9,3] := 5;
	  tablero[9,4] := 2;
	  begin
	 solucion[1,1] := 2;
	 solucion[1,2] := 5;
	 solucion[1,3] := 7;
	 solucion[1,4] := 8;
	 solucion[1,5] := 4;
	 solucion[1,6] := 1;
	 solucion[1,7] := 6;
	 solucion[1,8] := 9;
	 solucion[1,9] := 3;
	 solucion[2,1] := 6;
	 solucion[2,2] := 4;
	 solucion[2,3] := 9;
	 solucion[2,4] := 5;
	 solucion[2,5] := 3;
	 solucion[2,6] := 7;
	 solucion[2,7] := 2;
	 solucion[2,8] := 8;
	 solucion[2,9] := 1;
	 solucion[3,1] := 3;
	 solucion[3,2] := 1;
	 solucion[3,3] := 8;
	 solucion[3,4] := 6;
	 solucion[3,5] := 2;
	 solucion[3,6] := 9;
	 solucion[3,7] := 5;
	 solucion[3,8] := 4;
	 solucion[3,9] := 7;
	 solucion[4,1] := 5;
	 solucion[4,2] := 9;
	 solucion[4,3] := 2;
	 solucion[4,4] := 1;
	 solucion[4,5] := 7;
	 solucion[4,6] := 6;
	 solucion[4,7] := 8;
	 solucion[4,8] := 3;
	 solucion[4,9] := 4;
	 solucion[5,1] := 7;
	 solucion[5,2] := 8;
	 solucion[5,3] := 4;
	 solucion[5,4] := 3;
	 solucion[5,5] := 9;
	 solucion[5,6] := 5;
	 solucion[5,7] := 1;
	 solucion[5,8] := 2;
	 solucion[5,9] := 6;
	 solucion[6,1] := 1;
	 solucion[6,2] := 3;
	 solucion[6,3] := 6;
	 solucion[6,4] := 4;
	 solucion[6,5] := 8;
	 solucion[6,6] := 2;
	 solucion[6,7] := 9;
	 solucion[6,8] := 7;
	 solucion[6,9] := 5;
	 solucion[7,1] := 4;
	 solucion[7,2] := 6;
	 solucion[7,3] := 3;
	 solucion[7,4] := 9;
	 solucion[7,5] := 1;
	 solucion[7,6] := 8;
	 solucion[7,7] := 7;
	 solucion[7,8] := 5;
	 solucion[7,9] := 2;
	 solucion[8,1] := 9;
	 solucion[8,2] := 2;
	 solucion[8,3] := 1;
	 solucion[8,4] := 7;
	 solucion[8,5] := 5;
	 solucion[8,6] := 4;
	 solucion[8,7] := 3;
	 solucion[8,8] := 6;
	 solucion[8,9] := 8;
	 solucion[9,1] := 8;
	 solucion[9,2] := 7;
	 solucion[9,3] := 5;
	 solucion[9,4] := 2;
	 solucion[9,5] := 6;
	 solucion[9,6] := 3;
	 solucion[9,7] := 4;
	 solucion[9,8] := 1;
	 solucion[9,9] := 9;
	 end;
  end;
end;
//CREAMOS UNA FUNCION Y UN PROCEDIMIENTO PARA VERIFICAR QUE LA CELDA SELECCIONADA ES UNA PISTA O NO

function es_una_pista(i, j: integer): boolean;
begin
	es_una_pista := tablero[i,j] <> 0;
end;

//CREAMOS FUNCION PARA VERIFICAR QUE EL NUMERO INGRESADO ESTA DENTRO DEL RANGO PERMITIDO

function rangoPermitido(num: integer): boolean;
begin
	rangoPermitido := (num >= 1) and (num <= 9);
end;

//CREAMOS FUNCION PARA VERIFICAR SI UN NUMERO EXISTE EN LA FILA

function ya_se_encuentra_en_la_fila(tablero: matriz; f,num: integer):boolean;
var 
  c: integer;
begin
	for c := 1 to columnas do
		if tablero[f,c]=num then
			begin
				ya_se_encuentra_en_la_fila:=false;
				exit; //AÑADIMOS "EXIT" PARA SALIR DEL CICLO LUEGO DE ENCONTRAR EL NÚMERO
			end;
		ya_se_encuentra_en_la_fila:=true;
		end;

//CREAMOS FUNCION PARA VERIFICAR SI UN NUMERO EXISTE EN LA COLUMNA

function ya_se_encuentra_en_la_columna(tablero: matriz; c,num: integer):boolean;
var
	f: integer;
begin
	for f := 1 to filas do
		if tablero[f,c]=num then
			begin
				ya_se_encuentra_en_la_columna:=false;
				exit; //AÑADIMOS "EXIT" PARA SALIR DEL CICLO LUEGO DE ENCONTRAR EL NÚMERO
			end;
		ya_se_encuentra_en_la_columna:=true;
		end;

//CREAMOS FUNCION PARA VERIFICAR SI UN NUMERO EXISTE EN EL CUADRANTE

function ya_se_encuentra_en_el_cuadrante(tablero: matriz; filas,columnas,num: integer):boolean;
var
	cuadrante_fila, cuadrante_columna, i, j: integer; 
begin
	cuadrante_fila:=((filas-1) div cuadrantes)+1; 
	cuadrante_columna:=((columnas-1) div cuadrantes)+1; 
	for i:=((cuadrante_fila-1)*cuadrantes)+1 to cuadrante_fila*cuadrantes do 
		for j:=((cuadrante_columna-1)*cuadrantes)+1 to cuadrante_columna*cuadrantes do 
			if tablero[i,j]=num then
				begin
					ya_se_encuentra_en_el_cuadrante:=false;
					exit; //AÑADIMOS "EXIT" PARA SALIR DEL CICLO LUEGO DE ENCONTRAR EL NÚMERO
				end;
			ya_se_encuentra_en_el_cuadrante:=true;
			end;

//CREAMOS UN PROCEDIMIENTO PARA PERMITIR QUE EL USUARIO INGRESE NUMEROS EN LAS CELDAS VACIAS

procedure ingresarNumero(var tablero, solucion: matriz);
var
	i, j, num: integer;
	completado, rendirse: boolean;
	resp: string;
begin
	completado := false;//INDICAMOS QUE EL JUEGO NO SE HA COMPLETADO TODAVIA
	rendirse := false;
while not completado do
begin
	textcolor(yellow);
	writeln('..........................................................');
	write('Seleccione la fila en la que desea agregar un numero.(1-9): ');
	readln(i);

	writeln('.............................................................');
	write('Seleccione la columna en la que desea agregar un numero.(1-9): ');
	readln(j);
	
	writeln('..............................');
	write('Ingrese un numero valido (1-9): ');
	readln(num);
	clrscr;
	
//VERIFICAMOS SI LA CELDA CORRESPONDE A UNA PISTA

	if tablero[i,j] <> 0 then
	begin
		writeln('No se puede modificar una pista');
		exit;
	end;
	
	if rangoPermitido(num) then
		if ya_se_encuentra_en_la_fila(tablero, i, num) then
			if ya_se_encuentra_en_la_columna(tablero, j, num) then
				if ya_se_encuentra_en_el_cuadrante(tablero, i, j, num) then
				begin
					textcolor(white);
					tablero[i,j] := num;
					mostrarTablero(tablero);
				end
				else 
					writeln('Numero invalido. Por favor, ingrese un numero del 1 al 9.')
				else
					writeln('Movimiento invalido. Por favor, intente nuevamente')
				else
					writeln('Movimiento invalido. Por favor, intente nuevamente')
				else
					writeln('Movimiento invalido. Por favor, intente nuevamente');
					
//MOSTRAMOS LA OPCION RENDIRSE
	
		textcolor(red);
		write('Deseas rendirte? (Si o no): ');
		readln(resp);
	
		if (resp = 'si') then
			rendirse := true
		else 
			rendirse := false;
			
		if resp = 'si' then
		begin
			clrscr;
			writeln('------------------------------');
			writeln('Te has rendido. Fin del juego!');
			writeln('------------------------------');
			writeln('La solucion del tablero es:');
			inicioPistas(solucion, tablero);
			mostrarTablero(solucion);
			exit;
		end;

// VERIFICAMOS QUE EL TABLERO ESTE COMPLETADO

		completado := true;
			for i := 1 to filas do
				for j := 1 to columnas do
					if tablero[i,j] = 0 then
					completado := false;
	end;
	
	textcolor(yellow);
	writeln('--------------------------------------');
	writeln('FELICITACIONES! HA CULMINADO EL JUEGO.');
	writeln('--------------------------------------');
end;

begin

	textcolor(yellow);
	writeln('---------------------------------------');
	writeln('BIENVENIDO A ULTIMATE SUDOKU EXPERIENCE');
	writeln('---------------------------------------');
	
	textcolor(white);
	writeln('---------------------------------------');
	writeln('INGRESE SU NOMBRE');
	write('NOMBRE: ');
	readln(nombre);
	writeln('---------------------------------------');
	writeln('INGRESE NICK/USUARIO');
	write('NICK/USUARIO: ');
	readln(nick);
	ClrScr;
 
    writeln(' ------------------');
    writeln(' NOMBRE:  ', nombre);//SE LE MUESTRA AL USUARIO EL NOMBRE Y SU NICK/USUARIO INGRESADO
    writeln(' NICK/USUARIO: ', nick);
    writeln('------------------');
    ClrScr;

	textcolor(yellow);
    writeln('---------------------------------------');
    writeln('BIENVENIDO ', NICK, ' ');
    writeln('---------------------------------------');
    textcolor(white);
    repeat 
    writeln('---------------------------------------');
	writeln('POR FAVOR, ELIJA UNA OPCION');   //SE LE INDICA AL USUARIO SI DESEA JUGAR O NO
	writeln('1. jugar');
	writeln('2. salir');
	writeln('---------------------------------------');
	readln(op);
	ClrScr;
	
	if op=1 then
		begin
			textcolor(yellow);
			writeln('---------------------------------------');
			writeln('Que empiece el juego!');
			writeln('---------------------------------------');
			textcolor(white);
			inicioPistas(tablero, solucion);
			mostrarTablero(tablero);
			ingresarNumero(tablero, solucion);
			
		end
		else if op <>2 then
			writeln('la opcion selecionada es invalida, por favor seleccione una opcion valida.');
		until op=2;
		begin
			textcolor(yellow);
			writeln('----------------------------------------');
			writeln('Gracias por su visita, hasta pronto');
			writeln('----------------------------------------');
		end;
end.

{Elaborado por:
	Paola Marquez. C.I: 27.125.784
	Gabriel Cardona. C.I: 29.789.024}
