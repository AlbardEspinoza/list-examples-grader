CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

LIST_EXAMPLES=ListExamples.java

git clone $1 student-submission
echo 'Finished cloning'

if [ -f "student-submission/$LIST_EXAMPLES" ]; then
	echo "The required file exists"
else
	echo "The required file: $LIST_EXAMPLES, does not exist"
	exit
fi

cp -r lib grading-area/ 
cp TestListExamples.java "student-submission/$LIST_EXAMPLES" grading-area/

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point
# list-examples-grader
# 	GradeServer.java
#	Server.java
#	TestListExamples.java
#	grade.sh
#	lib
#		hamcrest-core-1.3.jar
#		junit-4.13.2.jar
#	student-submission
#		ListExamples.java
#	grading-area
#		lib
#			hamcrest-core-1.3.jar
#			junit-4.13.2.jar
#		TestListExamples.java
#		ListExamples.java	

# Then, add here code to compile and run, and do any post-processing of the
# tests

cd grading-area
javac *.java
java $CPATH GradeServer.java
