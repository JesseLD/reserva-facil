package routes

import (
	"github.com/JesseLD/reserva-facil/reservafacil_api/internal/middleware"
	"github.com/JesseLD/reserva-facil/reservafacil_api/internal/routes/user"
	"github.com/JesseLD/reserva-facil/reservafacil_api/pkg/response"
	"github.com/gin-gonic/gin"
)

func SetupRoutes(router *gin.Engine) {

	mainRoutes := router.Group("/")
	mainRoutes.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Welcome to the ReservaFacil API! Documentation is available at https://platform.reservafacil.site/docs/api-reference",
		})
	})

	router.Use(middleware.CheckAPIKey)

	user.SetupUserRoutes(router)

	router.NoRoute(func(c *gin.Context) { 
		response.SendResponse(c, "Not Found", 404, nil)
	 } )

}