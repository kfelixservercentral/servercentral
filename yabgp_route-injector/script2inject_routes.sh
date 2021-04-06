#!/bin/bash


FILE=ipv4.txt



# bgp yabgp instances

PEER1=10.10.10.111
PEER2=10.10.11.111

IPV4=$(cat $FILE)

  for LINE in $IPV4

	 do
	          echo $LINE 
		 curl -X POST -H "Content-Type: application/json" -d '{ "attr": { "1": 0, "2": 5706, "3": "192.0.2.1", "5": 999, "8": ["5706:666", "5706:999"], "14": { "nlri": $LINE }, } }'   http://$PEER1/v1/PEER/$PEER1/send/update




		 curl -X POST -H "Content-Type: application/json" -d '{ "attr": { "1": 0, "2": 5706, "3": "192.0.2.1", "5": 999, "8": ["5706:666", "5706:999"], "14": { "nlri": $LINE }, } }'   http://$PEER2/v1/PEER/$PEER2/send/update  


         done



