function [] = P04_RedAdaline_2014081038()
%P4: Red ADALINE
%   Implementacion de una red ADALINE que lee dataset 
%   desde archivo txt, introduccion de numero de iteraciones, valor de e_epoch y alfa por consola y
%   graficacion de la evolución de bias y pesos, así como la senial del
%   error
%Fecha de elaboración: 2019/04/22
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    epoca=0;
    w=zeros(1,1);
    b=zeros(1,1);
    e=0;
    archivoDS=input('Ingrese el nombre del archivo que contiene el dataset(sin extension .txt): ','s');
    eepoch_max=input('Ingrese el maximo de épocas(e_epoch max): ');
    eepoch=input('Ingrese el maximo de error e_epoch: ');
    alfa=input('Ingrese el valor de alfa(entre 0 y 1): ');
    [pn,targets,s,r]=lecturaDataSet(archivoDS);
    %targets
    w=generacionW(s,r)
    b=generacionBias(s)    
    vecesAprendizaje=1;
    GuardarArchivo(epoca,w,b,"w");
    GuardarEepoch(epoca,0,"w");
    [numEntradas,tamEntrada]=size(pn);
    while(vecesAprendizaje>0)
        vecesAprendizaje=0;
        Eepoch=0;
        epoca=epoca+1;
        %Caso para detener cuando no se ha llegado al valor de error
        %aceptado
        if(epoca>eepoch_max)
            fprintf("\n¡¡¡El programa no logró converger en %d épocas!!!\n",eepoch_max)
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
           e
           %Suma los errores para evaluar el valor de error que esta
           %teniendo la red
           Eepoch=Eepoch+e;
           if reglaAprendizaje
              vecesAprendizaje=vecesAprendizaje+1;
               [w,b]=reglaAprendizajeAdaline(w,b,e,p,alfa);
               fprintf("\nSe aplica regla de aprendizaje");
           end
        end
        GuardarArchivo(epoca,w,b,"a");
        %if Eepoch>0
        %    Eepoch=Eepoch/numEntradas;
        %elseif Eepoch<0
        %        Eepoch=(-1)*(Eepoch)/numEntradas;
        %end
        Eepoch=Eepoch/numEntradas;
        GuardarEepoch(epoca,Eepoch,"a");
        %Verifica que Eepoch sea menor que eepoch. En este caso para el
        %aprendizaje y se dice que la red aprendió satisfactoriamente.
        if(Eepoch<eepoch)
            fprintf("\n>>>>>>El valor de error de la red es menor al error tolerable. Acaba aprendizaje");
            break;
        end
    end
    %graficaFronteras(pn,b,w);
    GraficarEvolucion(tamEntrada,epoca);
    GraficarEepoch();
    %if(vecesAprendizaje==0)
         w
         b
    %end
     %for i=1:numEntradas
     %   p=pn(i,:).';
     %   n=w*p+b;
     %   a=hardlim(n);
     %end
end

