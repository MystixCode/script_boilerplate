#!/bin/bash

#colors
bold=`echo -en "\e[1m"`
underline=`echo -en "\e[4m"`
dim=`echo -en "\e[2m"`
strickthrough=`echo -en "\e[9m"`
blink=`echo -en "\e[5m"`
reverse=`echo -en "\e[7m"`
hidden=`echo -en "\e[8m"`
normal=`echo -en "\e[0m"`
black=`echo -en "\e[30m"`
red=`echo -en "\e[31m"`
green=`echo -en "\e[32m"`
orange=`echo -en "\e[33m"`
blue=`echo -en "\e[34m"`
purple=`echo -en "\e[35m"`
aqua=`echo -en "\e[36m"`
gray=`echo -en "\e[37m"`
darkgray=`echo -en "\e[90m"`
lightred=`echo -en "\e[91m"`
lightgreen=`echo -en "\e[92m"`
lightyellow=`echo -en "\e[93m"`
lightblue=`echo -en "\e[94m"`
lightpurple=`echo -en "\e[95m"`
lightaqua=`echo -en "\e[96m"`
white=`echo -en "\e[97m"`
default=`echo -en "\e[39m"`
BLACK=`echo -en "\e[40m"`
RED=`echo -en "\e[41m"`
GREEN=`echo -en "\e[42m"`
ORANGE=`echo -en "\e[43m"`
BLUE=`echo -en "\e[44m"`
PURPLE=`echo -en "\e[45m"`
AQUA=`echo -en "\e[46m"`
GRAY=`echo -en "\e[47m"`
DARKGRAY=`echo -en "\e[100m"`
LIGHTRED=`echo -en "\e[101m"`
LIGHTGREEN=`echo -en "\e[102m"`
LIGHTYELLOW=`echo -en "\e[103m"`
LIGHTBLUE=`echo -en "\e[104m"`
LIGHTPURPLE=`echo -en "\e[105m"`
LIGHTAQUA=`echo -en "\e[106m"`
WHITE=`echo -en "\e[107m"`
DEFAULT=`echo -en "\e[49m"`

helpmenu(){
    echo "${purple}Usage:$normal ./script_boilerplate <option>"
    echo ""
    echo "-h        --help                    Display Help."
    echo "-v        --verbose                 Verbose mode (-vv for more)."
    echo "-V        --version                 Show version."
    echo ""
    exit
}

very_verbose=false
verbose=false

if [[ " $# " -ne 0 ]]; then
    for i in $@
    do
        if [[ ${i} = "-h" || ${i} = "--help" ]]; then
            helpmenu
        elif [[ ${i} = "-v" || ${i} = "--verbose" ]]; then
            verbose=true
        elif [[ ${i} = "-vv" ]]; then
            very_verbose=true
        elif [[ ${i} = "-V" || ${i} = "--version" ]]; then
            echo "script_boilerplate version 1.1.2"
            exit
        else
            echo "${red}Error:$normal invalid argument: ${i}"
            helpmenu
            exit
        fi
    done
# else
#     echo "no args/flags provided"
fi

if ${very_verbose} || ${verbose} ; then
echo "${lightblue}*********************************************$normal"
echo "${lightblue}            script_boilerplate.sh            $normal"
echo "${lightblue}*********************************************$normal"
fi

mystix_exec(){
    text=$1
    anim="& while [ \$(ps a | awk '{print \$1}' | grep \$!) ] ; do for X in '-' '/' '|' '\'; do echo -en \"\b\$X\"; sleep 0.1; done; done; echo -en '\b '"
    shift
    for i in "$@";
    do
        if ${very_verbose} || ${verbose} ; then
            echo -n "${purple}$text.. $normal"
            if ${very_verbose} ; then
                echo
                cmd="$i"
            elif ${verbose} ; then
                cmd="$i > /dev/null 2>&1 $anim"
            fi
        else
            cmd="$i > /dev/null 2>&1"
        fi
        eval $cmd
        if ${very_verbose} || ${verbose} ; then
            echo "${green}[done]$normal"
        fi
    done
}

mystix_exec "Just sleep for testing" \
            "sleep 2 && echo 'sleep 2s'"
mystix_exec "Just sleep commands for testing" \
            "sleep 2 && echo 'sleep 2s'" \
            "sleep 2 && echo 'sleep 2s'"
