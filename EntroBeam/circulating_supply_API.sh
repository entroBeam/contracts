#!/bin/bash
#!/usr/local/bin/perl
			
while true 
			
do
			
echo "read Binance EndPoint 1"
curl -X POST --data '{"jsonrpc":"2.0","method":"eth_call","params":[{"to": "0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1", "data":"0x70a08231000000000000000000000000DF7F1af35e682c4eFAd40e97C9E370137DD471a1"}, "latest"],"id":67}' -H "Content-Type: application/json" https://bsc-dataseed.binance.org/ | jq --raw-output '.result' > EIX_circulating_supply.txt
perl -Mbigint -lpi -e 's{\b0x[\da-f]+\b}{(1000000000000000000000000000-hex($&))/1000000000000000000}gie' EIX_circulating_supply.txt
sleep 60
			
echo "read Binance EndPoint 2"
curl -X POST --data '{"jsonrpc":"2.0","method":"eth_call","params":[{"to": "0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1", "data":"0x70a08231000000000000000000000000DF7F1af35e682c4eFAd40e97C9E370137DD471a1"}, "latest"],"id":67}' -H "Content-Type: application/json" https://bsc-dataseed1.defibit.io/ | jq --raw-output '.result' > EIX_circulating_supply.txt
perl -Mbigint -lpi -e 's{\b0x[\da-f]+\b}{(1000000000000000000000000000-hex($&))/1000000000000000000}gie' EIX_circulating_supply.txt
sleep 60
			
echo "read Binance EndPoint 3"
curl -X POST --data '{"jsonrpc":"2.0","method":"eth_call","params":[{"to": "0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1", "data":"0x70a08231000000000000000000000000DF7F1af35e682c4eFAd40e97C9E370137DD471a1"}, "latest"],"id":67}' -H "Content-Type: application/json" https://bsc-dataseed1.ninicoin.io/ | jq --raw-output '.result' > EIX_circulating_supply.txt
perl -Mbigint -lpi -e 's{\b0x[\da-f]+\b}{(1000000000000000000000000000-hex($&))/1000000000000000000}gie' EIX_circulating_supply.txt
sleep 60
			
echo "read Binance EndPoint 4"
curl -X POST --data '{"jsonrpc":"2.0","method":"eth_call","params":[{"to": "0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1", "data":"0x70a08231000000000000000000000000DF7F1af35e682c4eFAd40e97C9E370137DD471a1"}, "latest"],"id":67}' -H "Content-Type: application/json" https://bsc-dataseed2.defibit.io/ | jq --raw-output '.result' > EIX_circulating_supply.txt
perl -Mbigint -lpi -e 's{\b0x[\da-f]+\b}{(1000000000000000000000000000-hex($&))/1000000000000000000}gie' EIX_circulating_supply.txt
sleep 60
			
echo "read Binance EndPoint 5"
curl -X POST --data '{"jsonrpc":"2.0","method":"eth_call","params":[{"to": "0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1", "data":"0x70a08231000000000000000000000000DF7F1af35e682c4eFAd40e97C9E370137DD471a1"}, "latest"],"id":67}' -H "Content-Type: application/json" https://bsc-dataseed3.defibit.io/ | jq --raw-output '.result' > EIX_circulating_supply.txt
perl -Mbigint -lpi -e 's{\b0x[\da-f]+\b}{(1000000000000000000000000000-hex($&))/1000000000000000000}gie' EIX_circulating_supply.txt
sleep 60
			
done