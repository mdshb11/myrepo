#!/bin/bash

# -p is used to as flag and it avoids error also creat dir if already exists
sudo mkdir -p mydir
cd mydir
sudo touch f1 f2 f3 f4

# sudo tee is used to give root permission to write into f1 and f2 in single command
# -a: Append instead of overwrite.
# -i: Ignore interrupts.
echo "This is a random my world" | sudo tee -a f1 f2

#or also can use this command to give sudo permission
sudo sh -c 'echo "second method to write data" | tee f3 f4'



