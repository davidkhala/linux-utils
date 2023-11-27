counter=0
echo wait until $@
while true; do
    if $@; then
        break
    else
        ((counter++))
        sleep 1
        echo ${counter} times retry
    fi

done
