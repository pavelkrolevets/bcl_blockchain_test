package main

import (
	"fmt"
	"log"
	"time"

	"github.com/onrik/ethrpc"
)

func send_trans() {
	client := ethrpc.New("http://127.0.0.1:8545")
	version, err := client.Web3ClientVersion()
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(version)

	start := time.Now()
	for i := 0; i < 10000; i++ {
		// Send  eth
		txid, err := client.EthSendTransaction(ethrpc.T{
			From:  "0xc29553e4d9b2d1ffde5d89763dcc6bfaa0e006c3",
			To:    "0xd08a05283ad35600ab448c08db31a7c3797c8319",
			Value: ethrpc.Eth1(),
		})

		if err != nil {
			fmt.Println(err)
		}
		t := time.Now()
		elapsed := t.Sub(start)
		fmt.Println(i, elapsed, txid)
	}
}

func myFunc() {
	// Doing something concurrently
	for i := 0; i < 10; i++ {
		// time.Sleep(time.Millisecond * 100)
		fmt.Println(i)
	}
}

func main() {
	// go myFunc()
	go send_trans()
	var input string
	fmt.Scanln(&input)

}
