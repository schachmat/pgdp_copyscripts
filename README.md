pgdp copyscripts
================

some scripts for easy copy-pasta as a pgdp tutor


installation
------------
Adjust the content of each *.example file to your needs.
After you made sure everything is setup correctly, remove the ".example" from the filename.

scp remote/* to your remote homefolder.

cp local/* to your local pgdp folder.


howto use
---------

make sure to replace every occurences of the following placeholders accordingly:
```XX: Group Number of the student (2 digits)
YY: Student Number in his group (2 digits)
ZZ: number of the homeworksheet (2 digits)
AUFGNR: number of the task (String)
AUFGPT: max points for the according task (String)```

1.) ssh to remote server and cp -r the new homework to
	```~/abgabe/ZZ```
	log out.

2.) cd to your local/abgabe directory and run:
	```./down.sh ZZ```

3.) cd to your local/korrektur directory and run:
	```./create.sh ZZ AUFGNR:AUFGPT AUFGNR:AUFGPT```
	to create correction templates. feel free to adjust the template in create.sh to your needs before running it.

4.) edit all the XXYY files in your local/korrektur/ZZ directory.

5.) after you are done with your correction and all your comments have been added to the apropriate file, cd to your local/korrektur directory and run:
	```./up.sh ZZ```
	to upload your corrections to your folder on the remote server.

6.) now ssh to the remote server again, cd to ~/korrektur and run:
	```./copy2students.sh ZZ```
	to copy each correction to the respective students folder.

7.) Cave Johnson, i'm done here.


Feel free to apply changes and extensions as you wish. Also consider creating a merge request.
