function [wp,bp] = reglaAprendizajePerceptron(w,b,e,p)
%P3: Aprendizaje del perceptron 
%   Hace calculo de la nueva matriz de pesos y del nuevo bias
%Fecha de elaboración: 2019/04/06
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    format long
    wp=w+e*p.';
    format long
    bp=b+e;
    
end

