#!/bin/sh

service vsftpd start
sleep 5

useradd ${FTP_USER}
cat << EOF | passwd ${FTP_USER}
${FTP_USER_PASSWORD}
${FTP_USER_PASSWORD}
EOF


mkdir -p /home/${FTP_USER}/ftp
chown nobody:nogroup /home/${FTP_USER}/ftp
chmod a-w /home/${FTP_USER}/ftp
mkdir -p /home/${FTP_USER}/ftp/files
chown ${FTP_USER}:${FTP_USER} /home/${FTP_USER}/ftp/files

echo ${FTP_USER} > /etc/vsftpd.userlist

sed -i '31s/.*/write_enable=YES/' /etc/vsftpd.conf
sed -i '114s/.*/chroot_local_user=YES/' /etc/vsftpd.conf

echo "local_enable=YES" >> /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
echo "pasv_enable=YES" >> /etc/vsftpd.conf
echo "pasv_min_port=2000" >> /etc/vsftpd.conf
echo "pasv_max_port=2005" >> /etc/vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf
echo "local_root=/home/aabdou/ftp" >> /etc/vsftpd.conf

service vsftpd stop
sleep 5

/usr/sbin/vsftpd
