package main

import (
	_ "messageboard/routers"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"messageboard/models"
	_ "github.com/Go-SQL-Driver/MySQL"
)

func main() {
	beego.Run()
}

//注册DB
func  init()  {
	orm.RegisterDataBase("default", "mysql", beego.AppConfig.String("mysqluser")+":"+ beego.AppConfig.String("mysqlpass")+"@tcp(127.0.0.1:3306)/"+beego.AppConfig.String("mysqldb")+"?charset=utf8", 30)

	orm.RegisterModel(new(models.Message))
	orm.RunSyncdb("default",false,true)
}