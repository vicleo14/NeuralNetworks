function [] = P04_RedAdaline_2014081038()
%P4: Red ADALINE
%   Implementacion de una red ADALINE que lee dataset 
%   desde archivo txt, introduccion de numero de iteraciones, valor de e_epoch y alfa por consola y
%   graficacion de la evoluci�n de bias y pesos, as� como la senial del
%   error
%Fecha de elaboraci�n: 2019/04/22
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    epoca=0;
    w=zeros(1,1);
    b=zeros(1,1);
    e=0;
    archivoDS=input('Ingrese el nombre del archivo que contiene el dataset(sin extension .txt): ','s');
    modo=input('Ingrese el modo de operaci�n(0: clasificador,1:regresor): ');
    eepoch_max=input('Ingrese el maximo de �pocas(e_epoch max): ');
    eepoch=input('Ingrese el maximo de error e_epoch: ');
    alfa=input('Ingrese el valor de alfa(entre 0 y 1): ');
    [pn,targets,s,r]=lecturaDataSet(archivoDS,modo);
    %targets
    Eepoch0=zeros(s,1);
    pn
    targets
    w=generacionW(s,r)
    b=generacionBias(s)    
    vecesAprendizaje=1;
    GuardarArchivo(epoca,w,b,"w",modo);
    GuardarEepoch(epoca,s,Eepoch0,"w");
    [numEntradas,tamEntrada]=size(pn);
    while(vecesAprendizaje>0)
        vecesAprendizaje=0;
        Eepoch=0;
        epoca=epoca+1;
        %Caso para detener cuando no se ha llegado al valor de error
        %aceptado
        if(epoca>eepoch_max)
            fprintf("\n���El programa no logr� converger en %d �pocas!!!\n",eepoch_max)
            break;
        end
        fprintf("\n>>>>>Epoca: %d\n",epoca)
        for i=1:numEntradas
           p=pn(i,:).';
           %No se requiere funcion de activacion debido a que usa la
           %funcion purelin
           a=w*p+b;
           t=targets(i,:).';
           [e,reglaAprendizaje]=errorAprendizaje(t,a);
           %Suma los errores para evaluar el valor de error que esta
           %teniendo la red
           Eepoch=Eepoch+e;
           if reglaAprendizaje
              vecesAprendizaje=vecesAprendizaje+1;
               [w,b]=reglaAprendizajeAdaline(w,b,e,p,alfa);
           end
        end
        GuardarArchivo(epoca,w,b,"a",modo);
        if Eepoch>0
            Eepoch=Eepoch/numEntradas;
        elseif Eepoch<0
            Eepoch=(-1)*(Eepoch)/numEntradas;
        end
        %Eepoch
        %numEntradas
        GuardarEepoch(epoca,s,Eepoch,"a");
        %Verifica que Eepoch sea menor que eepoch. En este caso para el
        %aprendizaje y se dice que la red aprendi� satisfactoriamente.
        if(Eepoch<eepoch)
            fprintf("\n>>>>>>El valor de error de la red es menor al error tolerable. Acaba aprendizaje");
            break;
        end
    end
    
    GraficarEvolucion(tamEntrada,epoca);
    GraficarEepoch();
    if(modo==0)
        graficaFronteras(pn,b,w);
    end
    %if(vecesAprendizaje==0)
         w
         b
         Eepoch
    %end
    for i=1:numEntradas
       p=pn(i,:).';
       a=w*p+b
    end
end

