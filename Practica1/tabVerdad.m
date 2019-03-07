function [tablaVerdad]=tabVerdad(n, comp)
    tablaVerdad=ones(2^n,n+1);
    
    for  j=1:n
        aux=n-j;
        inc=2^(aux);
        inicio=1;
        fin=inicio + inc;
        %fprintf('Valores nuevos: %d %d\n',inicio,fin);
        for i=1:2^n
            if i==fin
               inicio=inicio+2*inc;
                fin=inicio +inc;
                %fprintf('Valores nuevos: %d %d (%d)\n',inicio,fin,i);
            end 
            if i>=inicio %&& i<fin
                tablaVerdad(i,j)=0;
            end
                
        end
    end
    if comp=="AND"
         for i=1:2^n-1
            tablaVerdad(i,n+1)=0;
         end
    else
        tablaVerdad(1,n+1)=0;
    end
end