#!/bin/bash
DEFAULT_SOLR_URL=http://localhost:8983/solr/metastore

if [ -z $1 ]; then
  echo 'Usage:'
  echo "  $0 <dedup-key>"
  echo
  echo '  Env:'
  echo '    SOLR_URL: URL of the Solr instance you want to delete from.'
  echo "              (defaults to: $DEFAULT_SOLR_URL)"
  exit
fi

if [ -z $SOLR_URL ]; then
  SOLR_URL=$DEFAULT_SOLR_URL
fi

XML="<delete><query>cluster_id_ss:$1</query></delete>"

echo $XML

curl "$SOLR_URL/update?commit=true" -H "Content-Type: text/xml" --data-binary $XML
