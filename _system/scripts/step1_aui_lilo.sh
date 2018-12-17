#!/bin/bash

pacman -S git --noconfirm
cd /tmp/
git clone git@github.com:helmuthdu/aui.git
cd aui
./lilo
