cd /home/scripts/amazon/source/
rm -f ../1/pageflag.txt
cd /home/scripts/amazon/1
echo "" > output.txt
./checkblocks.bat & echo $! > check.pid
