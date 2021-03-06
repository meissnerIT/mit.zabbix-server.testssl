#!/usr/bin/env bash
#
# Distributed via ansible - mit.zabbix-server.testssl
#
# v2020-06-05-1

set -e

# Ensure exit-code 0 even if grep fails

# Result is in parentheses
# cat /tmp/testssl.sh-result-www.meissner.it \
/usr/local/share/testssl.sh/testssl.sh --vulnerable --color 0 --quiet $1 \
    | grep "(NOT ok)" || true

# Both results are in parentheses
/usr/local/share/testssl.sh/testssl.sh --protocols --color 0 --quiet $1 \
    | egrep "\((NOT ok|deprecated)\)" | paste -s -d, | xargs || true

