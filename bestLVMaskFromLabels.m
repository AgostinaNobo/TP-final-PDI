% Mascara obtenida con la segmentacion por kmeans

function maskLV=bestLVMaskFromLabels(I8, L)
    [rows,cols]=size(I8);
    K=max(L(:)); % Cantidad de clusters

    maskLV=false(rows, cols);
    bestScore=-Inf;

    for k=1:K
        % Seleccionamos un cluster
        mask=(L == k);
        % Aplicamos apertura para separar regiones conectadas
        mask=imopen(mask, strel('disk', 2));
        % Identificamos las regiones conectadas
        CC=bwconncomp(mask);
        % Calculamos sus propiedades con regionprops
        stats = regionprops(CC, I8, ...
            'Area', 'Centroid', 'MeanIntensity', 'Eccentricity');
        for i = 1:length(stats)
            area=stats(i).Area;
            centro=stats(i).Centroid;
            intensidad=stats(i).MeanIntensity;
            ecc=stats(i).Eccentricity;
            % Descartamos regiones muy chiquitas o muy grandes
            if area < 0.002*rows*cols || area > 0.30*rows*cols
                continue
            end
            % Descartamos regiones a la izquierda
            if centro(1) < 0.55*cols
                continue
            end
            % Puntaje según intensidad y forma
            score=intensidad/255 + (1-ecc);
            if score > bestScore
                bestScore=score;
                maskLV=false(rows, cols);
                maskLV(CC.PixelIdxList{i})=true;
            end
        end
    end
    % Rellenamos huecos
    maskLV = imfill(maskLV, 'holes');
end