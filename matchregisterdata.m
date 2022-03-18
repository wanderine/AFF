clc
close all
clear all

registerdata = readtable('registerdata.csv');

numSubjects = height(registerdata);
foundImages = zeros(numSubjects,40); % Can have many images per person
foundImagesAndDates = zeros(numSubjects,40); % Can have many images per person
wrongDateImages = zeros(numSubjects,40);
smallImagesAndDates = zeros(numSubjects,40);
dateDifferences = zeros(numSubjects,40);
personalNumberLengths = zeros(numSubjects,40);

smallestDateDifferences = zeros(numSubjects,1);

DXimages = 0;

AFF_status = table2array(registerdata(:,85));

classes = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 21 30 31 32 33 34];
classes_ = [1:17 20 21]; % indices for classes, skip SFR_bara_AFF, class 18 19 in numbers

loadData = 1;

if loadData == 1
    
    %load dicominformation.mat
    load dicominformation_large.mat
    
    % Reset variables
    foundImages = zeros(numSubjects,40); % Can have many images per person
    foundImagesAndDates = zeros(numSubjects,40); % Can have many images per person
    wrongDateImages = zeros(numSubjects,40);
    smallImagesAndDates = zeros(numSubjects,40);
    dateDifferences = zeros(numSubjects,40);
    personalNumberLengths = zeros(numSubjects,40);

    smallestDateDifferences = zeros(numSubjects,1);
        
    % Only load data once, not once per row in registerdata (will be very
    % slow...)
    
