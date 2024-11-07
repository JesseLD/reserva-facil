package routes

import (
	"github.com/JesseLD/reserva-facil/reservafacil_api/internal/middleware"
	"github.com/JesseLD/reserva-facil/reservafacil_api/internal/routes/user"
	"github.com/JesseLD/reserva-facil/reservafacil_api/pkg/response"
	"github.com/gin-gonic/gin"
)

func SetupRoutes(router *gin.Engine) {
	router.Use(middleware.CheckAPIKey)

	user.SetupUserRoutes(router)


	router.NoRoute(func(c *gin.Context) { 
		response.SendResponse(c, "Not Found", 404, nil)
	 } )

}