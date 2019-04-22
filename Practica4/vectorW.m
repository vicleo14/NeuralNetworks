function [x,y] = vectorW(m,w)
%P3: Aprendizaje del perceptron 
%  Recibe la pendiente y los pesos sinapticos para obtener las cooredenadas
%  de nuestro vector para que pueda ser graficado correctamente.
%Fecha de elaboración: 2019/04/06
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    x=zeros(1,2);
    y=zeros(1,2);
    x(1,2)=w(1,1);
    y(1,2)=w(1,2);
end