else
    
    % Old dataset directories
    
    0
    %directory = '/home/andek67/Research_projects/AFF_allfractures/anonymized_20210712/0/';
    directory = 'anonymized_20210712/0/';
    [personalNumbersClass0, scanDatesClass0, DicomFilesClass0, numberOfDicomFilesAllSubjectsClass0] = getpersonalnumbersolddata(directory);        
    
    1
    %directory = '/home/andek67/Research_projects/AFF_allfractures/anonymized_20210712/1/';
    directory = 'anonymized_20210712/1/';
    [personalNumbersClass1, scanDatesClass1, DicomFilesClass1, numberOfDicomFilesAllSubjectsClass1] = getpersonalnumbersolddata(directory);
    
    2
    %directory = '/home/andek67/Research_projects/AFF_allfractures/anonymized_20210712/2/';
    directory = 'anonymized_20210712/2/';
    [personalNumbersClass2, scanDatesClass2, DicomFilesClass2, numberOfDicomFilesAllSubjectsClass2] = getpersonalnumbersolddata(directory);
    
    3
    %directory = '/home/andek67/Research_projects/AFF_allfractures/anonymized_20210712/3/';
    directory = 'anonymized_20210712/3/';
    [personalNumbersClass3, scanDatesClass3, DicomFilesClass3, numberOfDicomFilesAllSubjectsClass3] = getpersonalnumbersolddata(directory);
    
    4
    %directory = '/home/andek67/Research_projects/AFF_allfractures/anonymized_20210712/4/';
    directory = 'anonymized_20210712/4/';
    [personalNumbersClass4, scanDatesClass4, DicomFilesClass4, numberOfDicomFilesAllSubjectsClass4] = getpersonalnumbersolddata(directory);
    
    5
    %directory = '/home/andek67/Research_projects/AFF_allfractures/anonymized_20210712/5/';
    directory = 'anonymized_20210712/5/';
    [personalNumbersClass5, scanDatesClass5, DicomFilesClass5, numberOfDicomFilesAllSubjectsClass5] = getpersonalnumbersolddata(directory);
    
    6
    %directory = '/home/andek67/Research_projects/AFF_allfractures/anonymized_20210712/6/';
    directory = 'anonymized_20210712/6/';
    [personalNumbersClass6, scanDatesClass6, DicomFilesClass6, numberOfDicomFilesAllSubjectsClass6] = getpersonalnumbersolddata(directory);
    
    7
    %directory = '/home/andek67/Research_projects/AFF_allfractures/anonymized_20210712/7/';
    directory = 'anonymized_20210712/7/';
    [personalNumbersClass7, scanDatesClass7, DicomFilesClass7, numberOfDicomFilesAllSubjectsClass7] = getpersonalnumbersolddata(directory);
    
    8
    %directory = '/home/andek67/Research_projects/AFF_allfractures/anonymized_20210712/8/';
    directory = 'anonymized_20210712/8/';
    [personalNumbersClass8, scanDatesClass8, DicomFilesClass8, numberOfDicomFilesAllSubjectsClass8] = getpersonalnumbersolddata(directory);
    
    9
    %directory = '/home/andek67/Research_projects/AFF_allfractures/anonymized_20210712/9/';
    directory = 'anonymized_20210712/9/';
    [personalNumbersClass9, scanDatesClass9, DicomFilesClass9, numberOfDicomFilesAllSubjectsClass9] = getpersonalnumbersolddata(directory);
    
    10
    %directory = '/home/andek67/Research_projects/AFF_allfractures/anonymized_20210712/10/';
    directory = 'anonymized_20210712/10/';
    [personalNumbersClass10, scanDatesClass10, DicomFilesClass10, numberOfDicomFilesAllSubjectsClass10] = getpersonalnumbersolddata(directory);
    
    11
    %directory = '/home/andek67/Research_projects/AFF_allfractures/anonymized_20210712/11/';
    directory = 'anonymized_20210712/11/';
    [personalNumbersClass11, scanDatesClass11, DicomFilesClass11, numberOfDicomFilesAllSubjectsClass11] = getpersonalnumbersolddata(directory);
    
    12
    %directory = '/home/andek67/Research_projects/AFF_allfractures/anonymized_20210712/12/';
    directory = 'anonymized_20210712/12/';
    [personalNumbersClass12, scanDatesClass12, DicomFilesClass12, numberOfDicomFilesAllSubjectsClass12] = getpersonalnumbersolddata(directory);
    
    13
    %directory = '/home/andek67/Research_projects/AFF_allfractures/anonymized_20210712/13/';
    directory = 'anonymized_20210712/13/';
    [personalNumbersClass13, scanDatesClass13, DicomFilesClass13, numberOfDicomFilesAllSubjectsClass13] = getpersonalnumbersolddata(directory);
    
    14
    %directory = '/home/andek67/Research_projects/AFF_allfractures/anonymized_20210712/14/';
    directory = 'anonymized_20210712/14/';
    [personalNumbersClass14, scanDatesClass14, DicomFilesClass14, numberOfDicomFilesAllSubjectsClass14] = getpersonalnumbersolddata(directory);
    
    21
    %directory = '/home/andek67/Research_projects/AFF_allfractures/anonymized_20210712/21/';
    directory = 'anonymized_20210712/21/';
    [personalNumbersClass21, scanDatesClass21, DicomFilesClass21, numberOfDicomFilesAllSubjectsClass21] = getpersonalnumbersolddata(directory);
    
    % AFF directories
    %directory1 = '/home/andek67/Research_projects/AFF_allfractures/newimages2022/SV1_+_2_bara_AFF/';
    %directory2 = '/home/andek67/Research_projects/AFF_allfractures/newimages2022/SFR_bara_AFF/';
    %directory3 = '/home/andek67/Research_projects/AFF_allfractures/newimages2022/SFR_bara_AFF/Resterande_104_AFF_i_SFR/';
    directory1 = 'newimages2022/SV1_+_2_bara_AFF/';
    directory2 = 'newimages2022/SFR_bara_AFF/';                             % skip
    directory3 = 'newimages2022/SFR_bara_AFF/Resterande_104_AFF_i_SFR/';    % skip
    directory4 = 'newimages2022/missingAFF/';
    directory5 = 'newimages2022/missingcontrols/';
    
    30
    [personalNumbersClass30, scanDatesClass30, DicomFilesClass30, numberOfDicomFilesAllSubjectsClass30] = getpersonalnumbersnewdata(directory1);
    
    31
    [personalNumbersClass31, scanDatesClass31, DicomFilesClass31, numberOfDicomFilesAllSubjectsClass31] = getpersonalnumbersnewdata(directory2);
    
    32
    [personalNumbersClass32, scanDatesClass32, DicomFilesClass32, numberOfDicomFilesAllSubjectsClass32] = getpersonalnumbersnewdata(directory3);
    
    33
    [personalNumbersClass33, scanDatesClass33, DicomFilesClass33, numberOfDicomFilesAllSubjectsClass33] = getpersonalnumbersnewdata(directory4);
    
    34
    [personalNumbersClass34, scanDatesClass34, DicomFilesClass34, numberOfDicomFilesAllSubjectsClass34] = getpersonalnumbersnewdata(directory5);
    
    personalNumbersAllClasses{1} = personalNumbersClass0;
    personalNumbersAllClasses{2} = personalNumbersClass1;
    personalNumbersAllClasses{3} = personalNumbersClass2;
    personalNumbersAllClasses{4} = personalNumbersClass3;
    personalNumbersAllClasses{5} = personalNumbersClass4;
    personalNumbersAllClasses{6} = personalNumbersClass5;
    personalNumbersAllClasses{7} = personalNumbersClass6;
    personalNumbersAllClasses{8} = personalNumbersClass7;
    personalNumbersAllClasses{9} = personalNumbersClass8;
    personalNumbersAllClasses{10} = personalNumbersClass9;
    personalNumbersAllClasses{11} = personalNumbersClass10;
    personalNumbersAllClasses{12} = personalNumbersClass11;
    personalNumbersAllClasses{13} = personalNumbersClass12;
    personalNumbersAllClasses{14} = personalNumbersClass13;
    personalNumbersAllClasses{15} = personalNumbersClass14;
    personalNumbersAllClasses{16} = personalNumbersClass21;
    
    personalNumbersAllClasses{17} = personalNumbersClass30;
    personalNumbersAllClasses{18} = personalNumbersClass31;
    personalNumbersAllClasses{19} = personalNumbersClass32;
    
    personalNumbersAllClasses{20} = personalNumbersClass33;
    personalNumbersAllClasses{21} = personalNumbersClass34;
    
    scanDatesAllClasses{1} = scanDatesClass0;
    scanDatesAllClasses{2} = scanDatesClass1;
    scanDatesAllClasses{3} = scanDatesClass2;
    scanDatesAllClasses{4} = scanDatesClass3;
    scanDatesAllClasses{5} = scanDatesClass4;
    scanDatesAllClasses{6} = scanDatesClass5;
    scanDatesAllClasses{7} = scanDatesClass6;
    scanDatesAllClasses{8} = scanDatesClass7;
    scanDatesAllClasses{9} = scanDatesClass8;
    scanDatesAllClasses{10} = scanDatesClass9;
    scanDatesAllClasses{11} = scanDatesClass10;
    scanDatesAllClasses{12} = scanDatesClass11;
    scanDatesAllClasses{13} = scanDatesClass12;
    scanDatesAllClasses{14} = scanDatesClass13;
    scanDatesAllClasses{15} = scanDatesClass14;
    scanDatesAllClasses{16} = scanDatesClass21;
    
    scanDatesAllClasses{17} = scanDatesClass30;
    scanDatesAllClasses{18} = scanDatesClass31;
    scanDatesAllClasses{19} = scanDatesClass32;
    
    scanDatesAllClasses{20} = scanDatesClass33;
    scanDatesAllClasses{21} = scanDatesClass34;
    
    
    dicomFilesAllClasses{1} = DicomFilesClass0;
    dicomFilesAllClasses{2} = DicomFilesClass1;
    dicomFilesAllClasses{3} = DicomFilesClass2;
    dicomFilesAllClasses{4} = DicomFilesClass3;
    dicomFilesAllClasses{5} = DicomFilesClass4;
    dicomFilesAllClasses{6} = DicomFilesClass5;
    dicomFilesAllClasses{7} = DicomFilesClass6;
    dicomFilesAllClasses{8} = DicomFilesClass7;
    dicomFilesAllClasses{9} = DicomFilesClass8;
    dicomFilesAllClasses{10} = DicomFilesClass9;
    dicomFilesAllClasses{11} = DicomFilesClass10;
    dicomFilesAllClasses{12} = DicomFilesClass11;
    dicomFilesAllClasses{13} = DicomFilesClass12;
    dicomFilesAllClasses{14} = DicomFilesClass13;
    dicomFilesAllClasses{15} = DicomFilesClass14;
    dicomFilesAllClasses{16} = DicomFilesClass21;
    
    dicomFilesAllClasses{17} = DicomFilesClass30;
    dicomFilesAllClasses{18} = DicomFilesClass31;
    dicomFilesAllClasses{19} = DicomFilesClass32;
    
    dicomFilesAllClasses{20} = DicomFilesClass33;
    dicomFilesAllClasses{21} = DicomFilesClass34;
    
