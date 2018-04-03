package models

import (
	"time"
	"github.com/astaxie/beego/orm"
)


//声明表字段
type Member struct {
	M_id int `orm:"pk;auto"`
	Name string
	Email string `orm:"index"`
	Password string `orm:"size(32)"`
	Create_time time.Time `orm:"auto_now_add;type(datetime)"`
}

//会员注册
func MemberAdd(mber *Member) int64  {
	o := orm.NewOrm()
	id,_ :=o.Insert(mber)
	return  id
}

//根据用户ID获取信息
func  MemberGetById(id int) Member {
	o :=orm.NewOrm()
	//mber := new(Member)
	var mber Member
	o.QueryTable(mber).Filter("M_id",id).One(&mber)
	return  mber
}

//根据邮箱和密码判断用户是否正确
func MemberLoginByEmailAndPwd( email string,password string) bool  {
	o :=orm.NewOrm()
	var mber Member
	err :=o.QueryTable(mber).Filter("Email",email).Filter("password",password).One(&mber)
	if(err == nil){
		return false
	}
	if mber.Name=="" {
		return false
	}
	return  false

}

