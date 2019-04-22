function a = hardlim(n)
%P3: Aprendizaje del perceptron 
%   Implementacion de funcion de transferencia hardlim para una matriz de
%   mxn. Donde: Si i(m,n)<0, entonces i(m,n)=0; en otro caso i(m,n)=1
%Fecha de elaboración: 2019/04/06
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    [f,c]=size(n);
    a=zeros(f,c);
    for i=1:f
        for j=1:c
           if n(i,j)>0
               a(i,j)=1;
           else
               n(i,j)=0;
           end
        end
    end
end

