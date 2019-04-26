function GraficarEepoch ()
    %Funcion que permite graficar la evolucion del error en cada epoca de
    %aprrendizaje
%Fecha de elaboración: 2019/04/22
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    etiquetas="Eepoch";
     %Abrimos el archivo archivo results todos los valores que se crearon en
    %las n iteraciones 
    results = fopen('Eepoch.txt','r');
    %Formato de lectura del archivo
    filas=2;
    sizeRes=[filas Inf];
    %Se recupera en Res la matriz de resultados y se cierra el archivo
    %results.txt
    Res=fscanf(results,"%f",sizeRes);
    fclose(results);
    Res=Res.';
    
    %En t se almacena la primer fila del archivo que corresponde a la
    %iteracion en la que se generaron los resultados de esa columna
    epoca=Res(:,1);
    Eepoch=Res(:,2);
    
    figure(2)
    %Grafica de Eepoch
    plot(epoca,Eepoch,"o-");
    hold on
    %Configuracion de la grafica a mostrar
    %xticks(0:1:100);
    %yticks(-150:150);
    title('Evolución de Eepoch');
    xlabel('Épocas');
    ylabel('Eepoch');
    legend(etiquetas);
end

