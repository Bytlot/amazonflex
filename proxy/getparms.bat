cd /home/proxy
tail -1 proxy.out > proxy.last
if grep --quiet GetOffersForProvider proxy.last; then
cat proxy.last | sed s/.*session-token=// | cut -f2 -d\" > session-token.txt
cat proxy.last | sed s/.*x-amz-access-token// | cut -f2 -d: | cut -f1 -d, > amazon-token.txt
cat proxy.last | sed s/.*x-flex-instance-id// | cut -f2 -d: | cut -f1 -d, > flex-id.txt
rsync -az  /home/proxy/*.txt /home/scripts/amazon/source/
fi
