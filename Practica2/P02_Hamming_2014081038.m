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
    fclose(fileVecIn);
    [R,n]=size(p);
    %fprintf("Tam:%d",R);
    
    archivoVectores=input('Ingrese el nombre del archivo que contiene los vectores prototipo: ','s');
    fileVectores = fopen(strcat(archivoVectores,'.txt'),'r');
    sizeW1=[R Inf];
    W1=fscanf(fileVectores,"%d",sizeW1);
    fclose(fileVectores);
    W1=W1.';
    [S,R]=size(W1);
    
    b=zeros(S,1)+R;
    %Dado que para la capa feedforward la funcion de transferencia es
    %purelin(n) y purelin esta definida como purelin(n)=n, entonces
    %evitamos la variable n y asignamos directamente a 'a1'
    a1=W1*p+b;
    %Asignamos a1 a a2 ya que esta es nuestra condicion inicial
    a2=a1;
    results=fopen("results.txt","w");
    fprintf(results,"%d ",0);
    for j=1:S
        fprintf(results,"%d ",a2(j));
    end
    fprintf(results,"\n");
    fclose(results);
    %El calculo de epsilon se genera en dos pasos para hacer mas entendible
    %el codigo. Primero se calcula el limite superior en la primera linea y
    %en la segunda se obtiene un valor aleatorio entre 0.1 y el limite
    %superior.
    epsilon=1/(S-1)-0.1;
    epsilon=epsilon*rand +0.1;
    %Creamos la matriz W2 con ceros menos epsilon
    W2=zeros(S,S)-epsilon;
    %Llena la diagonal de la matriz con 1's.
    for i=1:S
        W2(i,i)=1;
    end
    converge=false;
    numCeros=0;
    formato=[1 S];
    etiquetas="";
    for i=1:50
        numCeros=0;
        fprintf("%d\n",i);
        a2=W2*a2;
        results=fopen("results.txt","a");
        fprintf(results,"%d ",i);
        cadAux=strcat("a2",string(i)," ");
        etiquetas=strcat(etiquetas,cadAux);
        for j=1:S
            if(a2(j)<0)
                a2(j)=0;
                numCeros=numCeros+1;
            end
            fprintf(results,"%d ",a2(j));
        end
        fprintf(results,"\n");
        fclose(results);
        if numCeros== S-1 && converge==false
            converge=true;
            continue;
        end
        fprintf("Prueba %d\n",i);
            
            if(converge==true && numCeros== S-1)
                fprintf("%d\n",i);
                break;
            end
    end
    results = fopen('results.txt','r');
    sizeRes=[S+1 Inf];
    
    Res=fscanf(results,"%f",sizeRes)
    fclose(fileVectores);
    t=Res(1,:);
    Aux=Res(2:end,:)
    plot(t,Aux,"o-");
    title('Red de Hamming');
    xlabel('Tiempo');
    ylabel('Valores');
    legend(split(etiquetas));
    
   
    
    
    
    
end




