function [ salida] = ComprobarMovimiento(matriz,turno,fila0,columna0,fila1,columna1)
%Comprueba si es un movimiento válido
%   Primero comprueba que ficha es, y dependiendo cual sea comprueba si el
%   movimiento está permitido o no, teniendo en cuenta la existencia de
%   otras fichas por medio.
%   turno: blancas->0   negras->1
%   salida={0 -> movimiento incorrecto
%          {1 -> movimiento correcto
%          {2 -> movimiento correcto y ficha comida
%          {3 -> movimiento correcto y REY comido}
if fila1==fila0 && columna1==columna0
    salida=0;
elseif 0<=fila1>8 || 0<=columna1>8 || 0<=fila0>8 || 0<=columna0>8
    salida=0;
elseif turno==0 && matriz(fila0,columna0)>6
    salida=0;
elseif turno==1 && matriz(fila0,columna0)<7
    salida=0;
else
switch matriz(fila0,columna0)
    case 1 %PEONES
        if (fila1-fila0==-1) && columna1==columna0 && ~matriz(fila1,columna1)
            salida=1;
        elseif (fila1-fila0==-1) && abs(columna1-columna0)==1 && matriz(fila1,columna1)
            salida=2;
        else
            salida=0;
        end
        
        
        
    case 7 %PEONES
        if (fila1-fila0==1) && columna1==columna0 && ~matriz(fila1,columna1)
            salida=1;
        elseif (fila1-fila0==1) && abs(columna1-columna0)==1 && matriz(fila1,columna1)
            salida=2;
        else
            salida=0;
        end
        
        
        
    case 3 %ALFILES
        if abs(fila1-fila0)==abs(columna1-columna0)
            %si es verdadero, el movimiento es diagonal
            for i=1:abs(fila1-fila0)
                if i==abs(fila1-fila0)
                     %si ha llegado al final es xq no hay obstaculos
                    if matriz(fila1,columna1)~=0 %si hay una ficha, la come
                        salida=2;
                    else
                        salida=1;
                    end
                    break;
                end
                if matriz(fila0+i*(sign(fila1-fila0)),columna0+i*(sign(columna1-columna0)))~= 0
                    %si en la diagonal hay algún obstáculo
                    salida=0;
                    break;
                end
            end          
        end
    case 9 %ALFILES
        if abs(fila1-fila0)==abs(columna1-columna0)
            %si es verdadero, el movimiento es diagonal
            for i=1:abs(fila1-fila0)
                if i==abs(fila1-fila0)
                     %si ha llegado al final es xq no hay obstaculos
                    if matriz(fila1,columna1)~=0 %si hay una ficha, la come
                        salida=2;
                    else
                        salida=1;
                    end
                    break;
                end
                if matriz(fila0+i*(sign(fila1-fila0)),columna0+i*(sign(columna1-columna0)))~= 0
                    %si en la diagonal hay algún obstáculo
                    salida=0;
                    break;
                end
            end          
        end
        
        
    case 2 %CABALLOS
        if (abs(fila1-fila0)+abs(columna1-columna0))==3 && abs((fila1-fila0)*(columna1-columna0))==2
            if matriz(fila1,columna1)==0
                salida=1;
            else
                salida=2;
            end
        else
            salida=0;
        end
        
    case  8 %CABALLOS
        if (abs(fila1-fila0)+abs(columna1-columna0))==3 && abs((fila1-fila0)*(columna1-columna0))==2
            if matriz(fila1,columna1)==0
                salida=1;
            else
                salida=2;
            end
        else
            salida=0;
        end     
        
    
    
    case 10 %TORRES            
        if (fila1-fila0)==0 %movimiento horizontal
            for i=1:abs(columna1-columna0)
                if i==abs(columna1-columna)%si ha llegado al final es xq no hay obstaculos
                    if matriz(fila1,columna1)~=0 %si hay una ficha, la come
                        salida=2;
                    else
                        salida=1;
                    end
                    break;
                end
                if matriz(fila0,columna0+i)~= 0
                    %si en el movimiento hay algún obstáculo
                    salida=0;
                    break;
                end
            end
        elseif (columna1-columna0)==0 %movimiento vertical
            for i=1:abs(fila1-fila0)
                if i==abs(columna1-columna0)%si ha llegado al final es xq no hay obstaculos
                    if matriz(fila1,columna1)~=0 %si hay una ficha, la come
                        salida=2;
                    else
                        salida=1;
                    end
                    break;
                end
                if matriz(fila0+i,columna0)~= 0
                    %si en el movimiento hay algún obstáculo
                    salida=0;
                    break;
                end
            end
        else
            salida=0;
        end  
   case 10 %TORRES            
        if (fila1-fila0)==0 %movimiento horizontal
            for i=1:abs(columna1-columna0)
                if i==abs(columna1-columna)%si ha llegado al final es xq no hay obstaculos
                    if matriz(fila1,columna1)~=0 %si hay una ficha, la come
                        salida=2;
                    else
                        salida=1;
                    end
                    break;
                end
                if matriz(fila0,columna0+i)~= 0
                    %si en el movimiento hay algún obstáculo
                    salida=0;
                    break;
                end
            end
        elseif (columna1-columna0)==0 %movimiento vertical
            for i=1:abs(fila1-fila0)
                if i==abs(columna1-columna0)%si ha llegado al final es xq no hay obstaculos
                    if matriz(fila1,columna1)~=0 %si hay una ficha, la come
                        salida=2;
                    else
                        salida=1;
                    end
                    break;
                end
                if matriz(fila0+i,columna0)~= 0
                    %si en el movimiento hay algún obstáculo
                    salida=0;
                    break;
                end
            end
        else
            salida=0;
        end  
        
        
        
    case 5 %DAMAS (torres+alfiles)
        if (fila1-fila0)==0 %movimiento horizontal
            for i=1:abs(columna1-columna0)
                if i==abs(columna1-columna)%si ha llegado al final es xq no hay obstaculos
                    if matriz(fila1,columna1)~=0 %si hay una ficha, la come
                        salida=2;
                    else
                        salida=1;
                    end
                    break;
                end
                if matriz(fila0,columna0+i)~= 0
                    %si en el movimiento hay algún obstáculo
                    salida=0;
                    break;
                end
            end
        elseif (columna1-columna0)==0 %movimiento vertical
            for i=1:abs(fila1-fila0)
                if i==abs(columna1-columna0)%si ha llegado al final es xq no hay obstaculos
                    if matriz(fila1,columna1)~=0 %si hay una ficha, la come
                        salida=2;
                    else
                        salida=1;
                    end
                    break;
                end
                if matriz(fila0+i,columna0)~= 0
                    %si en el movimiento hay algún obstáculo
                    salida=0;
                    break;
                end
            end
        elseif abs(fila1-fila0)==abs(columna1-columna0)
            %si es verdadero, el movimiento es diagonal
            for i=1:abs(fila1-fila0)
                if i==abs(fila1-fila0)
                     %si ha llegado al final es xq no hay obstaculos
                    if matriz(fila1,columna1)~=0 %si hay una ficha, la come
                        salida=2;
                    else
                        salida=1;
                    end
                    break;
                end
                if matriz(fila0+i*(sign(fila1-fila0)),columna0+i*(sign(columna1-columna0)))~= 0
                    %si en la diagonal hay algún obstáculo
                    salida=0;
                    break;
                end
            end
        else
            salida=0;
        end
    case 11 %DAMAS (torres+alfiles)
        if (fila1-fila0)==0 %movimiento horizontal
            for i=1:abs(columna1-columna0)
                if i==abs(columna1-columna)%si ha llegado al final es xq no hay obstaculos
                    if matriz(fila1,columna1)~=0 %si hay una ficha, la come
                        salida=2;
                    else
                        salida=1;
                    end
                    break;
                end
                if matriz(fila0,columna0+i)~= 0
                    %si en el movimiento hay algún obstáculo
                    salida=0;
                    break;
                end
            end
        elseif (columna1-columna0)==0 %movimiento vertical
            for i=1:abs(fila1-fila0)
                if i==abs(columna1-columna0)%si ha llegado al final es xq no hay obstaculos
                    if matriz(fila1,columna1)~=0 %si hay una ficha, la come
                        salida=2;
                    else
                        salida=1;
                    end
                    break;
                end
                if matriz(fila0+i,columna0)~= 0
                    %si en el movimiento hay algún obstáculo
                    salida=0;
                    break;
                end
            end        
         elseif abs(fila1-fila0)==abs(columna1-columna0)
            %si es verdadero, el movimiento es diagonal
            for i=1:abs(fila1-fila0)
                if i==abs(fila1-fila0)
                     %si ha llegado al final es xq no hay obstaculos
                    if matriz(fila1,columna1)~=0 %si hay una ficha, la come
                        salida=2;
                    else
                        salida=1;
                    end
                    break;
                end
                if matriz(fila0+i*(sign(fila1-fila0)),columna0+i*(sign(columna1-columna0)))~= 0
                    %si en la diagonal hay algún obstáculo
                    salida=0;
                    break;
                end
            end
        else
            salida=0;
        end    
        
        
    case 6 %REYES
        if (abs(fila1-fila0)+abs(columna1-columna0))==1
            if matriz(fila1,columna1)==0
                salida=1;
            else
                salida=2;
            end
        else
            salida=0;
        end
    case 12 %REYES
        if (abs(fila1-fila0)+abs(columna1-columna0))==1
            if matriz(fila1,columna1)==0
                salida=1;
            else
                salida=2;
            end
        else
            salida=0;
        end
    otherwise
        salida=0;
end

end
end


