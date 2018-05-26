while ! grep "TokenException" output.txt > /dev/null
do
echo -e '\n'$(date +%x_%H:%M:%S:%3N) > output.txt
curl -s -H 'Host: flex-capacity-na.amazon.com' -H 'Cookie: session-token="'`cat /home/scripts/amazon/source/session-token.txt`'"' -H 'x-amz-access-token: '`cat /home/scripts/amazon/source/amazon-token.txt` -H 'x-flex-instance-id: '`cat /home/scripts/amazon/source/flex-id.txt` -H 'Accept: */*' -H 'User-Agent: iOS/10.2.1 (iPhone Darwin) Model/iPhone Platform/iPhone6,1 RabbitiOS/2.0.141' -H 'Accept-Language: en-us' --compressed 'https://flex-capacity-na.amazon.com/GetOffersForProvider?serviceAreaIds='`cat /home/scripts/amazon/source/location.txt` >> output.txt
if grep -q "OFFERED" output.txt; then
	cat output.txt >> foundblocks.txt
	./getlast.bat
	if [ ! -f pageflag.txt ]; then
 		echo /usr/bin/php flexalert.php
		echo "paged" > pageflag.txt
	fi
fi
done
 		echo /usr/bin/php flexover.php
