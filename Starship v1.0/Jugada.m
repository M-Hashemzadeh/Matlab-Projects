function [ j_realizada ] = Jugada(numero,letra)
%Esta función se encarga de realizar la jugadada introducida
%La entrada son la fila y la columna
%y la salida el resultado de la jugada

global tablero
switch tablero(letra-96,numero) %Sabiendo que la 'a' equivale a 97 en ASCII
    case 0          %si hay un '0' (nada), pone un '2' (agua)
        tablero(letra-96,numero)=2;
        j_realizada=2;
    case 1          %si hay un '1' (barco), pone un 3('barco tocado')
        tablero(letra-96,numero)=3;
        j_realizada=3;
    otherwise       %si no hay ni '0' ni '1', el punto ya ha sido disparado
        j_realizada=-1;
end
end

