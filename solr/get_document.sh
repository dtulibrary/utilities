#!/bin/bash

DEFAULT_SOLR_URL="http://localhost:8983/solr/metastore"

if [[ -z $SOLR_URL ]]; then
	SOLR_URL="$DEFAULT_SOLR_URL"
fi

if [[ -z $1 ]]; then
	echo 'Usage:'
	echo "SOLR_URL=http://<solr_host>:<solr_port>/solr/<solr_core>" "$0 <solr_id>"
	echo
	echo 'Gets document where id=<solr_id> from Solr instance available on SOLR_URL.'
	echo "SOLR_URL defaults to $DEFAULT_SOLR_URL"
	exit 0
fi

curl $SOLR_URL'/query?q=id:'$1
