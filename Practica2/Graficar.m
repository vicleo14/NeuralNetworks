function Graficar (S,etiquetas)
    %Funcion que permite graficar toddos los valores obtenidos. Recibe S
    %para poder leer de forma adecuada el archivo que contiene los datos y
    %'etiquetas' contiene los elementos que se mostrarn en legend de la
    %grafica
%Fecha de elaboración: 2019/03/07
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)

     %Abrimos el archivo archivo results todos los valores que se crearon en
    %las n iteraciones 
    results = fopen('results.txt','r');
    %Formato de lectura del archivo
    sizeRes=[S+1 Inf];
    %Se recupera en Res la matriz de resultados y se cierra el archivo
    %results.txt
    Res=fscanf(results,"%f",sizeRes);
    fclose(results);
    %En t se almacena la primer fila del archivo que corresponde a la
    %iteracion en la que se generaron los resultados de esa columna
    t=Res(1,:);
    %Se guarda en Aux solo una parte de la matriz leida que contiene solo
    %los valores generados y elimina la primer fila que era del numero de
    %iteracion
    Aux=Res(2:end,:);
    Aux=Aux.';
    %Configuracion de la grafica a mostrar
    plot(t,Aux,"o-");
    xticks(0:1:100);
    yticks(0:150);
    title('Red de Hamming');
    xlabel('Tiempo');
    ylabel('Valores');
    %et=strsplit(etiquetas);
    legend(etiquetas);
end

