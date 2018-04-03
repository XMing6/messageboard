<div class="row justify-content-md-center h-100">
    <div class="card-wrapper" style="width: 500px;">
        <div class="card fat">
            <div class="card-body">
                <h4 class="card-title">注册</h4>
                <form method="POST" id="form1">

                    <div class="form-group">
                        <label for="name">Name</label>
                        <input id="name" type="text" class="form-control" minlength="2" name="name" placeholder="Nickname" required autofocus>
                    </div>

                    <div class="form-group">
                        <label for="email">E-Mail Address</label>
                        <input id="email" type="email" class="form-control" name="email" placeholder="Email address" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input id="password" type="password" class="form-control" name="password" placeholder="password" required data-eye>
                    </div>
                    <div class="form-group">
                        <label for="password"> Retype Password</label>
                        <input id="rt_password" type="password" class="form-control" equalTo="#password" name="rt_password" placeholder=" Retype Password" required data-eye>
                    </div>

                    <div class="form-group">
                        <label>
                            <input type="checkbox" name="aggree" value="1" required="required"> I agree to the Terms and Conditions
                        </label>
                    </div>

                    <div class="form-group no-margin">
                        <button type="submit" class="btn btn-primary btn-block">
                            Register
                        </button>
                    </div>
                    <div class="margin-top20 text-center">
                        Already have an account? <a href="index.html">Login</a>
                    </div>
                </form>
            </div>
        </div>
        <div class="footer">
            Copyright &copy; 2018 &mdash; Your Company
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
            url: "/member/ajaxregister",
            data: $('#form1').serialize(),
            error: function(msg){
                console.log( "登陆失败，错误信息如下: ");
                console.log(  msg );
            },
            success: function(msg){
                if(msg.ret>0){
                    window.location.href='/member/login'
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
