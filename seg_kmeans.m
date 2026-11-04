% k-means con Selección Automática del Ventrículo Izquierdo

% Pasamos imagenes a uint8
imk_1D=uint8(im1_D_bin)*255;
imk_2D=uint8(im2_D_bin)*255;
imk_3D=uint8(im3_D_bin)*255;
imk_4D=uint8(im4_D_bin)*255;
imk_5D=uint8(im5_D_bin)*255;

imk_1S=uint8(im1_S_bin)*255;
imk_2S=uint8(im2_S_bin)*255;
imk_3S=uint8(im3_S_bin)*255;
imk_4S=uint8(im4_S_bin)*255;
imk_5S=uint8(im5_S_bin)*255;

[f,c]=size(imk_1D); % tamaño de la imagen

% Le sacamos el ruido con un filtro Gaussiano (sigme=1)
imk_1D=imgaussfilt(imk_1D,1);
imk_2D=imgaussfilt(imk_2D,1);
imk_3D=imgaussfilt(imk_3D,1);
imk_4D=imgaussfilt(imk_4D,1);
imk_5D=imgaussfilt(imk_5D,1);

imk_1S=imgaussfilt(imk_1S,1);
imk_2S=imgaussfilt(imk_2S,1);
imk_3S=imgaussfilt(imk_3S,1);
imk_4S=imgaussfilt(imk_4S,1);
imk_5S=imgaussfilt(imk_5S,1);

% Segmentamos con kmeans, k=3 clusters, repetimos n=3 veces
[L1D, centros1D]=imsegkmeans(imk_1D,3,"NumAttempts",3);
[L2D, centros2D]=imsegkmeans(imk_2D,3,"NumAttempts",3);
[L3D, centros3D]=imsegkmeans(imk_3D,3,"NumAttempts",3);
[L4D, centros4D]=imsegkmeans(imk_4D,3,"NumAttempts",3);
[L5D, centros5D]=imsegkmeans(imk_5D,3,"NumAttempts",3);

[L1S, centros1S]=imsegkmeans(imk_1S,3,"NumAttempts",3);
[L2S, centros2S]=imsegkmeans(imk_2S,3,"NumAttempts",3);
[L3S, centros3S]=imsegkmeans(imk_3S,3,"NumAttempts",3);
[L4S, centros4S]=imsegkmeans(imk_4S,3,"NumAttempts",3);
[L5S, centros5S]=imsegkmeans(imk_5S,3,"NumAttempts",3);

% Mostramos las imagenes con su mascara correspondiente
figure;
subplot(2,5,1);
imshow(labeloverlay(imk_1D, L1D, ...
    'Transparency', 0.7)); title('I1 Diastole');
subplot(2,5,6);
imshow(labeloverlay(imk_1S, L1S, ...
    'Transparency', 0.7)); title('I1 Sistole');

subplot(2,5,2);
imshow(labeloverlay(imk_2D, L2D, ...
    'Transparency', 0.7)); title('I2 Diastole');
subplot(2,5,7);
imshow(labeloverlay(imk_2S, L2S, ...
    'Transparency', 0.7)); title('I2 Sistole');

subplot(2,5,3);
imshow(labeloverlay(imk_3D, L3D, ...
    'Transparency', 0.7)); title('I3 Diastole');
subplot(2,5,8);
imshow(labeloverlay(imk_3S, L3S, ...
    'Transparency', 0.7)); title('I3 Sistole');

subplot(2,5,4);
imshow(labeloverlay(imk_4D, L4D, ...
    'Transparency', 0.7)); title('I4 Diastole');
subplot(2,5,9);
imshow(labeloverlay(imk_4S, L4S, ...
    'Transparency', 0.7)); title('I4 Sistole');

subplot(2,5,5);
imshow(labeloverlay(imk_5D, L5D, ...
    'Transparency', 0.7)); title('I5 Diastole');
subplot(2,5,10);
imshow(labeloverlay(imk_5S, L5S, ...
    'Transparency', 0.7)); title('I5 Sistole');
