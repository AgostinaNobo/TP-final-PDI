% Mascara Circular para la Segmentacion con imfindcircles

function MC=mask_circle(im_bin,range)

% im_bin es la imagen binaria que se desea segmentar
% range es el rango de valores de radio para buscar en cada imagen, elegido
% manualmente 
    % si es una imagen diastolica, el rango es mayor 
    % si es una imagen sistolica, el rango es menor

[rows,cols]=size(im_bin);

% imfindcircles usa la Transformada de Hough para encontrar centro y radio
% de los elementos circulares de la imagen
[centers,radii] = imfindcircles(im_bin,range, ...
    'ObjectPolarity','bright', ...
    'Sensitivity',0.95);

% Verificamos que se haya detectado algun circulo en el rango indicado
if isempty(centers)
    error('No se detectaron circulos en el rango indicado');
end

% Elegimos el circulo mas cercano a la derecha porque es el que corresponde
% al VI
[~, idx]=max(centers(:,1));

% Guardamos el centro y radio de ese circulo
centro=centers(idx,:);
radio=radii(idx);

% Construimos una mascara binaria con los pixeles correspondientes al
% circulo seleccionado
[X,Y]=meshgrid(1:cols,1:rows);
MC=(X-centro(1)).^2 + (Y-centro(2)).^2 <= radio^2;

end