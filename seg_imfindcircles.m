% Detección Circular del Ventrículo Izquierdo

% Vamos a llamar a la funcion de mask_circle para todas las imagenes
BW1_D=mask_circle(im1_D_bin,[15 25]);
BW2_D=mask_circle(im2_D_bin,[15 25]);
BW3_D=mask_circle(im3_D_bin,[15 25]);
BW4_D=mask_circle(im4_D_bin,[15 25]);
BW5_D=mask_circle(im5_D_bin,[15 30]);

BW1_S=mask_circle(im1_S_bin,[7 18]);
BW2_S=mask_circle(im2_S_bin,[9 16]);
BW3_S=mask_circle(im3_S_bin,[9 20]);
BW4_S=mask_circle(im4_S_bin,[6 18]);
BW5_S=mask_circle(im5_S_bin,[6 10]);

% Mostramos las imagenes con su mascara correspondiente
figure;
subplot(2,5,1);
imshow(labeloverlay(uint8(im1_D_bin)*255, BW1_D, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I1 Diastole');
subplot(2,5,6);
imshow(labeloverlay(uint8(im1_S_bin)*255, BW1_S, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I1 Sistole');

subplot(2,5,2);
imshow(labeloverlay(uint8(im2_D_bin)*255, BW2_D, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I2 Diastole');
subplot(2,5,7);
imshow(labeloverlay(uint8(im2_S_bin)*255, BW2_S, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I2 Sistole');

subplot(2,5,3);
imshow(labeloverlay(uint8(im3_D_bin)*255, BW3_D, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I3 Diastole');
subplot(2,5,8);
imshow(labeloverlay(uint8(im3_S_bin)*255, BW3_S, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I3 Sistole');

subplot(2,5,4);
imshow(labeloverlay(uint8(im4_D_bin)*255, BW4_D, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I4 Diastole');
subplot(2,5,9);
imshow(labeloverlay(uint8(im4_S_bin)*255, BW4_S, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I4 Sistole');

subplot(2,5,5);
imshow(labeloverlay(uint8(im5_D_bin)*255, BW5_D, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I5 Diastole');
subplot(2,5,10);
imshow(labeloverlay(uint8(im5_S_bin)*255, BW5_S, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I5 Sistole');

% Area del VI en píxeles
area_px_1D=nnz(BW1_D);
area_px_2D=nnz(BW2_D);
area_px_3D=nnz(BW3_D);
area_px_4D=nnz(BW4_D);
area_px_5D=nnz(BW5_D);

area_px_1S=nnz(BW1_S);
area_px_2S=nnz(BW2_S);
area_px_3S=nnz(BW3_S);
area_px_4S=nnz(BW4_S);
area_px_5S=nnz(BW5_S);

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