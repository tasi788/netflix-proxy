package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net"
	"net/http"
	"os"
	"text/template"
)

// RenderContext port content rendering to static html
type RenderContext struct {
	IP     string
	Action string
}

//
func handle(w http.ResponseWriter, req *http.Request) {
	file, err := ioutil.ReadFile("static/add.html")
	if err != nil {
		log.Panic(err)
	}
	html := string(file)

	templates := template.New("template")
	templates.New("render").Parse(html)

	// get ip
	ip, _, _ := net.SplitHostPort(req.RemoteAddr)

	context := RenderContext{
		IP:     ip,
		Action: "Add",
	}
	templates.Lookup("render").Execute(w, context)

}

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8000"
	}
	log.Println(fmt.Sprintf("Server on http://localhost:%s", port))

	http.HandleFunc("/add", handle)
	// http.Handle("/", http.StripPrefix("/", http.FileServer(http.Dir("static"))))
	http.Handle("/css/", http.StripPrefix("/css/", http.FileServer(http.Dir("static/css"))))

	http.ListenAndServe(fmt.Sprintf(":%s", port), nil)

}
