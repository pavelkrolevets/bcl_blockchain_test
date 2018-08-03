import requests
import json
import time
# import grequests
from concurrent.futures import ThreadPoolExecutor
from requests_futures.sessions import FuturesSession

def confirm(transaction):
    session = requests.Session()
    method = 'eth_getTransactionReceipt'
    params = [transaction]
    PAYLOAD = {"jsonrpc":"2.0",
               "method":method,
                "params":params,
                "id":1}
    PAYLOAD = json.dumps(PAYLOAD)
    headers = {'Content-type': 'application/json'}
    response = session.post('http://0.0.0.0:8545', data=PAYLOAD, headers=headers)
    print(json.loads(response.content)['result']['blockNumber'])

def check_txpool():
    session = requests.Session()
    method = 'txpool_status'
    PAYLOAD = {"jsonrpc":"2.0",
               "method":method,
                "id":1}
    PAYLOAD = json.dumps(PAYLOAD)
    headers = {'Content-type': 'application/json'}
    response = session.post('http://0.0.0.0:8545', data=PAYLOAD, headers=headers)
    txpool = json.loads(response.content)['result']['pending']
    txpool = int(txpool, 0)
    return txpool

session = requests.Session()
# session = FuturesSession(executor=ThreadPoolExecutor(max_workers=2))
method = 'eth_sendTransaction'
params = [{
  "from": "0xc29553e4d9b2d1ffde5d89763dcc6bfaa0e006c3",
  "to": "0x1fff0517d582296df96ee3f87e6ebde6272bfbf7",
  "gas": "0x76c0",
  "gasPrice": "0x9184e72a000",
  "value": "0x9184e72a",
  "data": "0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"
}]
PAYLOAD = {"jsonrpc": "2.0",
           "method": method,
            "params": params,
            "id":1}
PAYLOAD = json.dumps(PAYLOAD)
headers = {'Content-type': 'application/json'}

out = []
laps_time = 0
txpool_end = 0
trans_send = 0
start = time.time()
for i in range(0,100):
    txpool_start = check_txpool()
    #time.sleep(1)
    print('Batch #: ', i)
    for j in range(0,500):
        session.post('http://0.0.0.0:8545', data=PAYLOAD, headers=headers)
        # print('Transaction #: ', j,'  ', json.loads(response.content)['result'])
        # out.append(str(json.loads(response.content)['result']))
    end = time.time()
    laps_time = end - start
    check_again = check_txpool()
    txpool_end += txpool_start-check_again+500
    print('Tx Pool status: ', check_again, "Speed: ", txpool_end/laps_time,"tps", "time lapsed: ", laps_time)

# """Check if transactions in the block"""
# time.sleep(10)
# print("Number of transactions: ", len(out))
# for trans in out:
#     confirm(trans)
