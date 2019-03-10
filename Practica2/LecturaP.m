function p = LecturaP(ArchivoVecIn)
%   Con el fin de un código mas legible se crea esta función que se
%   encargará de de leer nuestro vector de entrada a la red a través del
%   archivo 'ArchivoVecIn'. Esta variable es una cadena a la que el código
%   mismo le concatenará la extensión txt(.txt) por lo que al ingresar por
%   teclado el nombre del archivo, este debe ser un archivo TXT y no se le
%   debe colocar la extensión del archivo.
%Fecha de elaboracion: 2019/03/07
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)

    fileVecIn = fopen(strcat(ArchivoVecIn,'.txt'),'r');
    p=fscanf(fileVecIn,"%d");
    fclose(fileVecIn);
    
end

