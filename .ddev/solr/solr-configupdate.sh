#!/usr/bin/env bash
set -e
# Ensure "gpe" core config is always up to date even after the
# core has been created. This does not execute the first time,
# when solr-precreate has not yet run.
CORENAME=gpe
if [ -d /var/solr/data/${CORENAME}/conf ]; then
    cp /solr-conf/conf/* /var/solr/data/${CORENAME}/conf
fi
