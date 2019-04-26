function GraficarEvolucion (wsizec,S,modo)
    %Funcion que permite graficar toddos los valores obtenidos. 
    %Recibe S para poder leer de forma adecuada el archivo que contiene los datos.
%Fecha de elaboración: 2019/04/22
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    etiquetas="";
     %Abrimos el archivo archivo results todos los valores que se crearon en
    %las n iteraciones 
    results = fopen('results.txt','r');
    figure(1);
    if(modo==0)
        %Formato de lectura del archivo
        filas=S*3+1;
        sizeRes=[filas Inf];
        %Se recupera en Res la matriz de resultados y se cierra el archivo
        %results.txt
        Res=fscanf(results,"%f",sizeRes);
        Res=Res.';
        [f,c]=size(Res);
        epoca=Res(:,1);
        fila=1;
        aux=1;
        for i=2:2:c-S
            plot(epoca,Res(:,i),"o-");
            hold on
            etiquetas(aux)=strcat("w",string(fila),string(1));
            aux=aux+1;
            plot(epoca,Res(:,i+1),"o-");
            hold on
            etiquetas(aux)=strcat("w",string(fila),string(2));
            aux=aux+1;
            fila=fila+1;     
        end
        fila=1;
        for i=c-S+1:c
            plot(epoca,Res(:,i),"o-");
            hold on
            etiquetas(aux)=strcat("b",string(fila));
            aux=aux+1;
            fila=fila+1; 
        end
    elseif(modo==1)
        %Formato de lectura del archivo
        filas=wsizec+2;
        sizeRes=[filas Inf];
        %Se recupera en Res la matriz de resultados y se cierra el archivo
        %results.txt
        Res=fscanf(results,"%f",sizeRes);

        Res=Res.';

        %En t se almacena la primer fila del archivo que corresponde a la
        %iteracion en la que se generaron los resultados de esa columna
        epoca=Res(:,1);
        w=Res(:,2:end-1);
        bias=Res(:,end);
        [f,c]=size(w);

        %Se guarda en Aux solo una parte de la matriz leida que contiene solo
        %los valores generados y elimina la primer fila que era del numero de
        %iteracion
        %Aux=Res(2:end,:);
        %Aux=Aux.';
        aux=1;
        %fila=1;
        %figure(2)
        %Grafica pesos de la red
        for i=1:c
            plot(epoca,w(:,i),"o-");
            hold on
            etiquetas(aux)=strcat("w",string(1),string(i));
            aux=aux+1;   
        end
        %Grafica bias
        plot(epoca,bias(:,1),"o-");
        hold on
        etiquetas(aux)=strcat("b",string(1));
    end
    fclose(results);   
    %Configuracion de la grafica a mostrar
    xticks(0:1:100);
    yticks(-150:150);
    title('Evolución de Red ADALINE');
    xlabel('Épocas');
    ylabel('Valores');
    legend(etiquetas);
end
