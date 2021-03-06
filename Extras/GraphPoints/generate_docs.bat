@echo off

REM Need JOGL directory at C:/jogl-1.1.1-windows-amd64
set jogl_path=c:/jogl-1.1.1-windows-amd64

REM Checks to see if the jogl_path exists and that it has a lib sub-directory.
:NO_JOGL_DIR
if exist %jogl_path% if exist %jogl_path%/lib goto PATH_SET
echo The JOGL directory, %jogl_path%, either does not exist or does not contain^
 a lib sub-folder for the JOGL library.
set /p jogl_path=Please enter the path of the base JOGL directory:
goto NO_JOGL_DIR

:PATH_SET
SET class_path=.;%jogl_path%/lib/gluegen-rt.jar;%jogl_path%/lib/jogl.jar

Echo Generating Documentation
javadoc -sourcepath %class_path% -cp %class_path% -d ./docs *.java -private^
 -author

Echo Done