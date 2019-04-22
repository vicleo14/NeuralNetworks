function [p,targets,s,r] = lecturaDataSet(nomArc)
%P3: Aprendizaje del perceptron 
%   Funcion para la lectura del documento que contiene el dataet y que
%   devielve las entradas a la red, los targets y el numero de neuronas de
%   la red.
%Fecha de elaboración: 2019/04/06
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    %La red ADALINE siempre contiene una sola neurona por definicion
    s=1;
    arc = fopen(strcat(nomArc,'.txt'),'r');
    info=fscanf(arc,"%d");
    fclose(arc);
    %El archivo debe contener el número de columnas al final del archivo
    %.txt
    columnas=info(end);
    info=info(1:end-1,:);
    filas=size(info)/columnas;
    r=columnas-1;
    info=reshape(info,columnas,[]);
    info=info.';
    p=info(:,1:r)
    targets=info(:,end)
end