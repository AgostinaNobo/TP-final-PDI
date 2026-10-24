% Detección Circular del Ventrículo Izquierdo

% Vamos a llamar a la funcion de mask_circle para todas las imagenes
BW1_D=mask_circle(im1_D_bin);
BW2_D=mask_circle(im2_D_bin);
BW3_D=mask_circle(im3_D_bin);
BW4_D=mask_circle(im4_D_bin);
BW5_D=mask_circle(im5_D_bin);

BW1_S=mask_circle(im1_S_bin);
BW2_S=mask_circle(im2_S_bin);
BW3_S=mask_circle(im3_S_bin);
BW4_S=mask_circle(im4_S_bin);
BW5_S=mask_circle(im5_S_bin);

% Mostramos las imagenes con su mascara correspondiente
figure;
subplot(2,5,1);
imshow(labeloverlay(im1_D_bin, BW1_D, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I1 Diastole');
subplot(2,5,6);
imshow(labeloverlay(im1_S_bin, BW1_S, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I1 Sistole');

subplot(2,5,2);
imshow(labeloverlay(im2_D_bin, BW2_D, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I2 Diastole');
subplot(2,5,7);
imshow(labeloverlay(im2_S_bin, BW2_S, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I2 Sistole');

subplot(2,5,3);
imshow(labeloverlay(im3_D_bin, BW3_D, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I3 Diastole');
subplot(2,5,8);
imshow(labeloverlay(im3_S_bin, BW3_S, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I3 Sistole');

subplot(2,5,4);
imshow(labeloverlay(im4_D_bin, BW4_D, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I4 Diastole');
subplot(2,5,9);
imshow(labeloverlay(im4_S_bin, BW4_S, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I4 Sistole');

subplot(2,5,5);
imshow(labeloverlay(im5_D_bin, BW5_D, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I5 Diastole');
subplot(2,5,10);
imshow(labeloverlay(im5_S_bin, BW5_D, ...
    'Colormap', [1 0 0], 'Transparency', 0.7)); title('I5 Sistole');


% Volumen del VI estimado
fprintf('-----Resultados usando deteccion circular (imfindcircles)----- \n');
fprintf('Estimated volume IMG 1 Dias: %g\n', sum(M3_BW1_dias_res(:)));
fprintf('Estimated volume IMG 2 Dias: %g\n', sum(M3_BW2_dias_res(:)));
fprintf('Estimated volume IMG 3 Dias: %g\n', sum(M3_BW3_dias_res(:)));
fprintf('Estimated volume IMG 4 Dias: %g\n', sum(M3_BW4_dias_res(:)));
fprintf('Estimated volume IMG 5 Dias: %g\n', sum(M3_BW5_dias_res(:)));
fprintf('Estimated volume IMG 1 Sys: %g\n', sum(M3_BW1_sys_res(:)));
fprintf('Estimated volume IMG 2 Sys: %g\n', sum(M3_BW2_sys_res(:)));
fprintf('Estimated volume IMG 3 Sys: %g\n', sum(M3_BW3_sys_res(:)));
fprintf('Estimated volume IMG 4 Sys: %g\n', sum(M3_BW4_sys_res(:)));
fprintf('Estimated volume IMG 5 Sys: %g\n', sum(M3_BW5_sys_res(:)));


%% Estimated ejection fraction
fprintf('-----Results using circles detection (imfindcircles)----- \n');
fprintf('Estimated ejection fraction IMG 1: %g\n', (sum(M3_BW1_dias_res(:)) - sum(M3_BW1_sys_res(:)))/sum(M3_BW1_dias_res(:)));
fprintf('Estimated ejection fraction IMG 2: %g\n', (sum(M3_BW2_dias_res(:)) - sum(M3_BW2_sys_res(:)))/sum(M3_BW2_dias_res(:)));
fprintf('Estimated ejection fraction IMG 3: %g\n', (sum(M3_BW3_dias_res(:)) - sum(M3_BW3_sys_res(:)))/sum(M3_BW3_dias_res(:)));
fprintf('Estimated ejection fraction IMG 4: %g\n', (sum(M3_BW4_dias_res(:)) - sum(M3_BW4_sys_res(:)))/sum(M3_BW4_dias_res(:)));
fprintf('Estimated ejection fraction IMG 5: %g\n', (sum(M3_BW5_dias_res(:)) - sum(M3_BW5_sys_res(:)))/sum(M3_BW5_dias_res(:)));