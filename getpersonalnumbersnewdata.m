function [personalNumbers, scanDatesAllSubjects, dicomFilesAllSubjects, numberOfDicomFilesAllSubjects] = getpersonalnumbersnewdata(directory)

directories = dir(directory);

personalNumbers = {};
dicomFilesAllSubjects = {};
scanDatesAllSubjects = {};
numberOfDicomFilesAllSubjects = zeros(length(directories)-2,1);

% Here a subject is a subject...
for subject = 3:length(directories)
    
    scanDates = {};
    dicomFiles = {};
    imageCounter = 1;
    
    personalNumbers{subject-2} = directories(subject).name;
    if length(directories(subject).name) < 12
        disp('Short personal number')
        directories(subject).name
    elseif length(directories(subject).name) > 12
        disp('Long personal number')
        directories(subject).name
    end
    
    % Go to the DICOM directory    
    dicomdirectory = [ directory directories(subject).name '/DICOM/'  ];
    temp1 = dir(dicomdirectory);
    
    % Loop through directories
    for i = 3:length(temp1)
        
        thisdirectory = [ dicomdirectory '/' temp1(i).name ];
        temp2 = dir(thisdirectory);
        
        % Loop through directories
        for j = 3:length(temp2)
            
            thisdirectory = [ dicomdirectory '/' temp1(i).name '/' temp2(j).name ];
            temp3 = dir(thisdirectory);
            
            for k = 3:length(temp3)
                
                thisdirectory = [ dicomdirectory '/' temp1(i).name '/' temp2(j).name '/' temp3(k).name];
                temp4 = dir(thisdirectory);
                
                for l = 3:length(temp4)
                    
                    thisdirectory = [ dicomdirectory '/' temp1(i).name '/' temp2(j).name '/' temp3(k).name '/' temp4(l).name];
                    temp5 = dir(thisdirectory);
                    
                    % NOT Assuming one file per directory here
                    for m = 3:length(temp5)
                        dicomheader = dicominfo([thisdirectory '/'  temp5(m).name]);
                        % Ignore CT files
                        if ~strcmp(dicomheader.Modality,'CT')
                            dicomFiles{imageCounter} = [thisdirectory '/'  temp5(m).name];
                            scanDates{imageCounter} = dicomheader.StudyDate;
                            imageCounter = imageCounter + 1;
                        end
                    end
                    
                end
            end            
        end                
    end
    
    scanDatesAllSubjects{subject-2} = scanDates;
    dicomFilesAllSubjects{subject-2} = dicomFiles;
    numberOfDicomFilesAllSubjects(subject-2) = imageCounter-1;
    
end

