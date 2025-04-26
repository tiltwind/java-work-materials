
----------------------------------
### Some URLs ###
----------------------------------

https://sourceforge.net/projects/checkstyle/files/checkstyle/7.1.2/checkstyle-7.1.2-all.jar
https://raw.githubusercontent.com/checkstyle/checkstyle/master/src/main/resources/sun_checks.xml
https://raw.githubusercontent.com/checkstyle/checkstyle/master/src/main/resources/google_checks.xml


----------------------------------
### COMMAND LINES ###
----------------------------------

java -jar checkstyle-7.1.2-all.jar -c /sun_checks.xml MyClass.java
java -jar checkstyle-7.1.2-all.jar -c /google_checks.xml MyClass.java
java -cp checkstyle-7.1.2-all.jar com.puppycrawl.tools.checkstyle.gui.Main MyClass.java

----------------------------------
### CMD SYNATX ###
----------------------------------
java -D<property>=<value>  \
     com.puppycrawl.tools.checkstyle.Main \
     -c <configurationFile> \
     [-f <format>] [-p <propertiesFile>] [-o <file>] \
     [-t | --tree] [-T | --treeWithComments] [-J | treeWithJavadoc] [-j | --javadocTree] [-v] \
     file...
      
Command line options are:

-c configurationFile - specifies the location of the file that defines the configuration modules. 
	The location can either be a filesystem location, or a name passed to the ClassLoader.getResource() method.
-f format - specify the output format. Options are "plain" for the DefaultLogger and "xml" for the XMLLogger. Defaults to "plain".
-p propertiesFile - specify a properties file to use.
-o file - specify the file to output to.
-t, --tree - print Abstract Syntax Tree(AST) of the checked file. The option cannot be used other options and requires exactly one file to run on to be specified.
-T, --treeWithComments - print Abstract Syntax Tree(AST) with comment nodes of the checked file. 
	The option cannot be used other options and requires exactly one file to run on to be specified.
-J, --treeWithJavadoc - print Abstract Syntax Tree(AST) with Javadoc nodes and comment nodes of the checked file. 
	The option cannot be used other options and requires exactly one file to run on to be specified.
-j, --javadocTree - print Parse Tree of the Javadoc comment. The file have to contain only Javadoc comment content 
	without including '/**' and '*/' at the beginning and at the end respectively. For example: MyTestFile.javadoc
           * Test method.
           * @return true
	The option cannot be used other options and requires exactly one file to run on to be specified.
-d, --debug - Print all debug logging of CheckStyle utility.
-e, --exclude excludedDirectory - Directory to exclude from CheckStyle. 
	The directory can be the full, absolute path, or relative to the current path. Multiple excludes are allowed.
-x, --exclude-regexp excludedDirectoryPattern - Directory pattern to exclude from CheckStyle. Multiple excludes are allowed.
-v - print product version and exit. Any other option is ignored.
	  
----------------------------------
### SAMPLE ###
----------------------------------
java -cp checkstyle-7.1.2-all.jar com.puppycrawl.tools.checkstyle.Main -c google_checks.xml -f xml -o build/checkstyle_errors.xml src/


----------------------------------
### HTML REPORT ###
----------------------------------
Checkstyle project does not have HTML report generator. 
You need to generate XML and then use other tools (xslt, .....) to generate HTML. 
Some xsl to process XML format 
- https://github.com/checkstyle/contribution/tree/master/xsl

http://xml.apache.org/xalan-j/commandline.html
http://mirror.bit.edu.cn/apache/xalan/xalan-j/binaries/xalan-j_2_7_2-bin.zip

Download Xalan-Java.

Set the Java classpath to include xalan.jar, serializer.jar, xml-apis.jar, and xercesImpl.jar 
	-- or another conformant XML Parser -- (see Plugging in the Transformer and XML parser).
Call java and the Process class with the appropriate flags and arguments (described below). 
	The following command line, for example, includes the -IN, -XSL, and -OUT flags with their accompanying arguments 
		-- the XML source document, the XSL stylesheet, and the output file:
java org.apache.xalan.xslt.Process -IN foo.xml -XSL foo.xsl -OUT foo.out -HTML


