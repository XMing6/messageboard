package routers

import (
	"messageboard/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.IndexControoler{},"GET:Index")
    beego.AutoRouter(&controllers.MessageController{})
}
