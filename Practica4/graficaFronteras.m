function [] = graficaFronteras(puntos,bias,w)
%P3: Aprendizaje del perceptron 
%  Grafica los puntos, las fronteras de decision y los vectores de pesos.
%Fecha de elaboración: 2019/04/06
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    figure(1)
    xpuntos=puntos(:,1);
    ypuntos=puntos(:,2);
    xejeP1=[min(xpuntos)-1,max(xpuntos)+1];    
    yejeP1=zeros(1,2);
    xejeP2=zeros(1,2);
    yejeP2=[min(ypuntos)-1,max(ypuntos)+1];
    plot(xejeP1,yejeP1,"k-");
    hold on;
    plot(xejeP2,yejeP2,"k-");
    hold on;
    [f1,c1]=size(w);
    for i=1:f1
        wp=w(i,:);
        bp=bias(i,:);
        [xfrontera,yfrontera,m]=rectaFrontera(bp,wp,puntos);
        plot(xfrontera,yfrontera,"g-");
        hold on;
        %[xvector,yvector]=vectorW(m,wp);
        %quiver(xvector(1),yvector(1),xvector(2),yvector(2),1);
        %hold on; 
    end
    axis([min(xpuntos)-1 max(xpuntos)+1 min(ypuntos)-1 max(ypuntos)+1])
    plot(xpuntos,ypuntos,"ro");
    xticks(min(xpuntos):1:max(xpuntos));
    yticks(min(ypuntos):1:max(ypuntos));
end

