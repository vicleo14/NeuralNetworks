function W2 = GenerarW2(S)
     %El calculo de epsilon se genera en dos pasos para hacer mas entendible
    %el codigo. Primero se calcula el limite superior en la primera linea y
    %en la segunda se obtiene un valor aleatorio entre 0.1 y el limite
    %superior.
    epsilon=0;
    while epsilon==0
        epsilon=(1/(S-1))*rand;
    end
    fprintf("Epsilon:%d",epsilon);
    %Creamos la matriz W2 con ceros menos epsilon
    W2=zeros(S,S)-epsilon;
    %Llena la diagonal de la matriz con 1's.
    for i=1:S
        W2(i,i)=1;
    end


end

