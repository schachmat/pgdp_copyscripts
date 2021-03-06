pgdp copyscripts
================

some scripts for easy copy-pasta as a pgdp tutor


installation
------------
For use of the status files you first have to change the "share" settings of your google-drive sheet so you can grab it with wget without loggin in first. This is no problem if you do not share the key with anyone.

Adjust the content of each .example file to your needs.
The key to your google-drive sheet goes into local/korrektur/config.
After you made sure everything is setup correctly, remove the ".example" from the filename.

scp remote/korrektur to your remote homefolder.

cp local/korrektur and local/abgabe to your local pgdp folder.


howto use
---------

make sure to replace every occurences of the following placeholders accordingly:
    XX: Group Number of the student (2 digits)
    YY: Student Number in his group (2 digits)
    ZZ: number of the homeworksheet (2 digits)
    AUFGNR: number of the task (String)
    AUFGPT: max points for the according task (String)

1.) ssh to remote server and cp -r the new homework to
    ~/abgabe/ZZ
	log out.

2.) cd to your local/abgabe directory and run:
   ./down.sh ZZ

3.) cd to your local/korrektur directory and run:
    ./create.sh ZZ AUFGNR:AUFGPT AUFGNR:AUFGPT
	to create correction templates. feel free to adjust the template in create.sh to your needs before running it.

4.) edit all the XXYY files in your local/korrektur/ZZ directory.

5.) (optional) run
    ./status.sh
    to grab the current students status from your google-drive sheet and upload it to the server.

6.) after you are done with your correction and all your comments have been added to the apropriate file, cd to your local/korrektur directory and run:
    ./up.sh ZZ
	to upload your corrections to your folder on the remote server.

7.) now ssh to the remote server again, cd to ~/korrektur and run:
    ./copy2students.sh ZZ
	to copy each correction to the respective students folder.
    this script will also update the status file in each students korrektur folder if available.

8.) Cave Johnson, i'm done here.


Feel free to apply changes and extensions as you wish. Also consider creating a merge request.
