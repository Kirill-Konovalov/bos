#2.1.1
mkdir test
cd test/
touch file
ls -l
-rw-rw-r-- 1 admin admin 0 Nov  5 20:19 file

#2.1.2
chmod ugo-rwx file
cat file

#2.1.3
chmod u+w file
echo 'text' > file
cat file

#2.1.4
chmod g+r file
cat file

#2.1.5
chmod u+r file
cat file

#2.1.6
mkdir dir
touch dir/new_file
echo "new_file" > dir/new_file 
ls dir/

#2.1.7
chmod ugo-x dir/
cat ./dir/new_file
rm ./dir/new_file

#2.1.8
chown root file

#2.1.9
umask 077
umask
touch file.txt
ls -l file.txt

#2.1.10
umask 000
umask
touch new2
ls -l new2

#2.1.11
su -
cd /home/admin/test
chown root file
ls -l file
chmod 400 file
ls -l file
exit

#2.1.12
cat file
su -
cd /home/admin/test
chmod 440 file
ls -l file
exit
cat file

#2.2.1
id

#2.2.2
grep "admin" /etc/passwd
grep "admin" /etc/group

#2.2.3
sudo groupadd labgroup
grep "labgroup" /etc/group

#2.2.4
sudo useradd -m -d /home/labuser -s /bin/bash labuser
grep "labuser" /etc/passwd

#2.2.5
sudo passwd labuser
su - labuser
whoami
id
pwd
exit

#2.2.6
su - labuser
touch ./test.txt
ls -l ./test.txt 

#2.2.7
sudo usermod -aG labgroup labuser
id labuser
su - labuser
groups

#2.2.8
sudo useradd -m -d /home/labuser2 -s /bin/bash labuser2
sudo usermod -aG labgroup labuser2
id labuser2

#2.2.9
mkdir /tmp/lab_shared
sudo chown admin:labgroup /tmp/lab_shared/
ls -ld /tmp/lab_shared/
su - labuser
touch /tmp/lab_shared/file1.txt
ls /tmp/lab_shared/

#2.2.10
su - labuser
touch /tmp/lab_shared/file2.txt 
su - labuser2
cat /tmp/lab_shared/file2.txt 
echo "I'm labuser2" >> /tmp/lab_shared/file2.txt
rm /tmp/lab_shared/file2.txt

#2.2.11
sudo chmod g+s /tmp/lab_shared
ls -ld /tmp/lab_shared/
su - labuser
touch /tmp/lab_shared/sgid.txt
su - labuser2
touch /tmp/lab_shared/sgid2.txt 
ls -l /tmp/lab_shared/sgid2.txt

#2.2.12
sudo mkdir /tmp/sticky
sudo chmod 1777 /tmp/sticky/
su - labuser
echo "labuser" > /tmp/sticky/user1.txt
exit
su - labuser2
echo "labuser2" > /tmp/sticky/user2.txt
rm /tmp/sticky/user1.txt 
exit


#2.2.13
sudo passwd -l labuser
su - labuser
sudo passwd -u labuser
su - labuser

#2.2.14
sudo chage -l labuser
sudo chage -d 0 labuser
sudo chage -l labuser

#2.2.15
sudo usermod -s /bin/sh labuser
 grep "labuser" /etc/passwd

#2.2.16
sudo userdel labuser2
grep "labuser2" /etc/passwd
sudo ls -ld /home/labuser2
sudo ls -la /home/labuser2

#2.2.17
cat /etc/passwd

#2.2.18
cat /etc/login.defs

#2.2.19
sudo useradd -m -s /bin/bash testuser
sudo useradd -r -s /usr/sbin/nologin testsystem
getent passwd testuser testsystem 

#2.2.20
sudo userdel testsystem
sudo useradd -r -m -s /usr/sbin/nologin testsystem
getent passwd testsystem
ls -ld /home/testsystem/

#2.2.21
grep -E "(/nologin|/false)$" /etc/passwd
 which nologin
 which false

#2.2.22
sudo usermod -s /usr/sbin/nologin testuser
getent passwd testuser
sudo su - testuser
sudo -u testuser whoami

#2.2.23
sudo usermod -s /bin/false testuser
getent passwd testuser 
sudo su - testuser

