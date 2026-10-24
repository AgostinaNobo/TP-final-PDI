%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Funcion Segm2Original(masc_chica, idx1, idx2,tamanioOriginal)
% masc_chica: la que quiero expandir
%idx1: indice de comienzo de la mascara en la imagen original
%idx2: indice final de la mascara en la imagen original
%tamanioOriginal: el tamanio que va a tener luego de la expansion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function grande = Segm2Original(masc_chica, idx1, idx2, tamanioOriginal)
    %creamos una matriz de ceros con el tamanio original
    grande = zeros(tamanioOriginal);
    %reemplazamos los valores de la mscara en el lugar correcto
    grande(idx1:idx2, idx1:idx2) = masc_chica;
end