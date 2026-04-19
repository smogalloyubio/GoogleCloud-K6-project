#!/bin/bash


sudo rm -f /usr/share/keyrings/k6-archive-keyring.gpg
sudo rm -f /etc/apt/sources.list.d/k6.list


sudo mkdir -p /usr/share/keyrings


curl -fsSL https://dl.k6.io/key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/k6-archive-keyring.gpg


echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list


sudo apt-get update
sudo apt-get install -y k6