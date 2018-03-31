package models

import (
	"github.com/astaxie/beego/orm"
	"time"
	"github.com/astaxie/beego"
)

// 首字母大写是公有的，首字母小写是私有的
// 小写其它package无法引用

type Message struct {
	Msg_id int `orm:"pk;auto;column(id)"`
	User_name string `orm:"unique"`
	User_phone string
	User_email string
	User_content string
	Msg_reply string
	Create_time time.Time `orm:"auto_now_add;type(datetime)"`
	Date_time string `orm:"-"` //不用创建表字段
}


func AddMessage(message *Message) int64  {
	o :=orm.NewOrm()
	id,_ :=o.Insert(message)
	return id
}

func  GetMessage(limit int,offset int) []*Message  {
	o :=orm.NewOrm()
	var msg Message
	var msgs[] *Message
	o.QueryTable(msg).OrderBy("-create_time").Offset(offset).Limit(limit).All(&msgs)
	for key,value := range msgs {
		value.Date_time = beego.Date(value.Create_time,"Y-m-d H:i:s")
		msgs[key]=value
	}
	return msgs
}

func  GetMessageCount() int64  {
	o :=orm.NewOrm()
	var msg Message
	count,_ :=o.QueryTable(msg).Count()
	return count
}

func  GetMessageById(id int) Message  {
	 o := orm.NewOrm()
	 var msg Message
	 o.QueryTable(msg).Filter("Msg_id",id).One(&msg)
	 return  msg
}

func AddMsgReply(msgObj *Message) int64 {
	o := orm.NewOrm()
	if num, err := o.Update(msgObj); err == nil {
		return  num
	}
	return  0
}