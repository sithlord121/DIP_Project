%Group 6: Brittany Mooney and Martin Sanchez
%Project Phase 3: function snakeMap4e

function emap = snakeMap4e(f,t,sig,n,order)
%function emap = snakeMap(f, varargin)

    function mog = computeMOG(f)
        [gmag,gdir] = imgradient(f, 'sobel');
        mog = gmag;
        %imshow(mog); %commented out for phase 3
    end

    function thresh = computeThreshold(t,Gmag)        
       if isequal(t, 'auto')
            x = edge(Gmag, 'sobel');
            thresh = x;
             imshow(x); 
             title('auto threshold')
       elseif t>=0 && t<=1
           x = edge(Gmag, 'sobel', t);
           thresh = x;
            imshow(x); 
            title('threshold [0,1]');
       end
    end            

switch nargin
    case 1
        emap = computeMOG(f); %no blurring/no thresholding case
    case 2
        mag = computeMOG(f);
        emap = computeThreshold(t, mag);
% case 5
% For “before”: blur -> gradient -> MOG -> threshold
% For “after”:    gradient -> MOG -> threshold -> blur  
% For “both”:    blur -> gradient -> MOG -> threshold -> blur  
% For “none”:   gradient -> MOG -> threshold  
    case 5
         if isequal(order,'before')
            filt = imgaussfilt(f,(n*sig)*(n*sig)); %blur image before emap
            mag = computeMOG(filt);
            threshold = computeThreshold(t,mag);
            emap = threshold;
        elseif isequal(order, 'both')
            filt = imgaussfilt(f,(n*sig)*(n*sig)); %blur image before 
            mag = computeMOG(filt); %MOG
            threshold = computeThreshold(t,mag); %threshold of MOG 
            im = im2double(threshold);  %convert to double data type for blur function
            emap = imgaussfilt(im,(n*sig)*(n*sig)); %blur image after
        elseif isequal(order, 'after')
            mag = computeMOG(f);
            threshold = computeThreshold(t,mag); %testing
            im = im2double(threshold);  %convert to double data type for blur function
            emap = imgaussfilt(im,((n*sig)*(n*sig)));
         elseif isequal(order, 'none')
             mag = computeMOG(f);
             threshold = computeThreshold(t,mag);
             emap = threshold;
         end
end
end

