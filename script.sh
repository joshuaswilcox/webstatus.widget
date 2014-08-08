if http --check-status --ignore-stdin --timeout=2.5 HEAD ahealthybalanceinc.com &> /dev/null; then
    echo 'OK!'
else
    echo "ERROR!"
fi
