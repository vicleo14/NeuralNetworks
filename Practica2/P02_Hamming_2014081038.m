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
    a1=W1*p;
    a1
    [S,R]=size(W1);
    b=zeros(S,1);
    b=b+R;
    b
    
    
end




