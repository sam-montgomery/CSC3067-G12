function scalingDetector(im, model)
    lrgRects = detect(im, model, [240, 120]);
    medRects = detect(im, model, [200, 100]);
    nrmRects = detect(im, model, [160, 80]);
    ssRects = detect(im, model, [120, 60]);
    smlRects = detect(im, model, [80, 40]);
    xsmlRects = detect(im, model, [40, 20]);
    image = cell2mat(im);
    imshow(image);
    hold on
        for i=1:size(lrgRects,1)
            rectangle('Position',[lrgRects(i, 1),lrgRects(i, 2),320,160],'LineWidth',1, 'EdgeColor','r');
        end
        for i=1:size(medRects,1)
            rectangle('Position',[medRects(i, 1),medRects(i, 2),100,200],'LineWidth',1, 'EdgeColor','b');
        end
        for i=1:size(nrmRects,1)
            rectangle('Position',[nrmRects(i, 1),nrmRects(i, 2),80,160],'LineWidth',1, 'EdgeColor','g');
        end
        for i=1:size(ssRects,1)
            rectangle('Position',[ssRects(i, 1),ssRects(i, 2),60,120],'LineWidth',1, 'EdgeColor','c');
        end
        for i=1:size(smlRects,1)
            rectangle('Position',[smlRects(i, 1),smlRects(i, 2),40,80],'LineWidth',1, 'EdgeColor','y');
        end
        for i=1:size(xsmlRects,1)
            rectangle('Position',[xsmlRects(i, 1),xsmlRects(i, 2),20,40],'LineWidth',1, 'EdgeColor','m');
        end
end
