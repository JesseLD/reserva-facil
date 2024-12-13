package main

import (
	// "log"
	// "os"

	"github.com/JesseLD/reserva-facil/reservafacil_api/internal/routes"
	"github.com/gin-gonic/gin"
	// "github.com/joho/godotenv"
)

func main() {

	// // Loading environment variables
	// err := godotenv.Load()
	// if err != nil {
	// 		log.Fatal("Error loading .env file")
	// }

	// ginMode := os.Getenv("GIN_MODE") // Getting the GIN_MODE environment variable
	// if ginMode == "" {
	// 		ginMode = gin.DebugMode
	// }
	// gin.SetMode(ginMode)

	// log.Println("Gin Mode:", gin.Mode())

	router := gin.Default()

	routes.SetupRoutes(router)

	router.Run(":8080")

}
