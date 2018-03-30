package models

import (
	"github.com/astaxie/beego/orm"
)
type Msgxx struct {
	id int `orm:"pk;auto"`
	name string `orm:"unique"`
	phone string
	email string
	content string
	//create_time time.Time `orm:"auto_now_add;type(datetime)"`
}

func addMsg(message *Msgxx) int64  {
	o :=orm.NewOrm()
	id,_ :=o.Insert(message)
	return id
}

