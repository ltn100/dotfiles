#!/bin/sh

black() { echo -n "%{$FG[000]%}" }
red() { echo -n "%{$FG[001]%}" }
green() { echo -n "%{$FG[002]%}" }
yellow() { echo -n "%{$FG[003]%}" }
blue() { echo -n "%{$FG[004]%}" }
magenta() { echo -n "%{$FG[005]%}" }
cyan() { echo -n "%{$FG[006]%}" }
lightgrey() { echo -n "%{$FG[007]%}" }
darkgrey() { echo -n "%{$FG[008]%}" }
lightred() { echo -n "%{$FG[009]%}" }
lightgreen() { echo -n "%{$FG[010]%}" }
lightyellow() { echo -n "%{$FG[011]%}" }
lightblue() { echo -n "%{$FG[012]%}" }
lightmagenta() { echo -n "%{$FG[013]%}" }
lightcyan() { echo -n "%{$FG[014]%}" }
white() { echo -n "%{$FG[015]%}" }

info1() { echo -n "$(green)" }
info2() { echo -n "$(lightblue)" }
info3() { echo -n "$(lightmagenta)" }
bright() { echo -n "$(white)" }
error() { echo -n "$(lightred)" }
warning() { echo -n "$(yellow)" }
dim3() { echo -n "$(darkgrey)" }

pencil() { echo -n '\xe2\x9c\x8e' }
tick() { echo -n '\xe2\x9c\x94' }
uparrow() { echo -n '\xe2\x96\xb4' }
downarrow() { echo -n '\xe2\x96\xbe' }
hourglass() { echo -n '\xe2\xa7\x97' }

user() { echo -n "$(info1)%n%{$reset_color%}" }
hostname() { echo -n "$(bright)%m%{$reset_color%}" }
workingdir() { echo -n "$(info2)%~%{$reset_color%}" }

_count_lines() {
    count=0
    while read -r line; do (( count++ )); done
    echo ${count}
}

smiley() {
    echo -n "%(?."
    echo -n "%B$(green)\$:)%{$reset_color%}%b"
    echo -n "."
    echo -n "%B$(red)\$:(%{$reset_color%}%b"
    echo -n ")"
}

