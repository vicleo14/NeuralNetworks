function [] = 	P02_Hamming_2014081038()
%P2: Red de Hamming 
%   Implementacion de la red de Hamming con lectura de vectores 
%   prototipo y vector de entrada desde archivo txt; asi como la
%   graficacion de los resultados en las iteraciones
%Fecha de elaboración: 2019/03/07
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    
    converge=false;
    numCeros=0;
    etiquetas="";
    bandera=0;
    claseGanadora="";
    iteracionesMaximas=50;


    archivoVecIn=input('Ingrese el nombre del archivo que contiene el vector de entrada(sin extension .txt): ','s');
    p=LecturaP(archivoVecIn);
    
    [R,n]=size(p);
    
    archivoVectores=input('Ingrese el nombre del archivo que contiene los vectores prototipo(sin extension .txt): ','s');
    W1=LecturaW1(archivoVectores,R);
    [S,R]=size(W1);
    
    b=zeros(S,1)+R;
    %Dado que para la capa feedforward la funcion de transferencia es
    %purelin(n) y purelin esta definida como purelin(n)=n, entonces
    %evitamos la variable n y asignamos directamente a 'a1'
    a1=W1*p+b;
    %Asignamos a1 a a2 ya que esta es nuestra condicion inicial
    a2=a1;
    GuardarArchivo(a2,0,"w");
    W2=GenerarW2(S);   
    for i=1:iteracionesMaximas
        %Genearcion de etiquetas para la grafica
        cadAux=strcat("a2",string(i)," ");
        etiquetas=strcat(etiquetas,cadAux);
        % Multiplicacion de la matriz de pesos W2 por a2(t) y asignacion a
        % a2(t+1). Debido a la forma en que se opera(primero hace operacion
        %y despues  la asignacion a la variable) podemos hacer uso de una sola
        % variable a2
        a2=W2*a2;
        
        %Funcion que revisa la convergencia de a2
        [a2,converge,claseGanadora]=RevisarConvergencia(a2,S);
        %Guarda en nuestro archivo los resultados con argumento 'a' para
        %que escriba al final del documento.
        GuardarArchivo(a2,i,"a");
        %Bloque de codigo para hacer una iteración mas despues de que
        %converge la primera vez. Esto es para confirmar la convergencia
        if(converge)
           if(bandera==0)
               bandera=1;
               claseGanadora=cadAux;
               continue;
           else
               break;
           end
           
        end
    end
   
    if converge
        fprintf("La clase ganadora fue: %s",claseGanadora);
    else
        fprintf("No se logró convergencia tras %d iteraciones",iteracionesMaximas);
    end
    Graficar(S,etiquetas);
end