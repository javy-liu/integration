#!/bin/bash

sed -i 's/^\(nexus-webapp-context-path\)=\S*/\1=\'$NEXUS_WEB_CONTEXT'/' /usr/local/nexus/conf/nexus.properties

/usr/local/nexus/bin/nexus console