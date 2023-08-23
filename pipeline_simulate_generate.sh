#!/bin/bash
# Generate a Dev Tools _simulate POST request including pipeline.json to avoid the files falling out of sync.
# Also calls directly to _simulate rather than referencing the existing pipeline to avoid further confusion.

! which jq >/dev/null 2>&1 && { echo "Need 'jq' installed" ; exit 1 ;}
echo 'POST _ingest/pipeline/_simulate'
jq --argjson pipeline "$(<pipeline.json)" '.pipeline += $pipeline' pipeline_simulate_template.json
