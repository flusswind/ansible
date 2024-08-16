#! /bin/bash

CheckPackage()
{
    package=$1;
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo "${package} is installed";
    elif [ -z "${check}" ] ; then
        echo "${package} is NOT installed";
        echo "Try to install ${package}";
        sudo Pacman -S ${package}
    fi;
}



# update system
#garuda-update

#check for gum & install
CheckPackage ansible

ansible-playbook --ask-become-pass -vv  ~/ansible/playbooks/gum.yml
ansible-playbook --ask-become-pass -vv  ~/ansible/playbooks/nano.yml





#install apps

#install dotfiles

