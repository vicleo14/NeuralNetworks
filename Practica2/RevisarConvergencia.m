function [a2,converge,claseGanadora] = RevisarConvergencia(a2,S)
numCeros=0;
converge=false;
claseGanadora="";
    for j=1:S
        if(a2(j)<0)
            a2(j)=0;
            numCeros=numCeros+1;
        else
            claseGanadora=strcat("a2",string(j)," ");
        end
    end
    if numCeros== S-1 && converge==false
        converge=true;
    end
end

