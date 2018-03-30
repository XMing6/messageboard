package models

import (
	"github.com/astaxie/beego/orm"
	"time"
)

// 首字母大写是公有的，首字母小写是私有的
// 小写其它package无法引用

type Message struct {
	User_id int `orm:"pk;auto"`
	User_name string `orm:"unique"`
	User_phone string
	User_email string
	User_content string
	Create_time time.Time `orm:"auto_now_add;type(datetime)"`
}

func AddMessage(message *Message) int64  {
	o :=orm.NewOrm()
	id,_ :=o.Insert(message)
	return id
}

