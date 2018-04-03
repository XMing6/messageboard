package controllers

import "github.com/astaxie/beego"

type MemberController struct {
	beego.Controller
}

func login(this *MemberController)  {

	this.Layout="layout/layout"
	this.TplName="login"
}
