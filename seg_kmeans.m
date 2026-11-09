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

% Tenemos que elegir el cluster correspondiente al VI
M1D=bestLVMaskFromLabels(imk_1D,L1D);
M2D=bestLVMaskFromLabels(imk_2D,L2D);
M3D=bestLVMaskFromLabels(imk_3D,L3D);
M4D=bestLVMaskFromLabels(imk_4D,L4D);
M5D=bestLVMaskFromLabels(imk_5D,L5D);

M1S=bestLVMaskFromLabels(imk_1S,L1S);
M2S=bestLVMaskFromLabels(imk_2S,L2S);
M3S=bestLVMaskFromLabels(imk_3S,L3S);
M4S=bestLVMaskFromLabels(imk_4S,L4S);
M5S=bestLVMaskFromLabels(imk_5S,L5S);

% Mostramos las imagenes con su mascara correspondiente
figure;
subplot(2,5,1);
imshow(labeloverlay(imk_1D, M1D, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I1 Diastole');
subplot(2,5,6);
imshow(labeloverlay(imk_1S, M1S, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I1 Sistole');

subplot(2,5,2);
imshow(labeloverlay(imk_2D, M2D, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I2 Diastole');
subplot(2,5,7);
imshow(labeloverlay(imk_2S, M2S, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I2 Sistole');

subplot(2,5,3);
imshow(labeloverlay(imk_3D, M3D, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I3 Diastole');
subplot(2,5,8);
imshow(labeloverlay(imk_3S, M3S, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I3 Sistole');

subplot(2,5,4);
imshow(labeloverlay(imk_4D, M4D, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I4 Diastole');
subplot(2,5,9);
imshow(labeloverlay(imk_4S, M4S, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I4 Sistole');

subplot(2,5,5);
imshow(labeloverlay(imk_5D, M5D, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I5 Diastole');
subplot(2,5,10);
imshow(labeloverlay(imk_5S, M5S, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I5 Sistole');

% Area del VI en píxeles
area_px_1D=nnz(M1D);
area_px_2D=nnz(M2D);
area_px_3D=nnz(M3D);
area_px_4D=nnz(M4D);
area_px_5D=nnz(M5D);

area_px_1S=nnz(M1S);
area_px_2S=nnz(M2S);
area_px_3S=nnz(M3S);
area_px_4S=nnz(M4S);
area_px_5S=nnz(M5S);

% Guardamos los parametros DICOM de cada imagen para obtener el espacio 
% entre pixeles
info_1D=dicominfo("Images_og\IM-0009-0020.dcm");
info_2D=dicominfo("Images_og\IM-0009-0040.dcm");
info_3D=dicominfo("Images_og\IM-0009-0060.dcm");
info_4D=dicominfo("Images_og\IM-0009-0080.dcm");
info_5D=dicominfo("Images_og\IM-0009-0100.dcm");

info_1S=dicominfo("Images_og\IM-0009-0028.dcm");
info_2S=dicominfo("Images_og\IM-0009-0048.dcm");
info_3S=dicominfo("Images_og\IM-0009-0068.dcm");
info_4S=dicominfo("Images_og\IM-0009-0088.dcm");
info_5S=dicominfo("Images_og\IM-0009-0108.dcm");

% Area del VI en mm²
area_mm2_1D=area_px_1D*info_1D.PixelSpacing(1)*info_1D.PixelSpacing(2);
area_mm2_2D=area_px_2D*info_2D.PixelSpacing(1)*info_2D.PixelSpacing(2);
area_mm2_3D=area_px_3D*info_3D.PixelSpacing(1)*info_3D.PixelSpacing(2);
area_mm2_4D=area_px_4D*info_4D.PixelSpacing(1)*info_4D.PixelSpacing(2);
area_mm2_5D=area_px_5D*info_5D.PixelSpacing(1)*info_5D.PixelSpacing(2);

area_mm2_1S=area_px_1S*info_1S.PixelSpacing(1)*info_1S.PixelSpacing(2);
area_mm2_2S=area_px_2S*info_2S.PixelSpacing(1)*info_2S.PixelSpacing(2);
area_mm2_3S=area_px_3S*info_3S.PixelSpacing(1)*info_3S.PixelSpacing(2);
area_mm2_4S=area_px_4S*info_4S.PixelSpacing(1)*info_4S.PixelSpacing(2);
area_mm2_5S=area_px_5S*info_5S.PixelSpacing(1)*info_5S.PixelSpacing(2);

% Fraccion de eyeccion estimada
fprintf('-----Resultados usando deteccion circular (imfindcircles)----- \n');
fprintf('FE IMG 1: %.1f%%\n', ((area_mm2_1D-area_mm2_1S)/area_mm2_1D)*100);
fprintf('FE IMG 2: %.1f%%\n', ((area_mm2_2D-area_mm2_2S)/area_mm2_2D)*100);
fprintf('FE IMG 3: %.1f%%\n', ((area_mm2_3D-area_mm2_3S)/area_mm2_3D)*100);
fprintf('FE IMG 4: %.1f%%\n', ((area_mm2_4D-area_mm2_4S)/area_mm2_4D)*100);
fprintf('FE IMG 5: %.1f%%\n', ((area_mm2_5D-area_mm2_5S)/area_mm2_5D)*100);