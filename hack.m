% parejas

letras=['ABCDEFGHIJKLMNOPQRSTUVWXYZ?! '];

mpista=input('mensaje cifrado: ','s');
mreal=input('mensaje correspondiente: ','s');
completo=input('mensaje cifrado completo: ','s');
complet=convertir(completo,letras);
c=MaM(complet);
fake=convertir(mpista,letras);
og=convertir(mreal,letras);
maco=MaM(og);
j=MaM(fake);
maco=maco';
j=j';
a2=gj2(j,maco,29);
a2=a2';
gy=mod(a2*c,29);
mga=MaM(gy);
x=find(mga==0);
for i=1:length(x)
    mga(x(i))=29;
end
real=Conv(letras,mga)

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

function Nuevo=Conv(ulule,secreto)
    l=length(secreto);
    for i=1:l
        if secreto(i) == 29
            Nuevo(i)=ulule(1);
        else
            Nuevo(i)=ulule(secreto(i)+1);
        end
    end
end

function num=convertir(m,abc)
    l=length(m);
    for i=1:l
        x=m(i)==abc;
        num(i)=find(x)-1;
    end
end
%suma modular

function [y] = sm(z,x,m)
    for n=1:length(z)
        a=z(n);
        b=x(n);
        y(n)=mod(a+b,m);
    end
end

%productoEscalar
function [p] = prod(v,s,m)
    for i=1:length(v)
        p(i)=mod(s*v(i),m);
    end
end

% inverso multiplicativo

function [im] = f(s,m)
    for i=1:(m-1)
        while mod(i*s,m) == 1
           im=i;
           break
        end
    end
end

function [invt] = gj2(cifrado,original,modulo)
    s=size(cifrado);
    s=s(1);
    p=horzcat(cifrado,original);
    for i=1:s
            if i<s
                n=i+1;
                while p(i,i)==0
                    if p(n,i)~=0
                        x=p(i,:);
                        p(i,:)=p(n,:);
                        p(n,:)=x;
                        n=n+1;
                    end
                end
                im=f(p(i,i),modulo); 
                p(i,:)=prod(p(i,:),im,modulo);
                for r=i+1:s
                    while p(r,i)~=0
                        p(r,:)=sm(p(r,:),p(i,:),modulo);
                    end
                end
            else
                k=f(p(i,i),modulo);
                p(i,:)=prod(p(i,:),k,modulo);
            end
    end
    for c=s:-1:2
        while p(c-1,c)~=0
            p(c-1,:)=sm(p(c-1,:),p(c,:),modulo);
        end
    end
    invt=p(:,s+1:2*s);
end