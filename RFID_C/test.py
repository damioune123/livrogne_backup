
import kerberos
import requests
from requests_kerberos import HTTPKerberosAuth, OPTIONAL

__,krb_context = kerberos.authGSSClientInit("HTTP/livrogne@IOT_IPL_UNIX")

kerberos.authGSSClientStep(krb_context, "")

negotiate_details = kerberos.authGSSClientResponse(krb_context)

headers = {"Authorization": "Negotiate " + negotiate_details}

url = "http://livrogne"

r = requests.get(url, headers=headers, verify=False)


