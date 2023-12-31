#!/bin/bash

version="v0.1.0"

help="Usage: internsctl [OPTION]
\nTry out following options:
\n  cpu getinfo\t\t\t                       get information about cpu of server
\n  memory getinfo\t\t\t                    get information about memory of server
\n  user create <username>\t\t              create a new user on the server
\n  user list\t\t\t                         list all the users on the server
\n  user list --sudo-only\t\t               list all the users with sudo permission on the server
\n  --help\t\t\t\t                          print this help message and exit
\n  --version\t\t\t                         print version of this command
\n  file getinfo <file-name>\t              get information about a file on the server
\n
\nAdditional options for \"file getinfo\" command
\nfile getinfo [OPTIONS] <file-name>
\n  --size, -s\t\t\t                        print size
\n  --permissions, -p\t\t                   print file permissions
\n  --owner, -o\t\t\t                       print file owner
\n  --last-modified, -m\t\t                 print last modified time
"

# SECTION A
if [ "$1" == "" ]
then
   echo -e "Incorrect Command.\nUsage: $0 --help"
   exit



elif [ "$1" == "--help" ] && [ "$2" == "" ]    # Display the related and right commands
then
   echo -e $help
   exit




elif [ "$1" == "--version" ] && [ "$2" == "" ]  # Displays version of the command
then
   echo $version
   exit


# SECTION B -> PART-1 | LEVEL EASY

elif [ "$1" == "cpu" ] && [ "$2" == "getinfo" ] && [ "$3" == "" ]           # Get CPU information of server
then
   lscpu
   exit



elif [ "$1" == "memory" ] && [ "$2" == "getinfo" ] && [ "$3" == "" ]    # Get memory information of server
then
   free
   exit


# SECTION B -> PART-2 | LEVEL INTERMEDIATE

elif [ "$1" == "user" ] && [ "$2" == "create" ] && [ "$3" != "" ] && [ "$4" == "" ]   # Create a new user
then
   useradd "$3" -m -s /bin/bash
   passwd "$3"
   exit




elif [ "$1" == "user" ] && [ "$2" == "list" ] && [ "$3" == "--sudo-only" ] && [ "$4" == "" ]       # Display list of users with sudo permissions
then
   grep '^sudo:.*$' /etc/group | cut -d: -f4
   exit




elif [ "$1" == "user" ] && [ "$2" == "list" ] && [ "$3" == "" ]               # Dislplay all user list
then
   ls /home
   exit





# SECTION B -> PART-3 | LEVEL ADVANCE

elif [ "$1" == "file" ] && [ "$2" == "getinfo" ] && [ "$3" != "" ] && [ "$4" == "" ]        # Display information about a file like file_name, size, permissions, owner, modify time 
then
   echo -e "File\t: $3"
   echo -n -e "Access\t: " 
   ls -l $3 | awk '{print $1}'
   echo -n "Size{B} : " 
   ls -l $3 | awk '{print $5}'
   echo -n -e "Owner\t: " 
   ls -l $3 | awk '{print $3}'
   echo -n -e "Modify\t: " 
   ls -l $3 | awk '{print $6 " "$7" " $8}'
   exit


elif [ "$1" == "file" ] && [ "$2" == "getinfo" ] && [ "$3" == "--size" ] && [ "$4" != "" ] && [ "$5" == "" ]
then
   ls -l $4 | awk '{print $5}'
   exit

elif [ "$1" == "file" ] && [ "$2" == "getinfo" ] && [ "$3" == "--permissions" ] && [ "$4" != "" ] && [ "$5" == "" ]
then
   ls -l $4 | awk '{print $1}'
   exit
elif [ "$1" == "file" ] && [ "$2" == "getinfo" ] && [ "$3" == "--owner" ] && [ "$4" != "" ] && [ "$5" == "" ]
then
   ls -l $4 | awk '{print $3}'
   exit
elif [ "$1" == "file" ] && [ "$2" == "getinfo" ] && [ "$3" == "--last-modified" ] && [ "$4" != "" ] && [ "$5" == "" ]
then
   ls -l $4 | awk '{print $6 " "$7" " $8}'
   exit
   
  
   


# DEFAULT
else
   echo -e "Incorrect Command.\nUsage: $0 --help"            # Error message when typed command is wrong
   exit
fi
