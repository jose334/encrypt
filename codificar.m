%codificar
%key matrix 
A=[23,4;15,11];
letras=['abcdefghijklmnopqrstuvwxyz.? '];

mensaje=input('Ingrese el mensaje: ','s');
l=length(mensaje);
if mod(l,2)==1
    mensaje(end+1)=' ';
end
   
n=convertir(mensaje,letras);
codif=codifique(n,A);
codif=MaM(codif);
Mensaje_codificado=Conv(letras,codif)

function Nuevo=Conv(ulule,secreto)
    l=length(secreto);
    for i=1:l
        Nuevo(i)=ulule(secreto(i));
    end
end
    
function num=convertir(m,abc)
    l=length(m);
    for i=1:l
        x=m(i)==abc;
        num(i)=find(x);
    end
end

function b=codifique(m,a)
    n=MaM(m);
    b=mod(a*n,29);
end

function j=MaM(m)
    s=size(m);
    l=s(2);
    if s(1)==1
        m(2,:)=0;
        x=m(1,:);
        for i=1:l/2
            m(:,i)=x(i*2-1:i*2);
        end
        j=m(:,1:l/2);
    elseif s(1)==2
        x=m;
        m(:,l+1:l*2)=0;
        for i=1:l
            m(1,i*2-1:i*2)=x(:,i);
        end
        j=m(1,:);
    end
end