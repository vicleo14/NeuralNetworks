function W1 = LecturaW1(archivoVectores,R)
%   Con el fin de un c�digo mas legible se crea esta funci�n que se
%   encargar� de de leer nuestros vectores prototipo que generar�n la matiz de 
%   pesos W1 de la red a trav�s del
%   archivo 'archivoVectores'. Esta variable es una cadena a la que el c�digo
%   mismo le concatenar� la extensi�n txt(.txt) por lo que al ingresar por
%   teclado el nombre del archivo, este debe ser un archivo TXT y no se le
%   debe colocar la extensi�n del archivo.
%   Tambi�n recibe el n�mero de entradas a la red(R) para darle el formato adecuado a 
%   la matriz de pesos. Esto es con el objetivo de hacer el c�digo ma�s versatil para 
%   que soporte procesamiento de distintos vectores de entrada siempre y cuando las
%   columnas de W1 y filas de nuestro vector de entrada(p) coincidan en los archivos TXT 
%Fecha de elaboraci�n: 2019/03/07
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    sizeW1=[R Inf];
    fileVectores = fopen(strcat(archivoVectores,'.txt'),'r');
    W1=fscanf(fileVectores,"%d",sizeW1);
    fclose(fileVectores);
    W1=W1.';
    

end

