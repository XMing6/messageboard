package controllers

import (
	"github.com/astaxie/beego"
	"messageboard/models"
	"strconv"
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
	user_id,_ :=c.GetSecureCookie(beego.AppConfig.String("cookiesecrt"),"user_id")
	var mber_info models.Member
	if(user_id!=""){
		id ,_:= strconv.Atoi(user_id)
		mber_info = models.MemberGetById(id)
	}
	c.Data["PageTitle"]="留言板首页"
	c.Data["msg_count"] = msg_count
	c.Data["mber_info"] = mber_info
	c.Layout="layout/layout.tpl"
	c.TplName="index.tpl"
}
