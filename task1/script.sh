#!/bin/sh

echo "Start script"

user="user"
input="/scripts/servers.txt"
output="/scripts/bad_servers.txt"
data="/scripts/data"
email="mailbox@server.ru"
email_pass="password"
smtp="smtp://smtp.example.ru"

> $output

while read -r line
do
 scp -q $data $user@$line:"/data/"
 if [ $? -eq 0 ];
 then
  echo "$line STATUS OK"
 else
  echo "$line" >> $output
 fi
done < "$input"

curl --ssl ${smtp} --mail-from ${email} \
     --mail-rcpt ${email} --upload-file $output \
     --user "$email:$email_pass"
