#!/bin/bash

DEFAULT_SOLR_URL="http://localhost:8983/solr/metastore"

if [[ -z $SOLR_URL ]]; then
	SOLR_URL="$DEFAULT_SOLR_URL/schema"
fi

if [[ $1 == '--help' || $1 == '-h' ]]; then
	echo 'Usage:'
	echo "SOLR_URL=http://<solr_host>:<solr_port>/solr/<solr_core>" "$0"
	echo
	echo 'Gets schema from Solr instance available on SOLR_URL.'
	echo "SOLR_URL defaults to $DEFAULT_SOLR_URL"
	exit 0
fi

curl -X GET $SOLR_URL"/schema"
