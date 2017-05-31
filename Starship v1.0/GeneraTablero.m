function [ matriz ] = GeneraTablero(  )
%Esta función genera el tablero de 10x10 
%necesario para el juego
matriz=zeros(10,10);
%Generamos un punto aleatorio
barco_x=floor(rand(1)*10+1);
barco_y=floor(rand(1)*10+1);
matriz(barco_x,barco_y)=1;
ok=false;
while ~ok %ahora generamos el barco de 4 casillas
    dir=floor(rand(1)*4); %creamos una dirección para el barco
    switch dir              %se comprueba que la dirección sea posible
        case 0 %derecha
            if barco_y+3<=10
                for i=barco_y:barco_y+3
                    matriz(barco_x,i)=1;
                end
                 ok=true;
            end
        case 1 %abajo
            if barco_x+3<=10 
                for i=barco_x:barco_x+3
                    matriz(i,barco_y)=1;
                end
                ok=true;
            end 
        case 2 %izquierda
            if barco_y-3>0 
                for i=barco_y:-1:barco_y-3
                    matriz(barco_x,i)=1;
                end
                ok=true;
            end
        case 3 %arriba
            if barco_x-3>0 
                for i=barco_x:-1:barco_x-3
                    matriz(i,barco_y)=1;
                end
                 ok=true;
            end
    end
end

