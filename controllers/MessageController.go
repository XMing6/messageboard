package controllers

import (
	"github.com/astaxie/beego"
	"messageboard/models"
	"fmt"
)

type MessageController struct {
	beego.Controller
}

func (this *MessageController) Add()  {
	user_name :=this.GetString("user_name")
	user_email :=this.GetString("user_email")
	user_phone :=this.GetString("user_phone")
	user_content :=this.GetString("user_message")

	message := new(models.Message)
	message.User_content =user_content
	message.User_name =user_name
	message.User_phone =user_phone
	message.User_email =user_email
	insertId := models.AddMessage(message);

	str := fmt.Sprintf("%d",insertId)

	this.Ctx.WriteString("insertId="+str);

}

func (this *MessageController) GetList()  {
	page_size,_ := this.GetInt("page_size")
	page_current,_ := this.GetInt("page_current")
	offset := (page_current-1)*page_size
	msg_list := models.GetMessage(page_size,offset)
	this.Data["json"] = msg_list
	this.ServeJSON()
}


func (this *MessageController) AddReply()  {
	Msg_id,_ := this.GetInt("Msg_id")
	msg_reply := this.GetString("msg_reply")

	msgObj := models.GetMessageById(Msg_id)
	msgObj.Msg_reply = msg_reply
	flag :=models.AddMsgReply(&msgObj);

	str := fmt.Sprintf("{'ret':%d}",flag)
	this.Ctx.WriteString(str);
}
