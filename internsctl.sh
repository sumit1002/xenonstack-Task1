.\" All the commands associated with internsctl
.TH man 1 "22 Dec 2023" "v0.1.0" "internsctl man page"
.SH NAME
internsctl 
.SH SYNOPSIS
internsctl [OPTIONS]
.SH DESCRIPTION
internsctl is a custom linux command via bash script which performs several commands for system or file information
.SH OPTIONS
\n Try out following options:
\n
\n \f[B]cpu\ getinfo\f[R]\t\t\t				get information about CPU of server
\n
\n \f[B]memory\ getinfo\f[R]\t\t\t				get information about memory of server
\n
\n \f[B]user\ create\ <username>\f[R]\t\t		create a new user on the server
\n
\n \f[B]user\ list\f[R]\t\t\t					list all the users on the server
\n
\n \f[B]user\ list\ --sudo-only\f[R]\t\t		list all the users with sudo permissions on the server
\n
\n \f[B]--help\f[R]\t\t\t\t 					print the help message and exit
\n
\n \f[B]--version\f[R]\t\t\t 				print version of this command
\n
\n \f[B]file\ getinfo\ <file-name>\f[R]\t		get information about a file on the server
\n
.SH BUGS
No known bugs.
.SH AUTHOR
Sumit Kandpal
