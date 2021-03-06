function [wp,bp] = reglaAprendizajeAdaline(w,b,e,p,alfa)
%P3: Aprendizaje de red ADALINE
%   Hace calculo de la nueva matriz de pesos y del nuevo bias con base a
%   alfa,el error y la entrada de la red
%Fecha de elaboración: 2019/04/22
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    format long
    wp=w+2*alfa*(e*p.');
    format long
    bp=b+e;
    
end

