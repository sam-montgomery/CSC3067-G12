function scalingDetector(im, model)
    lrgRects = detect(im, model, [240, 120],4);
    medRects = detect(im, model, [200, 100],8);
    nrmRects = detect(im, model, [160, 80],4);
    ssRects = detect(im, model, [120, 60],3);
    smlRects = detect(im, model, [80, 40],2);
    xsmlRects = detect(im, model, [40, 20], 2);
    image = cell2mat(im);
    combined.box = vertcat(lrgRects.box,medRects.box,nrmRects.box,ssRects.box,smlRects.box,xsmlRects.box);
    combined.pred = vertcat(lrgRects.pred,medRects.pred,nrmRects.pred,ssRects.pred,smlRects.pred,xsmlRects.pred);
    [nmsBoxes, boxScore] = selectStrongestBbox(combined.box, combined.pred, 'OverlapThreshold', 0.1);
    imshow(image);
    hold on
        for i=1:size(nmsBoxes,1)
            rectangle('Position',[nmsBoxes(i, 1),nmsBoxes(i, 2),nmsBoxes(i, 3),nmsBoxes(i, 4)],'LineWidth',1, 'EdgeColor','r');
        end
%         for i=1:size(medRects,1)
%             rectangle('Position',[medRects(i, 1),medRects(i, 2),100,200],'LineWidth',1, 'EdgeColor','b');
%         end
%         for i=1:size(nrmRects,1)
%             rectangle('Position',[nrmRects(i, 1),nrmRects(i, 2),80,160],'LineWidth',1, 'EdgeColor','g');
%         end
%         for i=1:size(ssRects,1)
%             rectangle('Position',[ssRects(i, 1),ssRects(i, 2),60,120],'LineWidth',1, 'EdgeColor','c');
%         end
%         for i=1:size(smlRects,1)
%             rectangle('Position',[smlRects(i, 1),smlRects(i, 2),40,80],'LineWidth',1, 'EdgeColor','y');
%         end
%         for i=1:size(xsmlRects,1)
%             rectangle('Position',[xsmlRects(i, 1),xsmlRects(i, 2),20,40],'LineWidth',1, 'EdgeColor','m');
%         end
end
