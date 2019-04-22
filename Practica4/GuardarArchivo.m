function GuardarArchivo(i,w,b,opc)
%P3: Aprendizaje del perceptron 
%   Con el fin de un código mas legible se crea esta función encargará
%   de escribir en un archivo de texto 'results.txt' todos los valoers 
%   a2 junto con 'i' que corresponde al número de epoca en la que 
%   se generaron esos valores. opc permite que decidamos entre 'w' para
%   reescribir el archivo en caso que exista o 'a' para escribir al final 
%   del mismo si es que existe.
%Fecha de elaboración: 2019/03/07
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    [f,c]=size(w);
    %Adapta el peso en solo una fila
    results=fopen("results.txt",opc);
    fprintf(results,"%d ",i);
    %Cambio con respecto a perceptron
    for j=1:c
        fprintf(results,"%d ",w(1,j));
    end
    fprintf(results,"%d ",b(1,1));
    fprintf(results,"\n");
    fclose(results);
end
