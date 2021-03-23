#! /usr/bin/env bash
#ansible이 설치되지 않은 node용으로,  bash shell 프로그래밍으로 수정
now=$(date +"%m_%d_%Y")
cp /etc/ssh/sshd_config /etc/ssh/sshd_config_$now.backup #원본파일 백업
sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config #스트림편집기로 PasswordAuthentication 수정
systemctl restart sshd