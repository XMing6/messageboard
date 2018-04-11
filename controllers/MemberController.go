package controllers

import (
	"github.com/astaxie/beego"
	"messageboard/models"
	"crypto/md5"
	"encoding/hex"
	"strconv"
)

type MemberController struct {
	beego.Controller
}

//登陆页面
func (this *MemberController) Login()  {

	this.Layout="layout/layout.tpl"
	this.TplName="member/login.tpl"
}

//异步登陆
func (this *MemberController) AjaxLogin()  {
	email := this.GetString("email")
	password := this.GetString("password")

	//返回json数据
	md5obj := md5.New()
	md5obj.Write([]byte(password))
	password_md5 := hex.EncodeToString(md5obj.Sum(nil))

	//执行用户校验
	mber_info,result := models.MemberLoginByEmailAndPwd(email,password_md5)

	//string(int) 不能用于int， 返回"" 值

	//写入登陆cookies
	this.Ctx.SetCookie("user_name",mber_info.Name);
	this.SetSecureCookie(beego.AppConfig.String("cookiesecrt"),"user_id",strconv.Itoa(mber_info.M_id));

	//返回json数据
	jsonMap :=map[string] bool{"ret":result}
	this.Data["json"]=jsonMap
	this.ServeJSON()
}

//注册页面
func  (this *MemberController) Register()  {
	this.Layout="layout/layout.tpl"
	this.TplName="member/register.tpl"
}

//异步注册实现
func  (this *MemberController) AjaxRegister()  {
	nickname := this.GetString("name")
	email := this.GetString("email")
	password := this.GetString("password")

	//密码进行md5加密
	md5obj := md5.New()
	md5obj.Write([]byte(password))
	password_md5 := hex.EncodeToString(md5obj.Sum(nil))

	mber := new(models.Member)
	mber.Name= nickname
	mber.Email = email
	mber.Password = password_md5
	insertId := models.MemberAdd(mber)

	//返回json数据
	result := map[string] int64 {"ret":insertId}
	this.Data["json"] = result
	this.ServeJSON();

}