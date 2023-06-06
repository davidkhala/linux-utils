counter=0
echo wait until $@
while true; do
    if $@; then
        break;
    else
        counter=counter+1
        sleep 1
        echo ${counter} times retry
    fi

done
