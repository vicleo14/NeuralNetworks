function [x,y,m] = rectaFrontera(bias,w,p)
%P3: Aprendizaje del perceptron 
%  Se realizan los calculos necesarios para poder graficar la frontera de
%  decision
%Fecha de elaboración: 2019/04/06
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    xmax=max(p(:,1));
    xmin=min(p(:,1));
    x=[xmin-1,xmax+1];
    
    x1=0;
    format long
    y1=-(bias(1,1))/w(1,2);
    format long 
    x2=-(bias(1,1))/w(1,1);
    format long 
    y2=0;
    format long 
    m=w(1,2)/w(1,1);
    format long 
    mi=(-1)/m;
    format long 
    b=y2-(mi*x2);
    [f,c]=size(x);
    for i=1:c
        format long 
        y(i)=mi*x(i)+b;
    end
end

