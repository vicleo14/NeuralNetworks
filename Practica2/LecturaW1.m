function W1 = LecturaW1(archivoVectores,R)
    sizeW1=[R Inf];
    fileVectores = fopen(strcat(archivoVectores,'.txt'),'r');
    W1=fscanf(fileVectores,"%d",sizeW1);
    fclose(fileVectores);
    W1=W1.';

end

