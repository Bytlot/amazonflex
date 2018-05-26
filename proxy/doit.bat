killall screen
screen -d -m mitmdump -p 8080 --keepserving --ignore '^(?!flex-capacity-na\.amazon\.com)' -w /home/proxy/proxy.out
