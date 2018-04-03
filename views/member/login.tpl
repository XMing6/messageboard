<div class="row align-items-center justify-content-center">

    <div class="col-xs-12 col-sm-6 col-md-4 col-lg- 4 align-self-center">
        <div class="card">
            <div class="card-body">
                <h3 class="card-title text-center mb-4">登陆</h3>
                <form   id="form1" method="post">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-sm-12 align-self-center">
                            <div class="form-group">
                                <div class="input-group default-input-group">
                                    <input type="email" name="email" class="form-control" placeholder="Email address" required="required">
                                    <span class="input-group-addon"><i class=" fa fa-envelope-o fa-fw" aria-hidden="true"></i></span>
                                </div>
                            </div>
                            <div class="form-group ">
                                <div class="input-group default-input-group">
                                    <input type="password" class="form-control" name="password" placeholder="Password" required="required">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-fw" aria-hidden="true"></i></span>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row align-items-center justify-content-center">
                        <div class="col-sm-6 align-self-center">
                            <button type="submit" class=" btn-primary btn btn-lg btn-block text-white text-uppercase mt-2 mb-4"><span class="py-6">Login</span></button>
                        </div>
                    </div>
                </form>
                <div class="row align-items-center justify-content-center">
                    <div class="col-sm-12 align-self-center text-center">
                        <small><span class="text-mute">Forgot password? </span><strong class="font-weight-bold">Reset</strong></small>
                        <br>
                        <small><span class="text-mute">Don't have an account? </span> <strong class="font-weight-bold">Signup</strong></small>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script>
$.validator.setDefaults({
    submitHandler: function() {
        $.ajax({
            type: "POST",
            url: "/member/ajaxlogin",
            data: $('#form1').serialize(),
            error: function(msg){
                console.log( "登陆失败，错误信息如下: ");
                console.log(  msg );
            },
            success: function(msg){
                if(msg.ret>0){
                    window.location.href='/'
                }else{
                    alert('不成功！');
                }
            }
        });
    }
});
$().ready(function() {
    $("#form1").validate();
});
</script>
