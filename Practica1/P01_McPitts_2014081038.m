function [] = 	P01_McPitts_2014081038()
%P1: Célula McCulloch-Pitts 
%   Implementacion del modelo de McCulloch y Pitts con el uso de
%   las compuertas logicas NOT de una-entrada y AND u OR de n-entradas.
%Fecha de elaboracion: 2019/02/17
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)

    tablaVerdad=[1 0; 0 1];%Tabla de verdad de NOT 
    R=1;
    epoca=1;
    a=0;
    aprendio=false;
    comp=input('Ingrese la compuerta que quieres utilizar(AND, OR, NOT): ','s');
    if comp~="NOT"
        R=input('Ingrese el número de entradas(R): ');
        tablaVerdad=tabVerdad(R,comp);
    end
    
    W=zeros(1,R);
    
    %------ Leemos los pesos
    fprintf('Indica los valores de W:\n');
    for i=1:R
        s=sprintf('W[%d]:',i);
        W(1,i)=input(s);
    end
    %------ Leemos el umbral
    umbral=input('Ingrese el valor de umbral: ');
    respuesta=true;
    while(true)
        
        aprendizajeExitoso=true;
        fprintf('\n>>>>>Época %d:\n',epoca);
        %----- Obtiene n y compara para asignar valor a "a"
        for i=1:2^R
            P=(tablaVerdad(i,1:end-1)).';
            n=W*P;
            if n>umbral
                a=1;
            else
                a=0;
            end
            
            if a==tablaVerdad(i,R+1)%En tablaVerdad(i,R+1) se encuentra nuestro valor desedo(target)
               fprintf('\nAprendizaje exitoso en d%d',i);
            else
                aprendizajeExitoso=false;
                fprintf('\nFalló el aprendizaje en d%d',i);
                respuesta=input('\nQuieres volver a intentar(Si/No)?','s');
                if respuesta=="No" || respuesta=="NO" || respuesta=="no"
                    respuesta=false;
                    break;
                else
                    fprintf('Indica los valores de W:\n');
                    for i=1:R
                        s=sprintf('W[%d]:',i);
                        W(1,i)=input(s);
                    end
                    umbral=input('Ingrese el valor de umbral: ');
                    epoca=epoca+1;
                end
            end
            
        end
        if respuesta==false
                break;
        end
        if i==2^R && aprendizajeExitoso==true
            fprintf("\n¡¡¡APRENDIZAJE DE LA CELULA EXITOSA!!!\n");
            
            break;
        end
    end
    generarTXT(W,R,umbral);
end




