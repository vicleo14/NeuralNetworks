function GuardarArchivo(a2,i,opc)
    [S,]=size(a2);
    results=fopen("results.txt",opc);
    fprintf(results,"%d ",i);
    for j=1:S
        fprintf(results,"%d ",a2(j));
    end
    fprintf(results,"\n");
    fclose(results);
end

