#web server cho phep truy nhap qua 2 port 80(http) vaf 443(https)

#lenh iptables chong DDOS

iptables -A INPUT -p tcp --dport 80 -m limit --limit 25/minute --limit-burst 100 -j ACCEPT

iptables -A INPUT -p tcp --dport 443 -m limit --limit 25/minute --limit-burst 100 -j ACCEPT

# IP dat 100 ket noi bat dau han che cho phep 25 ket noi trong 1 phut . nhieu hon se bi block
 
#lenh iptables cho phep nhung request tu gg bing facebook
iptables -N specialips
#ip cua Bing
iptables -A specialips -s 202.89.233.100 -j RETURN  
#ip cua gg
iptables -A specialips -s 8.8.8.8 -j RETURN
#ip cua facebook
iptables -A specialips -s 69.63.181.15 -j RETURN
iptables -A specialips -j DROP

