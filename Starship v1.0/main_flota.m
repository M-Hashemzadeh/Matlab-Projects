%Con este main se ejecuta el juego
clc;clear all;
beep on
reset(RandStream.getGlobalStream,sum(100*clock)); %Resetea el Rand (EXE)
global tablero              %Tablero oculto
tablero=GeneraTablero;      
terminado=false;            %Comprueba si el juego ha terminado
contador_jugadas=0;         %Nº jugadas
resultado=0;                %Resultado de la ultima jugada (2->agua,
                            % 3->tocado, 4->hundido, -1->jugada repetida)
while ~terminado     %Se repite hasta terminar
    if resultado==-1
    clc
    fprintf('¡¡ESTA JUGADA YA HA SIDO REALIZADA!!\n');
    pause(2);
    end
    
    DispTablero(resultado)
    fprintf('El número de jugadas realizadas es: %g\n',contador_jugadas);
    fprintf('[------------------------------------]\n');
    
    letra=lower(input('Escribe la letra de fila: ','s'));
    if length(letra)~=1 || ischar(letra)~=1|| letra<'a' || letra>'j'
        %Comprobamos que no haya fallos en la entrada
        resultado=0;
        clc
        fprintf('¡¡La fila ha de ser una LETRA (A-J)!!\n');
        pause(2);
        continue;
    end
    numero=input('Escribe el número de columna: ','s');
    if isnan(str2double(numero))==1 || str2double(numero)>10 || str2double(numero)<1
        %Comprobamos que no haya fallos en la entrada
        resultado=0;
        clc
        fprintf('¡¡La columna ha de ser un NÚMERO (1-10)!!\n')
        pause(2);
        continue;
    end
    
    resultado=Jugada(str2double(numero),letra);
    contador_jugadas=contador_jugadas+1;
    terminado=DetectaHundido;
end
if terminado==true
    resultado=4;
    DispTablero(resultado);
    fprintf('[---------------------------------]\n');
    fprintf('ENHORABUENA, HAS GANADO LA PARTIDA\n')
end