end

scanNumbers = zeros(1124,1);

totalImages = 0;
invalidPersonalNumbers = 0;

% one DICOM file per directory, also counting CT
% 10 331 images for < 30 day date difference
% 10 454 images for < 40 day date difference
% 10 904 images for < 50 day date difference
% 11 139 images for < 60 day date difference

% All DICOM files in each directory, also counting CT
% 33 188 images for < 30 day date difference
% 32 881 images for < 20 day date difference
% 31 334 images for < 10 day date difference

% Updated scripts:
% 14 101 images for < 30 days
% 13 794 images for < 20 days
% 13 190 images for < 10 days
% 12 032 images for < 5 days

personalNumberLengthsAllClasses = {};

% Match personal numbers
for subject = 1:numSubjects
    
    subject
    
    % Get current personal number in register data
    currentPnr = num2str(registerdata(subject,:).pnr);
    
    if AFF_status(subject) == 1
        subjectType = 'AFF';
    else
        subjectType = 'CONTROL';
    end
    
    % Check in all classes
    for class = classes_ % classes_ contains indices for "classes"
        
        % Get all personal numbers in this class
        personalNumbers = personalNumbersAllClasses{class};
        % Get all scan dates in this class
        scanDates = scanDatesAllClasses{class};
        % Get all DICOM files in this class
        dicomFiles = dicomFilesAllClasses{class};                
        
        % Check one personal number at a time
        for s = 1:length(personalNumbers)
            
            thisPnr = personalNumbers(s);
            thisPnr = thisPnr{1};
            
            try
                thisPnr = erase(thisPnr,'-'); % Remove any -
            catch            
               invalidPersonalNumbers = invalidPersonalNumbers + 1;
            end
            
            % Correct subject
            if strcmp(currentPnr,thisPnr)
                
                foundImages(subject,class) = foundImages(subject,class) + 1;
                
                % Get scan dates for this subject (directory)
                dates = scanDates{s};
                
                % Get all files for this subject (directory)
                files = dicomFiles{s}; 
                
                tempdate = datetime(1800,1,1); % to be able to compare different dates (scan occasions)
                olddate = tempdate;
                imageNumber = 1;
                imageNumberSmall = 1;
                
                % Loop over dates (files) for this subject / directory
                for date = 1:length(dates)
                    
                    % Convert each date to same format as in register file
                    tempdate = dates{date};
                    year = tempdate(1:4); month = tempdate(5:6); day = tempdate(7:8);
                    year = str2num(year);
                    month = str2num(month); % Will remove 0
                    day = str2num(day);  % Will remove 0
                    tempdate = datetime(year,month,day); % Same format as in register file
                    tempdifference = table2array(registerdata(subject,end-3)) - tempdate;
                    tempdifference = hours(tempdifference)/24; % Convert diff from hours to days
                    
                    % Is the scan date close to the date of the diagnosis?
                    if abs(tempdifference) < 30
                                                
                        file = files{date}; % Get the current file 
                        header = dicominfo(file);
                        
                        % Check if there actually is an image...
                        if header.Width > 0
                            
                            % To avoid increasing scan number for images we
                            % do not save, increment scan number here
                            if olddate ~= tempdate
                                differentDate = 1;
                            else
                                differentDate = 0;
                            end
                            olddate = tempdate;
                            
                            if differentDate == 1
                                scanNumbers(subject) = scanNumbers(subject) + 1;
                                imageNumber = 1;
                                imageNumberSmall = 1;
                            end
                            
                            foundImagesAndDates(subject,class) = foundImagesAndDates(subject,class) + 1;
                            %copyfile(file,['matchedimages4/patient_' num2str(subject) '_' subjectType '_class_' num2str(classes(class)) '_modality_' header.Modality '_scanoccasion_' num2str(scanNumbers(subject)) '_imagenumber_' num2str(imageNumber) '_timedifference_' num2str(abs(tempdifference)) '_days.dcm' ])
                            imageNumber = imageNumber + 1;
                            totalImages = totalImages + 1;
                            if strcmp(header.Modality,'DX')
                                DXimages = DXimages + 1;
                            end
                        else
                            disp('Too small image')
                            smallImagesAndDates(subject,class) = smallImagesAndDates(subject,class) + 1;
                            %copyfile(file,['smallimages/patient_' num2str(subject) '_' subjectType '_class_' num2str(classes(class)) '_modality_' header.Modality '_scanoccasion_' num2str(scanNumbers(subject)) '_imagenumber_' num2str(imageNumberSmall) '_timedifference_' num2str(abs(tempdifference)) '_days.dcm' ])
                            imageNumberSmall = imageNumberSmall + 1;
                        end
                    else
                        disp('Wrong date')
                        wrongDateImages(subject,class) = wrongDateImages(subject,class) + 1;
                        dateDifferences(subject,class) = tempdifference;
                    end
                    
                end
            end
        end        
    end
