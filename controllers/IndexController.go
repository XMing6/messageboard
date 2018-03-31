package controllers

import (
	"github.com/astaxie/beego"
	"messageboard/models"
)

type Msg struct {
	id int `orm:"pk;auto"`
	name string `orm:"unique"`
	phone string
	email string
	content string
	//create_time time.Time `orm:"auto_now_add;type(datetime)"`
}
type IndexControoler struct {
	beego.Controller
}

func  (c *IndexControoler) Index()  {
	msg_count :=models.GetMessageCount()
	c.Data["PageTitle"]="留言板首页"
	c.Data["msg_count"] = msg_count
	c.Layout="layout/layout.tpl"
	c.TplName="index.tpl"
}
