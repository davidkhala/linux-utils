counter=0
while true; do
    if $@; then
        exit 0
    else
        ((counter++))
        sleep 1
        echo ${counter} times retry
    fi

done