_git_status() {
    command git status --porcelain -b --ignore-submodules=dirty 2>/dev/null
}
_git_revparse() {
    command git rev-parse --show-cdup --verify --short HEAD --show-toplevel 2>/dev/null
}
git_staged() {
    git_status="${1}"
    echo -n "${git_status}" | command grep '^[MADRC] ' | _count_lines
}
git_changed() {
    git_status="${1}"
    echo -n "${git_status}" | command grep '^ [MD]' | _count_lines
}
git_unmerged() {
    git_status="${1}"
    echo -n "${git_status}" | command grep '^DD\|^AU\|^UD\|^UA\|^DU\|^AA\|^UU' | _count_lines
}
git_untracked() {
    git_status="${1}"
    echo -n "${git_status}" | command grep '^[?][?]' | _count_lines
}
_parse_git_branch() {
    # Possible strings:
    # - simple: "## dev"
    # - detached: "## HEAD (no branch)"
    # - ahead/behind: "## master...origin/master [ahead 1, behind 2]"
    #
    # Ahead/behind format:
    # - [ahead 1]
    # - [behind 1]
    # - [ahead 1, behind 1]
    git_status="${1}"
    echo "${git_status}" | command grep '^##' | head -n1 | command sed -n 's@^## \([[:alnum:]_/()-]*\).*@\1@p'
    echo "${git_status}" | command grep '^##' | head -n1 | command sed -n 's@^## .*\.\.\.\([[:alnum:]_/()-]*\).*@\1@p'
    echo "${git_status}" | command grep '^##' | head -n1 | command sed -n 's@^## .*\[.*ahead \([[:digit:]]*\).*@\1@p'
    echo "${git_status}" | command grep '^##' | head -n1 | command sed -n 's@^## .*\[.*behind \([[:digit:]]*\).*@\1@p'
}
git_branch() {
    git_status="${1}"
    echo -n "${git_status}" | command grep '^##'
}
git_relative_root() {
    git_revparse="${1}"
    echo -n "${git_revparse}" | command sed -n '1 p'
}
git_toplevel_dir() {
    git_revparse="${1}"
    echo -n "${git_revparse}" | command sed -n '2 p'
}
git_hash() {
    git_revparse="${1}"
    echo -n "${git_revparse}" | command sed -n '3 p'
}
git_last_fetched_mins() {
    git_revparse="${1}"
    toplevel_dir="$(git_toplevel_dir ${git_revparse})"
    fetch_file="${toplevel_dir}/.git/FETCH_HEAD"
    if [ ! -f "${fetch_file}" ]
    then
        fetch_file="${toplevel_dir}/.git/HEAD"
    fi
    if [ ! -f "${fetch_file}" ]
    then
        echo -n 0
        exit
    fi

    echo $(( $(file_age ${fetch_file}) / 60 ))
}
file_age() {
    if [[ $OSTYPE == darwin* ]]
    then
        # OSX
        echo $(($(date +%s) - $(stat -t %s -f %m -- "${1}")))
    else
        # Linux
        echo $(($(date +%s) - $(date +%s -r "${1}")))
    fi
}
wrapped_warning() {
    prefix=${1}
    value=${2}
    limit=${3}
    if [ "${value}" -gt "${limit}" ]
    then
        echo -n "$(warning)"
    else
        echo -n "$(dim3)"
    fi
    echo -n "${prefix}${value}%{$reset_color%}"
}
git_status() {
    git_status="$(_git_status)"
    if [ $? -ne 0 ]
    then
        # Not a git repo, or git not installed
        exit
    fi

    git_revparse="$(_git_revparse)"

    IFS=$'\n' branch_parts=("${(@f)$(_parse_git_branch ${git_status})}")

    branch="${branch_parts[1]}"
    remote_branch="${branch_parts[2]}"
    ahead="${branch_parts[3]:-0}"
    behind="${branch_parts[4]:-0}"
    staged="$(git_staged ${git_status})"
    changed="$(git_changed ${git_status})"
    unmerged="$(git_unmerged ${git_status})"
    untracked="$(git_untracked ${git_status})"

    hash="$(git_hash ${git_revparse})"
    last_fetched_mins="$(git_last_fetched_mins ${git_revparse})"

    echo -n " "

    if [ $((staged + changed + unmerged)) -gt 0 ]
    then
        # dirty
        echo -n "$(error)"
    elif [ $((ahead + behind)) -gt 0 ]
    then
        # ahead/behind
        echo -n "$(warning)"
    else
        # clean
        echo -n "$(info1)"
    fi
    echo -n "(${branch})%{$reset_color%} "

    echo -n "$(dim3)[%{$reset_color%}"

    echo -n $(wrapped_warning "$(hourglass) " ${last_fetched_mins} 60)
    echo -n $(wrapped_warning " $(downarrow)" ${behind} 0)
    echo -n "$(dim3) ${hash}%{$reset_color%}"
    echo -n $(wrapped_warning " $(uparrow)" ${ahead} 0)
    echo -n $(wrapped_warning " $(tick) " ${staged} 0)
    echo -n $(wrapped_warning " $(pencil) " ${changed} 0)
    echo -n $(wrapped_warning " ?" ${untracked} 0)

    echo -n "$(dim3)]%{$reset_color%}"
}
path_warning() {
    if [ "$(realpath $(pwd))" != "$(pwd)" ]
    then
        echo -n " $(warning)(!)%{$reset_color%}"
    fi
}

NEWLINE=$'\n'
PROMPT='$(user)@$(hostname) $(workingdir)$(path_warning)$(git_status)${NEWLINE}$(smiley) '
