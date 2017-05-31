M=zeros(8,8);
M(7,:)=1;M(2,:)=7; %Peones blancos=1; Peones negros=7;
M(8,2)=2;M(8,7)=2;M(1,2)=8;M(1,7)=8; %Caballos ídem.
M(8,3)=3;M(8,6)=3;M(1,3)=9;M(1,6)=9; %Alfiles ídem.
M(8,1)=4;M(8,8)=4;M(1,1)=10;M(1,8)=10; %torres ídem.
M(8,4)=5;M(1,4)=11; %Damas.
M(8,5)=6;M(1,5)=12; %Reyes.
%Si n<=6 -> Piezas blancas.
coord=zeros(1,4);

while 1 %Suponemos que el juego no termina, de momento.
    
    %BLANCAS
    fprintf('\n<<<TURNO DE LAS BLANCAS.>>>\n \n');
    MostrarTablero(M);
    fprintf('\n<<<Tienes que poner números del 1 al 8.>>>\n \n')
    
    a=input('Fila de la pieza que se quiere mover: '); %Suponiendo 1<a<8:
    b=input('Columna de la pieza que se quiere mover: ');
    c=input('Fila donde se quiere mover: ');
    d=input('Columna donde se quiere mover: ');
    while isnumeric(a)==-1 || isnumeric(b)==0 || isnumeric(c)==0 || isnumeric(d)==0
        a=input('Fila de la pieza que se quiere mover: '); %Suponiendo 1<a<8:
        b=input('Columna de la pieza que se quiere mover: ');
        c=input('Fila donde se quiere mover: ');
        d=input('Columna donde se quiere mover: ');
    end
    
    resultado_jugada=ComprobarMovimiento(M,0,a,b,c,d);
    if resultado_jugada==1
        m=M(a,b);M(a,b)=0;M(c,d)=m;
        clc;
    elseif resultado_jugada==2
        m=M(a,b);M(a,b)=0;M(c,d)=m;
        clc;
        fprintf('FICHA COMIDA\n\n');
    elseif resultado_jugada==3
        MostrarTablero(M);
        fprintf('PARTIDA TERMINADA\n\n');
    else
        clc;
        fprintf('JUGADA ERRÓNEA\n\n');
    end
    
  
    %NEGRAS
    fprintf('\n<<<TURNO DE LAS NEGRAS.>>>\n \n');
    MostrarTablero(M);
    fprintf('\n<<<Tienes que poner números del 1 al 8.>>>\n \n')

    a=input('Fila de la pieza que se quiere mover: '); %Suponiendo 1<a<8:
    b=input('Columna de la pieza que se quiere mover: ');
    c=input('Fila donde se quiere mover: ');
    d=input('Columna donde se quiere mover: ');
    while isnumeric(a)==0 || isnumeric(b)==0 || isnumeric(c)==0 || isnumeric(d)==0
        a=input('Fila de la pieza que se quiere mover: '); %Suponiendo 1<a<8:
        b=input('Columna de la pieza que se quiere mover: ');
        c=input('Fila donde se quiere mover: ');
        d=input('Columna donde se quiere mover: ');
    end

    resultado_jugada=ComprobarMovimiento(M,1,a,b,c,d);
    if resultado_jugada==1
        m=M(a,b);M(a,b)=0;M(c,d)=m;
        clc;
    elseif resultado_jugada==2
        m=M(a,b);M(a,b)=0;M(c,d)=m;
        clc;
        fprintf('FICHA COMIDA\n\n');
    elseif resultado_jugada==3
        MostrarTablero(M);
        fprintf('PARTIDA TERMINADA\n\n');
    else
        clc;
        fprintf('JUGADA ERRÓNEA\n\n');
    end
    
end
        

