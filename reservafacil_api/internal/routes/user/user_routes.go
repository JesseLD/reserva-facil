package user

import (
	"strconv"

	"github.com/JesseLD/reserva-facil/reservafacil_api/internal/controller"
	"github.com/JesseLD/reserva-facil/reservafacil_api/pkg/response"
	"github.com/gin-gonic/gin"
)

func SetupUserRoutes(router *gin.Engine) {
	userRoutes := router.Group("/user")
	userRoutes.GET("/", controller.GetUsers)
	userRoutes.GET("/:id", func(ctx *gin.Context) {
		id := ctx.Param("id")
		userID, err := strconv.Atoi(id)
		if err != nil {
			response.SendResponse(ctx, "Invalid ID", 400, nil)
		}
		controller.GetUser(ctx, userID)
	})
	userRoutes.POST("/create", controller.CreateUser)
	userRoutes.PUT("/update/:id", func(ctx *gin.Context) {
		id := ctx.Param("id")
		userID, err := strconv.Atoi(id)
		if err != nil {
			response.SendResponse(ctx, "Invalid ID", 400, nil)
		}
		controller.UpdateUser(ctx, userID)
	})
	userRoutes.DELETE("/delete/:id", func(ctx *gin.Context) {
		id := ctx.Param("id")
		userID, err := strconv.Atoi(id)
		if err != nil {
			response.SendResponse(ctx, "Invalid ID", 400, nil)
		}
		controller.DeleteUser(ctx, userID)
	})

}
