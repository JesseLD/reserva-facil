package controller

import (
	"github.com/JesseLD/reserva-facil/reservafacil_api/internal/model"
	"github.com/JesseLD/reserva-facil/reservafacil_api/pkg/response"
	"github.com/gin-gonic/gin"
)

var users = []model.User{

	{
		ID:       1,
		Username: "John Doe",
		Email:    "john1@mail.com",
	},
	{
		ID:       2,
		Username: "John Doe 2",
		Email:    "john2@mail.com",
	},
	{
		ID:       3,
		Username: "John Doe 3",
		Email:    "john3@mail.com",
	},
	{
		ID:       4,
		Username: "John Doe 4",
		Email:    "john4@mail.com",
	},
	{
		ID:       5,
		Username: "John Doe 5",
		Email:    "john5@mail.com",
	},
}

func GetUser(c *gin.Context, id int) {

	if id > len(users) || id < 1 {
		response.SendResponse(c, "User not found", 404, nil)
		return
	}
	user := users[id-1]

	response.SendResponse(c, "Getting User", 200, user)
}
func GetUsers(c *gin.Context) {

	response.SendResponse(c, "Getting Users", 200, users)
}

func CreateUser(c *gin.Context) {

	var user model.User

	// Check if the request body is valid
	if err := c.ShouldBindJSON(&user); err != nil {
		response.SendResponse(c, "Invalid request body", 400, nil)
		return
	}

	users = append(users, user)

	response.SendResponse(c, "User created", 201, user)
}

func UpdateUser(c *gin.Context, id int) {

	var user model.User

	// Check if the request body is valid
	if err := c.ShouldBindJSON(&user); err != nil {
		response.SendResponse(c, "Invalid request body", 400, nil)
		return
	}

	if id > len(users) || id < 1 {
		response.SendResponse(c, "User not found", 404, nil)
		return
	}

	users[id-1] = user

	response.SendResponse(c, "User updated", 200, user)

}

func DeleteUser(c *gin.Context, id int) {

	if id > len(users) || id < 1 {
		response.SendResponse(c, "User not found", 404, nil)
		return
	}

	users = append(users[:id-1], users[id:]...)

	response.SendResponse(c, "User deleted", 200, nil)
}
