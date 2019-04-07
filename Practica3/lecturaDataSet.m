function [p,targets,s,r] = lecturaDataSet(nomArc)
%P3: Aprendizaje del perceptron 
%   Funcion para la lectura del documento que contiene el dataet y que
%   devielve las entradas a la red, los targets y el numero de neuronas de
%   la red.
%Fecha de elaboración: 2019/04/06
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    arc = fopen(strcat(nomArc,'.txt'),'r');
    info=fscanf(arc,"%d");
    fclose(arc);
    
    clases=info(end);
    r=2;
    s=ceil(log2(clases));
    info=info(1:end-1,:);
    columnas=2+s;
    filas=size(info)/columnas;
    info=reshape(info,columnas,[]);
    info=info.';
    p=info(:,1:2);
    targets=info(:,3:end);
    
end

