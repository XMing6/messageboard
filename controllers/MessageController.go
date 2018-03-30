package controllers

import (
	"github.com/astaxie/beego"
	"messageboard/models"
	"fmt"
)

type MessageController struct {
	beego.Controller
}

type xxx struct {
	id int
	name string
}
func (this *MessageController) Add()  {
	user_name :=this.GetString("user_name")
	user_email :=this.GetString("user_email")
	user_phone :=this.GetString("user_phone")
	user_content :=this.GetString("user_message")
	//
	//message :=models.Msg{1,user_name,user_phone,user_email,user_content}
	//

	message := new(models.Message)
	message.User_content =user_content
	message.User_name =user_name
	message.User_phone =user_phone
	message.User_email =user_email
	insertId := models.AddMessage(message);

	str := fmt.Sprintf("%d",insertId)

	this.Ctx.WriteString("insertId="+str);

}

func (c *MessageController) Test()  {
	c.Ctx.WriteString("test Hello world");
}

func (c *MessageController) pp()  {

	c.Ctx.WriteString("pp Hello world");
}
