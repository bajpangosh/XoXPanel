#!/bin/bash

EMAIL="xxxxxx"; \
KEY="xxxxxxx"; \
DOMAIN="xxxxx"; \
JUMP_START="false"; \
ALL="false"; \
WRK=$(curl -X POST "https://api.cloudflare.com/client/v4/zones/" \
    -H "X-Auth-Email: $EMAIL" \
    -H "X-Auth-Key: $KEY" \
    -H "Content-Type: application/json" \
    --data '{"name":"'"$DOMAIN"'","jump_start":'"$JUMP_START"'}' | jq -r '{"result"}[] | .[0] | .id')
 echo "Working? $WRK"

ZONEID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$DOMAIN&status=pending" \
  -H "X-Auth-Email: $EMAIL" \
  -H "X-Auth-Key: $KEY" \
  -H "Content-Type: application/json" | jq -r '{"result"}[] | .[0] | .id')
 echo "Zoneid is $ZONEID"

IP=$(curl -s -X GET https://checkip.amazonaws.com)

echo "Current IP is $IP"

EMAIL="$EMAIL"; \
KEY="$KEY"; \
ZONE_ID="$ZONEID"; \
TYPE="A"; \
NAME="$DOMAIN"; \
CONTENT="$IP"; \
PROXIED="true"; \
TTL="1"; \
LOVE=$(curl -X POST "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/" \
    -H "X-Auth-Email: $EMAIL" \
    -H "X-Auth-Key: $KEY" \
    -H "Content-Type: application/json" \
    --data '{"type":"'"$TYPE"'","name":"'"$NAME"'","content":"'"$CONTENT"'","proxied":'"$PROXIED"',"ttl":'"$TTL"'}' | jq -r '{"result"}[] | .[0] | .id')
