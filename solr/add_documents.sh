#!/bin/bash

DEFAULT_SOLR_URL="http://localhost:8983/solr/metastore"

if [[ -z $SOLR_URL ]]; then
	SOLR_URL="$DEFAULT_SOLR_URL"
fi

if [[ -z $1 ]]; then
	echo 'Usage:'
	echo "SOLR_URL=http://<solr_host>:<solr_port>/solr/<solr_core>" "$0 <json_file>"
	echo
	echo 'Adds the test documents in <json_file> to Solr instance available on SOLR_URL.'
	echo "SOLR_URL defaults to $DEFAULT_SOLR_URL"
	echo
	echo 'See test_documents.json for example documents.'
	exit 0
fi

curl -X POST -H 'Content-Type: application/json' --data-binary '@'"$1" $SOLR_URL'/update?versions=true&commit=true'
