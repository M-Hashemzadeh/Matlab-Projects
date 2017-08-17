function [  ] = DispTablero( accion )
%Creamos las letras y números del tablero
%La entrada es el resultado de la jugada anterior

clc
global tablero
fprintf('  1 2 3 4 5 6 7 8 910\n')  %crea una fila con los números de las columnas

for i=1:10 
    fprintf('%c',i+64) %Sabiendo que en ASCII 'A' equivale a 65
    for j=1:10
         switch tablero(i,j)
             case 0 %nada
                 fprintf(' .');
             case 1 %barco
                 fprintf(' .');
             case 2 %agua
                 fprintf(' o');
             case 3 %tocado
                 fprintf(' @');
             case 4 %hundido
                 fprintf(' #');
         end
    end
    fprintf('\n');
end

if accion==2        %Dependiendo del resultado de la jugada anterior
    fprintf('-----¡¡AGUA :(!!-----\n');
elseif accion==3
    fprintf('-----¡¡TOCADOO!!-----\n');
    beep;
elseif accion==4
    fprintf('-----¡¡HUNDIDO!!-----\n');
    beep;
end
end


