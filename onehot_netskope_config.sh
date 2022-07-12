# tell Python clients to use the netskope certificate chain
export NETSKOPE_CA_CERT_BUNDLE=~/.config/netskope/cacert.pem
export REQUESTS_CA_BUNDLE=${NETSKOPE_CA_CERT_BUNDLE}
export HTTPLIB2_CA_CERTS=${NETSKOPE_CA_CERT_BUNDLE}
export NODE_EXTRA_CA_CERTS=${NETSKOPE_CA_CERT_BUNDLE}
export CURL_CA_BUNDLE=${NETSKOPE_CA_CERT_BUNDLE}

