function p = LecturaP(ArchivoVecIn)
%   Con el fin de un c�digo mas legible se crea esta funci�n que se
%   encargar� de de leer nuestro vector de entrada a la red a trav�s del
%   archivo 'ArchivoVecIn'. Esta variable es una cadena a la que el c�digo
%   mismo le concatenar� la extensi�n txt(.txt) por lo que al ingresar por
%   teclado el nombre del archivo, este debe ser un archivo TXT y no se le
%   debe colocar la extensi�n del archivo.
%Fecha de elaboracion: 2019/03/07
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)

    fileVecIn = fopen(strcat(ArchivoVecIn,'.txt'),'r');
    p=fscanf(fileVecIn,"%d");
    fclose(fileVecIn);
    
end

