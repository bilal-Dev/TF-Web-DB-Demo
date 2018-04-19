#!/bin/bash

set -x

echo BEGIN
date '+%Y-%m-%d %H:%M:%S'

echo "Updating Packaages..."
sudo apt-get update

echo "Downloading go binary..."
sudo apt-get -y install golang-go

echo "Adding go to PATH..."
export PATH=$PATH:/usr/local/go/bin

echo "Copying go application source code..."
cat > /tmp/app.go <<EOL
package main
import (
    "fmt"
    "net/http"
    "os"
)
func handler(w http.ResponseWriter, r *http.Request) {
    h, _ := os.Hostname()
    fmt.Fprintf(w, "Hi there, I'm served from %s!", h)
}

func main() {
    http.HandleFunc("/", handler)
    http.ListenAndServe(":8085", nil)
}
EOL

chmod 755 /tmp/app.go

echo "Starting go application..."
nohup go run /tmp/app.go > foo.out 2> foo.err < /dev/null &
sleep 1
curl localhost:8085

exit 0
