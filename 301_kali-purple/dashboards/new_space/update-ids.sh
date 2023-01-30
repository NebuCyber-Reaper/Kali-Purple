#!/bin/bash

## Update the IDs of all dashboards and their references in weak links
## 
## Object ID's in Elastic must be unique, even across spaces.
## When copying object between spaces, elastic will automatically replace th ID's which will break weak links
## When copying dashboards between spaces, export, replace the ID's using this script, and import
##
## To obtain a list of the dashboard ID's. export the dashboards and run the following command:
## grep "dashboard" default-dashboards.ndjson | jq -r ".id" 
##
while IFS="" read -r p || [ -n "$p" ]
do
    sed -i "s/$p/kali-purple-$p/g" $2
done < $1
