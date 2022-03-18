function [personalNumbers, scanDatesAllSubjects, dicomFilesAllSubjects, numberOfDicomFilesAllSubjects] = getpersonalnumbersolddata(directory)

%close all
%clear all
%clc
%directory = '/home/andek67/Research_projects/AFF_allfractures/anonymized_20210712/0/';

directories = dir(directory);

personalNumbers = {};
dicomFilesAllSubjects = {};
scanDatesAllSubjects = {};
numberOfDicomFilesAllSubjects = zeros(length(directories)-2,1);

% Note: subject here actually means directory...due to how the directories
% are setup
for subject = 3:length(directories)
    
    scanDates = {};
    dicomFiles = {};
    imageCounter = 1;
    
    currentdirectory = [ directory directories(subject).name ];
    temp1 = dir(currentdirectory);
    currentdirectory = [ directory directories(subject).name  '/' temp1(3).name ];
    temp2 = dir(currentdirectory);
    
    % Loop through directories
    for i = 3:length(temp2)
        
        thisdirectory = [ directory directories(subject).name  '/' temp1(3).name '/' temp2(i).name];
        dicomfiles = dir([thisdirectory '/*.dcm']);
        %if (length(dicomfiles) == 0)
        %    disp('Could not find any DICOM files!')
        %    thisdirectory
        %end
        for j = 1:length(dicomfiles)
            
            try                
                dicomheader = dicominfo([thisdirectory '/'  dicomfiles(j).name]);
                % Ignore CT images
                if ~strcmp(dicomheader.Modality,'CT')
                    personalNumbers{subject-2} = dicomheader.PatientID;
                    if length(dicomheader.PatientID) < 12
                        disp('Short personal number')
                        dicomheader.PatientID
                    end
                    dicomFiles{imageCounter} = [thisdirectory '/'  dicomfiles(j).name];
                    scanDates{imageCounter} = dicomheader.StudyDate;
                    imageCounter = imageCounter + 1;                       
                end
            catch message
                disp('Could not open DICOM file')
                [thisdirectory '/'  dicomfiles(j).name]
            end
        end
    end
        
    scanDatesAllSubjects{subject-2} = scanDates;
    dicomFilesAllSubjects{subject-2} = dicomFiles;
    numberOfDicomFilesAllSubjects(subject-2) = imageCounter-1;
    
end

% Check length of personalNumbers, scanDates, dicomFiles
