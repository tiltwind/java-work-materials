@echo off
set project_dir=
set /P project_dir=Enter Project Directory: %=%

:checkdir
IF EXIST %project_dir% (
    echo start to check ...
	goto makedir
) ELSE (
    echo can't find directory:%project_dir%
    goto end
)

:makedir
mkdir %project_dir%/target
set xml_output_file=%project_dir%/target/checkstyle_errors.xml
set html_output_file=%project_dir%/target/checkstyle_errors.html

:check
echo "project dir:%project_dir%"
set classpath=./checkstyle-7.1.2-all.jar;
set classpath=%classpath%;./serializer.jar
set classpath=%classpath%;./xalan.jar
set classpath=%classpath%;./xercesImpl.jar
set classpath=%classpath%;./xml-apis.jar
java com.puppycrawl.tools.checkstyle.Main -c check-style.xml -f xml -o %xml_output_file% %project_dir% -e target
echo "check error outpout file:%xml_output_file%"

java org.apache.xalan.xslt.Process -IN %xml_output_file% -XSL checkstyle-frames.xsl -OUT %html_output_file% -HTML
echo "check error outpout HTML:%html_output_file%"

:end
pause