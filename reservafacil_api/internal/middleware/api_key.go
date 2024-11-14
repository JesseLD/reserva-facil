package middleware

import (
	"github.com/JesseLD/reserva-facil/reservafacil_api/pkg/response"
	"github.com/gin-gonic/gin"
)

func CheckAPIKey(c *gin.Context) {
	// Check if the API key is valid
	key := "apikey"

	apiKey := c.GetHeader("Authorization")

	if apiKey != key {
		response.SendResponse(c, "Invalid API key", 401, nil)
		c.Abort()
		return
	}
	c.Next()

}
