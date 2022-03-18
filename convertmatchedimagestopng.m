close all
clear all
clc

unopenedFiles = 0;
compressedFiles = 0;
originalFiles = 0;
strange = 0;

%for subject = 1:1124

%    for scanoccasion = 1:20

%files = dir(['matchedimages3/patient_' num2str(subject) '_*scanoccasion_' num2str(scanoccasion)  '_*uncompressed.dcm']);

files = dir(['matchedimages4/*uncompressed.dcm']);

% Read all images
for f = 1:length(files)
    
    f
    
    readOriginal = 0;
    ignore = 0;
    
    file = ['matchedimages4/' files(f).name];
    
    % Try opening uncompressed file
    try
        image = dicomread(file);
    catch
        disp('Could not open compressed file, trying original file')
        readOriginal = 1;
    end
        
    if (readOriginal == 0) && (width(image) > 0)
        file(end-3:end) = '.png';
        file(end-16:end-4) = '';        
        imwrite(uint16(image),file,'png');
        compressedFiles = compressedFiles + 1;
    else
        disp('Compressed file does not have an image, trying original file')
        readOriginal = 1;
    end
        
    % Try opening original file if uncompressed fails        
    if readOriginal == 1
    
        file(end-16:end-4) = '' % remove 'uncompressed'
        
        try
            image = dicomread(file);
        catch
            disp('Could not open original file, ignoring')
            ignore = 1;
            unopenedFiles = unopenedFiles + 1;
        end
        
        if (ignore == 0) && (width(image) > 0)
            file(end-3:end) = '.png';
            imwrite(uint16(image),file,'png');
            originalFiles = originalFiles + 1;                    
        elseif (width(image) == 0)
            disp('Strange...')
            strange = strange + 1;
        end
    end
end

%       end
%    end
%end

compressedFiles
originalFiles
unopenedFiles
strange



