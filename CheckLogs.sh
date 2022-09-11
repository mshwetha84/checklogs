
user=username

pscp -r D:\\CheckLogs\\qeServers.sh $user@<servername>:/home/${user}

pscp -r D:\\CheckLogs\\runCommands.sh $user@<servername>:/home/${user}

pscp -r D:\\CheckLogs\\arguments.txt $user@<servername>:/home/${user}

"C:\\Program Files\\PuTTY\\putty.exe" -ssh -A -i %homepath%/.ssh/known_hosts $user@<servername> 22 -m .//runCommands.sh

pscp -r $user@<servername>:/home/${user}/loginfo.out .\\loginfo.out

logout