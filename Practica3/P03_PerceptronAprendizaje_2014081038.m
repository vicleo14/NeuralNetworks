function [] = P03_PerceptronAprendizaje()
%P3: Aprendizaje del perceptron 
%   Implementacion de un perceptron con lectura de dataset 
%   desde archivo txt, introduccion de numero de iteraciones por consola y
%   graficacion de la evolución de bias y pesos
%Fecha de elaboración: 2019/04/06
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    epoca=0;
    w=zeros(1,1);
    b=zeros(1,1);
    e=0;
    archivoDS=input('Ingrese el nombre del archivo que contiene el dataset(sin extension .txt): ','s');
    maxEpocas=input('Ingrese el maximo de épocas: ');
    [pn,targets,s,r]=lecturaDataSet(archivoDS);
    targets
    w=generacionW(s,r);
    b=generacionBias(s);
    vecesAprendizaje=1;
    [numEntradas,tamEntrada]=size(pn);
    while(vecesAprendizaje>0)
        vecesAprendizaje=0;
        epoca=epoca+1;
        if(epoca>maxEpocas)
            fprintf("\n¡¡¡El programa no logró converger en %d épocas!!!\n",maxEpocas)
            break;
        end
        fprintf("\n>>>>>Epoca: %d\n",epoca)
        for i=1:numEntradas
           p=pn(i,:).';
           n=w*p+b;
           a=hardlim(n);
           t=targets(i,:).';
           [e,reglaAprendizaje]=errorAprendizaje(t,a);
           if reglaAprendizaje
               vecesAprendizaje=vecesAprendizaje+1;
               [w,b]=reglaAprendizajePerceptron(w,b,e,p);
               %fprintf("\nSe aplica regla de aprendizaje");
           end
        end
        
    end
    graficaFronteras(pn,b,w);
    if(vecesAprendizaje==0)
         w
         b
    end
     %for i=1:numEntradas
     %   p=pn(i,:).';
     %   n=w*p+b;
     %   a=hardlim(n);
     %end
end

