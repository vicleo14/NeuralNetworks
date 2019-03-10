function p = LecturaP(ArchivoVecIn)
    fileVecIn = fopen(strcat(ArchivoVecIn,'.txt'),'r');
    p=fscanf(fileVecIn,"%d");
    fclose(fileVecIn);
    
end

