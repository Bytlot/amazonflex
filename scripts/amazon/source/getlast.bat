tail -1 foundblocks.txt | jq '.offerList' | grep "offerId" | cut -f4 -d\" > lastoffer.txt
while read p; do
curl -s -H 'Host: flex-capacity-na.amazon.com' -H 'Cookie: session-token="'`cat /home/scripts/amazon/source/session-token.txt`'"' -H 'x-amz-access-token: '`cat /home/scripts/amazon/source/amazon-token.txt` -H 'x-flex-instance-id: '`cat /home/scripts/amazon/source/flex-id.txt` -H 'Accept: */*' -H 'User-Agent: iOS/10.2.1 (iPhone Darwin) Model/iPhone Platform/iPhone6,1 RabbitiOS/2.0.141' -H 'Accept-Language: en-us' --compressed -H 'Content-Type: application/json' --data-binary '{"offerId":"'`echo -e $p | tr -d "\n"`'"}' 'https://flex-capacity-na.amazon.com/AcceptOffer' >> getlast.txt 
done < lastoffer.txt
