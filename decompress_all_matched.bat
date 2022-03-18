@echo off

for /r "Y:\Research_projects\AFF_allfractures\matchedimages4\" %%I in ("*days.dcm") do (

setlocal enableDelayedExpansion

Rem echo "%%I"

SET "input=%%I"
SET "output=!input:.dcm=_uncompressed.dcm!"

"Y:\Research_projects\AFF_allfractures\dicom_decomp\dicom_decomp\dicom_decomp.exe" -f el "%%~I" "!output!"

echo !input!
echo !output!

)
pause