#!/bin/bash
hosts=(<servername1> <servername2> <servername3> <servername4>)

argsFile="argsUnix.txt"

if [ -f "$argsFile" ];
then
   echo "File $argsFile exist. So removing it."
  rm $argsFile
fi

user=$1
subPrefix=$2
searchText=$3

echo "user = ${user}"
echo "subPrefix = ${subPrefix}"
echo "searchText = ${searchText}"


file="./loginfo.out"
if [ -f "${file}" ];
then
   echo "File ${file} exist. So removing it."
  rm ${file}
fi

for host in ${hosts[@]};
do
echo "==Logs from ${host}==STARTS" >>./${file}

#ssh -i ~/.ssh/known_hosts -o ForwardAgent=yes $user@$host
#ssh -i /home/${user}/.ssh/known_hosts $user@$host

#ssh ${user}@$host "/bin/grep ${searchText} /www/mkto/log/${subPrefix}Customer.log" >>./${file}

ssh ${host} "/bin/grep ${searchText} /www/mkto/log/${subPrefix}Customer.log" >>./${file}
echo "==Logs from ${host}== ENDS" >>./${file}

logout
done
less ./${file}