#2.2.24
sudo usermod -s /bin/bash testuser
getent passwd testuser 
sudo su - testuser 

#2.2.25
sudo usermod -s /usr/bin/ls testuser 
getent passwd testuser
sudo su - testuser
sudo usermod -s /bin/bash testuser

#2.2.26
sudo groupadd -r testsystemgroup
sudo groupadd testgroup
getent group testsystemgroup testgroup

#2.2.27
cat /etc/login.defs

#2.2.28
sudo useradd -r -M -g testsystemgroup -s /usr/bin/nologin serviceuser
getent passwd serviceuser
id serviceuser

#2.2.29
su - testuser
sudo useradd admin

#2.2.30
sudo visudo
su - testuser
sudo /usr/bin/id
sudo /usr/bin/whoami

#2.2.31
sudo visudo 
su - testuser
sudo /usr/bin/id
sudo /usr/bin/whoami

#2.2.32
sudo groupadd testadmins
sudo usermod -aG testadmins testuser 
su - testuser 
sudo /usr/bin/id
sudo deluser testuser testadmins

#2.2.33
cat /etc/login.defs

#2.2.34
cat /etc/login.defs 
sudo nvim /etc/login.defs
sudo useradd -m -s /bin/bash configuser1
id configuser1
sudo userdel -r configuser1 
udo nvim /etc/login.defs

#2.2.35
sudo cp /etc/login.defs /etc/login.defs.bak
sudo nvim /etc/login.defs
sudo useradd -r -M -s /usr/sbin/nologin sysconfig1
sudo useradd -r -M -s /usr/sbin/nologin sysconfig2
sudo useradd -r -M -s /usr/sbin/nologin sysconfig3
id sysconfig1
id sysconfig2
id sysconfig3
sudo userdel sysconfig1
sudo userdel sysconfig2
sudo userdel sysconfig3
sudo cp /etc/login.defs.bak /etc/login.defs

#2.2.36
sudo nvim /etc/login.defs
sudo groupadd configgroup1
getent group configgroup1
sudo groupdel configgroup1 
sudo cp /etc/login.defs.bak /etc/login.defs

#2.2.37
sudo nvim /etc/login.defs
 sudo groupadd -r sysgroup1
 sudo groupadd -r sysgroup2
 sudo groupadd -r sysgroup3
getent group sysgroup1 sysgroup2 sysgroup3
 sudo groupdel sysgroup1
 sudo groupdel sysgroup2
 sudo groupdel sysgroup3
 sudo cp /etc/login.defs.bak /etc/login.defs

#2.2.38
sudo nvim /etc/login.defs
sudo useradd homeuser1
ls -ld /home/homeuser1/
sudo nvim /etc/login.defs
sudo useradd homeuser2
ls -ld /home/homeuser2
sudo userdel -r homeuser1 
sudo userdel homeuser2 

#2.2.39
sudo nvim /etc/login.defs
sudo useradd -r syshome1
ls -ld /home/syshome1
sudo useradd -r -m syshome2
ls -ld /home/syshome2
sudo userdel syshome1
sudo userdel -r syshome2

#2.2.40
sudo useradd -m homeuser3
ls -ld /home/homeuser3/
 sudo nvim /etc/login.defs
sudo useradd -m homeuser4
ls -ld /home/homeuser4/
sudo userdel -r homeuser3
sudo userdel -r homeuser4

#2.2.41
sudo useradd -m groupuser1
id groupuser1
 getent group groupuser1 
sudo nvim /etc/login.defs
sudo useradd -m groupuser2
 id groupuser2
getent group groupuser2
sudo userdel -r groupuser1
sudo userdel -r groupuser2

#2.2.42
sudo useradd -D -s /bin/bash 
useradd -D | grep SHELL
sudo useradd -m defaultuser1
grep "defaultuser1" /etc/passwd
sudo useradd -D -s /bin/sh
sudo userdel -r defaultuser1 

#2.2.43
useradd -D | grep HOME
sudo mkdir -p /home/testhome
sudo useradd -D -b /home/testhome
sudo useradd -m defualtuser2
getent passwd defualtuser2
sudo useradd -D -b /home
sudo userdel -r defualtuser2 
sudo rmdir /home/testhome/








