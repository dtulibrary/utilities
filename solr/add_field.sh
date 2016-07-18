#!/bin/bash

DEFAULT_SOLR_URL="http://localhost:8983/solr/metastore"

if [[ -z $SOLR_URL ]]; then
	SOLR_URL="$DEFAULT_SOLR_URL"
fi

if [[ -z $1 ]]; then
	echo 'Usage:'
	echo "SOLR_URL=http://<solr_host>:<solr_port>/solr/<solr_core>" "$0 <field_name>"
	echo
	echo 'Adds <field_name> to Solr instance available on SOLR_URL.'
	echo "SOLR_URL defaults to $DEFAULT_SOLR_URL"
	exit 0
fi

curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":{
     "name":"'$1'",
     "stored":true }
}' $SOLR_URL'/schema'
