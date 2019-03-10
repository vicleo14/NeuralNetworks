function [a2,converge,claseGanadora] = RevisarConvergencia(a2,S)
%   Con el fin de un c�digo mas legible se crea esta funci�n encargar�
%   de revisar que en nuestro vector de salida a2 se haya generado la
%   convergencia(todas las neuronas deshabilitadas, excepto 1) y tambi�n
%   implementa el comportamiento de la funci�n de activaci�n poslin(si n<0 ->a=0;
%   si n>=0 -> a=n).
%Fecha de elaboraci�n: 2019/03/07
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)

numCeros=0;
converge=false;
claseGanadora="";
    for j=1:S
        if(a2(j)<0)
            a2(j)=0;
            numCeros=numCeros+1;
        else
            claseGanadora=strcat("a2",string(j)," ");
        end
    end
    if numCeros== S-1 && converge==false
        converge=true;
    end
end

