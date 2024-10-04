#!/bin/sh
out=$(postqueue -p | tail -n 200)
countb=$(echo $out | sed 's/^.*in/in/')
count=$(echo $countb | tr -dc '0-9')
if [ -z "$count" ]; then
count=0
fi
hostname=$(hostname)
 
echo $count
 
if [ "$count" -eq 0 ]
then
echo "mailqueue size =$out" | mailx -v -r "backupalert@cloudminister.com" -s "Mail Queue Alert on $hostname size = $count" -S smtp="mail.cloudminister.com:587" -S smtp-use-starttls -S smtp-auth=login -S smtp-auth-user="backupalert@cloudminister.com" -S smtp-auth-password="Xd9VDh#qOw&1" -S ssl-verify=ignore -S nss-config-dir=/etc/pki/nssdb/ tanujchugh365@gmail.com tanuj@cloudminister.com support@cloudminister.com shivlendracloudminister@gmail.com shivlendra@cloudminister.com rohitbhati@cloudminister.com deepak@cloudminister.com rithik@cloudminister.com ajay@cloudminister.com ajayjangid@cloudminister.com pritam@cloudminister.com
 
echo "mail sent"
 
else [ "$count" -eq 0 ]
 
echo "mailqueue is Empty."
exit
 
fi
