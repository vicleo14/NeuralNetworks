function GuardarArchivo(i,w,b,opc,modo)
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
    results=fopen("results.txt",opc);
    fprintf(results,"%d ",i);
    if(modo==0)
        %Adapta el peso en solo una fila
        warc=reshape(w,[1,2*f]);
        barc=reshape(b,[1,f]);


        for j=1:f*2
            fprintf(results,"%d ",warc(1,j));
        end
        for j=1:f
            fprintf(results,"%d ",barc(1,j));
        end
    elseif (modo==1)
        %Cambio con respecto a perceptron
        for j=1:c
            fprintf(results,"%d ",w(1,j));
        end
        fprintf(results,"%d ",b(1,1));
    end   
    fprintf(results,"\n");
    fclose(results);
end
