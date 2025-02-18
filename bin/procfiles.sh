#1/bin/bash

PROCNAME=$1

if [ -z "${PROCNAME}" ]; then
    echo "Please set proc name!"
    exit 1
fi

PROCFILES=$(ps -C $1 -o pid=)

for proc in ${PROCFILES}; do
    echo $proc
    ls -l /proc/$proc/fd
done

