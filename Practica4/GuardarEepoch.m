function GuardarEepoch(epoca,Eepoch,opc)
%P3: Aprendizaje del perceptron 
%   Con el fin de un código mas legible se crea esta función encargará
%   de escribir en un archivo de texto 'Eepoch.txt' con todos los valoers 
%   de Eepoch junto con la epoca. opc permite que decidamos entre 'w' para
%   reescribir el archivo en caso que exista o 'a' para escribir al final 
%   del mismo si es que existe.
%Fecha de elaboración: 2019/04/22
%Autor: Morales Flores Victor Leonel
%Asignatura: Neural Networks
%Escuela: ESCOM-IPN(MX)
    results=fopen("Eepoch.txt",opc);
    fprintf(results,"%d %d\n",epoca,Eepoch);
    fclose(results);
end
