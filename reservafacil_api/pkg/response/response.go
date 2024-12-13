package response

import "github.com/gin-gonic/gin"

type Response struct {
	HttpCode int         `json:"http_code"`
	Message  string      `json:"message"`
	Success  bool        `json:"success"`
	Data     interface{} `json:"data"`
}

func SendResponse(c *gin.Context, message string, httpCode int, data interface{}) {

	response := Response{
		HttpCode: httpCode,
		Success:  true,
		Message:  message,
		Data:     data,
	}

	if response.HttpCode >= 400 {
		response.Success = false
	}

	c.JSON(response.HttpCode, response)
}
