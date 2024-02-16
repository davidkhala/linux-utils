counter=0
echo wait until $@
while true; do
    $@ && rc=$? || rc=$?
    if [ "0" -eq "$rc" ] ; then
        break
    else
        counter=$((counter+1))
        sleep 1
        echo ${counter} times retry
    fi

done
