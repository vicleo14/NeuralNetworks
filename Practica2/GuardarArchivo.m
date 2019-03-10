function GuardarArchivo(a2,i,opc)
%   Con el fin de un c�digo mas legible se crea esta funci�n encargar�
%   de escribir en un archivo de texto 'results.txt' todos los valoers 
%   a2 junto con 'i' que corresponde al n�mero de interaci�n en la que 
%   se generaron esos valores. opc permite que decidamos entre 'w' para
%   reescribir el archivo en caso que exista o 'a' para escribir al final 
%   del mismo si es que existe.
%Fecha de elaboraci�n: 2019/03/07
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)

    [S,]=size(a2);
    results=fopen("results.txt",opc);
    fprintf(results,"%d ",i);
    for j=1:S
        fprintf(results,"%d ",a2(j));
    end
    fprintf(results,"\n");
    fclose(results);
end

