package main

import (
    "fmt"
    "net/http"
)

func main() {
    http.HandleFunc("/", HelloWorldServer)
    http.ListenAndServe(":8080", nil)
}

func HelloWorldServer(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello %s!", r.URL.Path[1:])
}
