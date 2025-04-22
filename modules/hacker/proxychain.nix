{ config, pkgs, ... }:
{
{
  programs.proxychains = {
    enable = true;
    
    chain = {
      type = "dynamic";  # or "dynamic", "random" ,"strict"
    };
    # ✅ If you use random chaining
    # You must specify length if you use random as type, due to this assertion:
    # So for random
    # chain = {
    #   type = "random";
    #   length = 2;
    # };

    proxyDNS = true;
    quietMode = false;
    remoteDNSSubnet = 224;
    tcpReadTimeOut = 15000;
    tcpConnectTimeOut = 8000;
    localnet = "127.0.0.0/255.0.0.0";

    proxies = {
      myproxy = {
        enable = true;
        type = "socks5";  # or "socks4", "http"
        host = "127.0.0.1";
        port = 9050;
      };
    };
  };
}
}
# ✅ Resulting file
# The module will generate /etc/proxychains.conf like:

# strict_chain
# proxy_dns
# remote_dns_subnet 224
# tcp_read_time_out 15000
# tcp_connect_time_out 8000
# localnet 127.0.0.0/255.0.0.0
# [ProxyList]
# socks5 127.0.0.1 9050


# USAGE
# $ proxychains firefox
# $ proxychains tor
# $ proxychains discord
