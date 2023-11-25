package main

import (
	"net"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.New()
	router.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{"msg": "Hello World"})
	})
	listen, err := net.Listen("tcp", ":3000")
	if err != nil {
		panic(err)
	}
	err = router.RunListener(listen)
	if err != nil {
		panic(err)
	}
}
