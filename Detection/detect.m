function rects = detect(im, model, windowSize)
    %Window size 80 x 160 
    %windowSize = [160, 80];
    %Pedestrian img size 480 x 640
    image = cell2mat(im);
    windowCount = 1;

    for y=1:windowSize(1):size(image,1)
        for x=1:windowSize(2):size(image,2)
            windowpos = [x,y,windowSize(2)-1,windowSize(1)-1];
            window = 0; 
            boxPos{windowCount} = [x,y]; 
            window = double(imcrop(image, windowpos));
            window = imresize(window, [160, 96]);
            imshow(window);
            windowHog = hog_feature_vector(window);
            hogFeat(windowCount, :) = windowHog;
            windowCount = windowCount + 1;
        end
    end
    for i=1:windowCount-1
        %pred(i) = testKNN(hogFeat(i,:), model, 5);
        pred(i) = testSVM(hogFeat(i,:), model);
        if(pred(i) == 1)
            bBox = cell2mat(boxPos(i));
            rect = rectangle('Position',[bBox(1),bBox(2),windowSize(2),windowSize(1)],'LineWidth',1, 'EdgeColor','r');
            rects(i,:) = rect;
        end
    end
   

%     pred = 0;
%     windowSize = [80, 40];
%     windowCount = 1;
%     for y=1:windowSize(1):size(image,1)
%         for x=1:windowSize(2):size(image,2)
%             windowpos = [x,y,windowSize(2)-1,windowSize(1)-1];
%             window = 0; 
%             boxPos{windowCount} = [x,y]; 
%             window = double(imcrop(image, windowpos));
%             window = imresize(window, [160, 96]);
%             windowHog = hog_feature_vector(window);
%             hogFeat(windowCount, :) = windowHog;
%             windowCount = windowCount + 1;
%         end
%     end
%     for i=1:windowCount-1
%         pred(i) = SVMTesting(hogFeat(i,:), model);
%     end
%     imshow(image);
%     hold on
%         for i=1:windowCount-1
%             if(pred(i) == 1)
%                 bBox = cell2mat(boxPos(i));
%                 rectangle('Position',[bBox(1),bBox(2),80,160],'LineWidth',1, 'EdgeColor','r');
%             end
%         end
end