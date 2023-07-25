#!/usr/bin/env bash
languages=$(echo "golang typescript dart rust flutter" | tr " " "\n")
core_utils=$(echo "find xargs cp mv rm sed tr" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

if [[ -z $selected ]]; then
    exit 0
fi

read -p "Come on give me the query: " query 

if echo "$languages" | grep -qs $selected; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi

