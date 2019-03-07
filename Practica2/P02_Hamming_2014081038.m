function [] = 	P02_Hamming_2014081038()
%P2: Red de Hamming 
%   Implementacion de la red de Hamming con lectura de vectores 
%   prototipo y vector de entrada desde archivo txt; asi como la
%   graficacion de los resultados en las iteraciones
%Fecha de elaboracion: 2019/03/07
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    archivoVecIn=input('Ingrese el nombre del archivo que contiene el vector de entrada: ','s');
    fileVecIn = fopen(strcat(archivoVecIn,'.txt'),'r');
    p=fscanf(fileVecIn,"%d");
    [R,n]=size(p);
    %fprintf("Tam:%d",R);
    
    archivoVectores=input('Ingrese el nombre del archivo que contiene los vectores prototipo: ','s');
    fileVectores = fopen(strcat(archivoVectores,'.txt'),'r');
    sizeW1=[R Inf];
    W1=fscanf(fileVectores,"%d",sizeW1);
    W1=W1.';
    [S,R]=size(W1);
    
    b=zeros(S,1)+R;
    %Dado que para la capa feedforward la funcion de transferencia es
    %purelin(n) y purelin esta definida como purelin(n)=n, entonces
    %evitamos la variable n y asignamos directamente a 'a1'
    a1=W1*p+b;
    a2=a1;
    epsilon=1/(S-1)-0.1;
    epsilon=epsilon*rand +0.1;
    W2=zeros(S,S)-epsilon;
    
    for i=1:S
        W2(i,i)=1;
    end
    W2
    
   
    
    
    
    
end




