M=zeros(4);
M1=prod(M);M2=prod(M1);
while M2==0
    a=floor(16*rand);
    b=a/4; bi=floor(b)+1; bj=mod(a,4)+1;
    while M(bi,bj)~=0
        if a==15
            a=-1;
        end
        a=a+1;
        b=a/4; bi=floor(b)+1; bj=mod(a,4)+1;
    end
    c=2*ceil(2*rand);
    M(bi,bj)=c;
    M1=prod(M);M2=prod(M1);
    clc
    M
    sentido=input('�Hacia d�nde mueves? ','s');
    switch sentido
        case 'd'
            for i=1:4
                for j=1:3
                    if M(i,j+1)==0
                        M(i,j+1)=M(i,j);
                        M(i,j)=0;
                    end
                end    
                for j=4:-1:2
                    if M(i,j)==M(i,j-1)
                        M(i,j)=M(i,j)+M(i,j-1);
                        M(i,j-1)=0;
                    end
                end
                for j=1:3
                    if M(i,j+1)==0
                        M(i,j+1)=M(i,j);
                        M(i,j)=0;
                    end
                end                        
                        
            end
            case 'i'
            for i=1:4
                for j=4:-1:2
                    if M(i,j-1)==0
                        M(i,j-1)=M(i,j);
                        M(i,j)=0;
                    end
                end    
                for j=1:3
                    if M(i,j)==M(i,j+1)
                        M(i,j)=M(i,j)+M(i,j+1);
                        M(i,j+1)=0;
                    end
                end
                for j=4:-1:2
                    if M(i,j-1)==0
                        M(i,j-1)=M(i,j);
                        M(i,j)=0;
                    end
                end                        
                        
            end
             case 'a'
            for j=1:4
                for i=4:-1:2
                    if M(i-1,j)==0
                        M(i-1,j)=M(i,j);
                        M(i,j)=0;
                    end
                end    
                for i=1:3
                    if M(i,j)==M(i+1,j)
                        M(i,j)=M(i,j)+M(i+1,j);
                        M(i+1,j)=0;
                    end
                end
                for i=4:-1:2
                    if M(i-1,j)==0
                        M(i-1,j)=M(i,j);
                        M(i,j)=0;
                    end
                end   
                
            end
    case 'b'
            for j=1:4
                for i=1:3
                    if M(i+1,j)==0
                        M(i+1,j)=M(i,j);
                        M(i,j)=0;
                    end
                end    
                for i=4:-1:2
                    if M(i,j)==M(i-1,j)
                        M(i,j)=M(i,j)+M(i-1,j);
                        M(i-1,j)=0;
                    end
                end
                for i=1:3
                    if M(i+1,j)==0
                        M(i+1,j)=M(i,j);
                        M(i,j)=0;
                    end
                end                        
                        
            end
    end
end


    