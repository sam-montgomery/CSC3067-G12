function scalingDetector(im, model)
    lrgRects = detect(im, model, [320, 160]);
    nrmRects = detect(im, model, [160, 80]);
    smlRects = detect(im, model, [80, 40]);
    xsmlRects = detect(im, mode, [40, 20]);
    
    
end
