#! /usr/bin/env bash

#ssh key 생성, sshpass를 사용하여 vagrant 유저로 ssh를 사용해 vagrant@node0[12]에 접속하겠다.
sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@node01 # -o StrictHostKeyChecking=no 키 확인창 안뜨게함
sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@node02