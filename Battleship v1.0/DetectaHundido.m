function [ hundido ] = DetectaHundido(  )
%Detecta cuando se hunde un barco
global tablero
contador_tocado=0;    %muestra el número de veces que ha sido tocado

for i=1:10            %cuanto el número de '3' que hay en el tablero
    for j=1:10
         if tablero(i,j)==3
            contador_tocado=contador_tocado+1;   
         end
    end
end
if contador_tocado==4  %si hay cuatro '3' el barco se marca como hundido '4'
    for i=1:10
        for j=1:10
             if tablero(i,j)==3   
              tablero(i,j)=4;
             end
         end
    end
    hundido=true;    %hundido-fin de la partida
else
   hundido=false;    %aún no ha sido hundido
end
end

