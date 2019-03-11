function W2 = GenerarW2(S)
%   Con el fin de un c�digo mas legible se crea esta funci�n encargar�
%   de generar nuestra matr�z de pesos W2 a partir de un �psilon aleatorio
%    y 1's en la diagonal principal. Tal y como est� especificada la
%    construcci�n de esta matriz por el modelo de la red de Hamming
%Fecha de elaboraci�n: 2019/03/07
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
 
    epsilon=0;
    while epsilon==0
        epsilon=(1/(S-1))*rand;
    end
    fprintf("Epsilon:%d\n",epsilon);
    %Creamos la matriz W2 con ceros menos epsilon
    W2=zeros(S,S)-epsilon;
    %Llena la diagonal de la matriz con 1's.
    for i=1:S
        W2(i,i)=1;
    end


end