end


%for subject = 1:numSubjects
%    smallestDateDifferences(subject) = min(abs(dateDifferences(subject,:)));
%end
%smallestDateDifferences(smallestDateDifferences == 10000) = NaN;
%plot(smallestDateDifferences)

%----------
% Unfound subjects (ignoring date)
%----------

notFoundAFF = {};
notFoundControl = {};
counterAFF = 1;
counterControl = 1;

for subject = 1:numSubjects
    
    % Get current personal number
    currentPnr = num2str(registerdata(subject,:).pnr);
    
    if AFF_status(subject) == 1
        if (sum(foundImages(subject,:)) == 0)
            notFoundAFF{counterAFF} = currentPnr;
            counterAFF = counterAFF + 1;
        end
    else
        if (sum(foundImages(subject,:)) == 0)
            notFoundControl{counterControl} = currentPnr;
            counterControl = counterControl + 1;
        end
    end
end

%----------
% How many unfound subjects when also looking at date difference
%----------

notFoundAFFDates = {};
notFoundControlDates = {};
notFoundAFFSubjects = {};
notFoundControlSubjects = {};
counterAFF = 1;
counterControl = 1;

for subject = 1:numSubjects
    
    % Get current personal number
    currentPnr = num2str(registerdata(subject,:).pnr);
    
    if AFF_status(subject) == 1
        if (sum(foundImagesAndDates(subject,:)) == 0)
            notFoundAFFDates{counterAFF} = currentPnr;
            notFoundAFFSubjects{counterAFF} = subject;
            counterAFF = counterAFF + 1;
        end
    else
        if (sum(foundImagesAndDates(subject,:)) == 0)
            notFoundControlDates{counterControl} = currentPnr;
            notFoundControlSubjects{counterControl} = subject;
            counterControl = counterControl + 1;
        end
    end
