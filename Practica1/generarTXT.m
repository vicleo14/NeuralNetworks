function []=generarTXT(W,R,umbral)
    fileID = fopen('pesos_y_umbral_finales.txt','w');
    for i=1:R
         fprintf(fileID,'W[%d]: %d\n',i,W(1,i));
    end
    fprintf(fileID,'\nUmbral: %d',umbral);
    fclose(fileID);
end