end


for subject = 1:length(notFoundAFFSubjects)
    s = notFoundAFFSubjects{subject};
    
    if (sum(wrongDateImages(s,:)) > 0)
        s
        disp('Date')
        sum(wrongDateImages(s,:))
        dateDifferences(s,:)
    end
    if (sum(smallImagesAndDates(s,:)) > 0)
        s
        disp('Small')
        sum(smallImagesAndDates(s,:))
    end
end


counter = 0;

for subject = 1:length(notFoundControlSubjects)
    s = notFoundControlSubjects{subject};
    
    if (sum(wrongDateImages(s,:)) > 0)
        s
        disp('Date')
        sum(wrongDateImages(s,:))
        dateDifferences(s,:)
        counter = counter + 1;
    end
    if (sum(smallImagesAndDates(s,:)) > 0)
        s
        disp('Small')
        sum(smallImagesAndDates(s,:))
    end
end

counter




%for subject = 1:numSubjects
%
%    if foundSubjects(subject) == 0
%
%       subject
%
%       if (sum(wrongDateImages(subject,:)) > 0)
%           disp('Subject has wrong date')
%       elseif (sum(smallImagesAndDates(subject,:)) > 0)
%           disp('Subject has small image')
%       else
%           disp('This should not happen')
%       end
%    end
%end


%AFFs = zeros(85,1);
%for variable = 1:85
%    temp = table2array(registerdata(:,variable));
%    try
%        AFFs(variable) = sum(temp == 1);
%    catch
%        disp('Cannot use this variable')
%    end
%end
%AFFs

% Look for directories with the same personal number
%directories = dir(directory1);
%for s = 3:length(directories)
%    thisPnr = directories(s).name;
%    if strcmp(currentPnr,thisPnr)
%        foundImages(subject,2) = foundImages(subject,2) + 1;
%    end
%end


%clc
%for i = 1:length(notFoundControlDates)
%    %fprintf('%s \n', notFoundAFFDates{i});
%    fprintf('%s \n', notFoundControlDates{i});
%end

totalFiles = 0;

for class = classes_
    
    % Get all personal numbers in this class
    personalNumbers = personalNumbersAllClasses{class};
    % Get all scan dates in this class
    scanDates = scanDatesAllClasses{class};
    % Get all DICOM files in this class
    dicomFiles = dicomFilesAllClasses{class};
    
    for f = 1:length(dicomFiles)
        totalFiles = totalFiles + length(dicomFiles{f});
    end
end

totalFiles

totalshort = 0;

for class = classes_ % classes_ contains indices for "classes"
       
    class
    
    % Get all personal numbers in this class
    personalNumbers = personalNumbersAllClasses{class};
    
    short = 0;
    for s = 1:length(personalNumbers)
        thisPnr = personalNumbers(s);
        %thisPnr = thisPnr{1};
        
        try
            thisPnr = erase(thisPnr,'-');
        catch
            thisPnr
            short = short + 1;            
        end
        
        %if  length(thisPnr) < 12
        %    thisPnr
        %    short = short + 1;            
        %end
        
    end
    short
    totalshort = totalshort + short;
        
end

totalshort



