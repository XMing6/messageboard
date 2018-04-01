
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#message_list" role="tab" aria-controls="home" aria-selected="true">留言列表</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#leave_message" role="tab" aria-controls="profile" aria-selected="false">我要留言</a>
  </li>
</ul>

<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="message_list" role="tabpanel" aria-labelledby="message_list-tab">
  <div class="card">
      <div  class="card-header">
          留言板列表
      </div>
      <div  class="card-body">
    <ul class="list-group" id="msg_list_group"></ul>
  </div>
  <div class="pagination ml-2" id="pagination"></div>
  </div>
  </div>
  <div class="tab-pane fade" id="leave_message" role="tabpanel" aria-labelledby="leave_message-tab">
  <div class="card mb-3">
      <div  class="card-header">
           我要留言
      </div>
      <div  class="card-body  p-5">
   <form  action="message/add" id="form1" method="POST">
     <div class="form-group">
       <label for="inputAddress">您的名字</label>
       <input type="text" class="form-control" id="inputAddress" name="user_name" placeholder="请输入您的名字" value="小名">
     </div>
     <div class="form-group">
       <label for="inputAddress2">您的Email</label>
       <input type="text" class="form-control" id="inputAddress2" name="user_email" placeholder="请输入您的Email" value="kitty@bb.com">
     </div>
     <div class="form-group">
       <label for="inputAddress2">您的电话</label>
       <input type="text" class="form-control" id="inputAddress2" name="user_phone" placeholder="请输入您的电话" value="13888888888">
     </div>
     <div class="form-group">
       <label for="inputAddress2">您的留言</label>
        <textarea class="form-control" id="exampleFormControlTextarea1" name="user_message" rows="3" placeholder="请输入您的留言">今天天气真的进学好啊！</textarea>
     </div>
     <input type="button" class="btn btn-primary"  value="登录" id="message_new"/>
   </form>
  </div>

  </div>

</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="exampleModalLabel">回复留言</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                    <div class="form-group">
                        <label for="message-text" class="control-label"  id="message-reply-label">Message:</label>
                        <textarea class="form-control" id="message-reply-text"></textarea>
                        <input type="hidden" id="message-reply-id" />
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="submit_reply">Send message</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal_alert" tabindex="-1" role="dialog" aria-labelledby="alertModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="alert alert-warning">
                <a href="#" class="close" data-dismiss="modal">
                    &times;
                </a>
                <strong>警告！</strong><span>您的网络连接有问题。<span>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="modal_del" tabindex="-1" role="dialog" aria-labelledby="delModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="alert alert-warning">
                <a href="#" class="close" data-dismiss="modal">
                    &times;
                </a>
                        <input type="hidden" id="message-delete-id" />
                <strong>警告！</strong><span>你确定要删除吗？<span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="submit_delete">确定删除</button>
            </div>
        </div>
    </div>
</div>


<script src="/static/js/jquery.twbsPagination.js" type="text/javascript"></script>
<script type="text/javascript">
var message_page_size=5;
var message_page_count={{.msg_count}};
var message_page_total=Math.ceil(message_page_count/message_page_size);


$(function(){
    $('#message_new').click(function(){
        $.ajax({
           type: "POST",
           url: "/message/add",
           data: $('#form1').serialize(),
           success: function(msg){
             alert( "Data Saved: " + msg );
           }
        });
    })
     var obj = $('#pagination').twbsPagination({
                totalPages: message_page_total,
                visiblePages: 10,
                prev:'上一页',
                first:'首页',
                next:'下一页',
                last:'末页',
                onPageClick: function (event, page) {
                   $.ajax({
                             type: "POST",
                             url: "/message/getlist",
                             data: "page_size="+message_page_size+"&page_current="+page,
                             success: function(json){
                                 $('#msg_list_group').empty();
                                 for(var i in json){
                                    var msg='<li class="media border-bottom p-3"><div class="media-body">';
                                    msg +='<div class="d-flex"><h5 class="mt-0 mb-0">'+json[i].User_name+' <small> '+json[i].Date_time+' </small></h5>'
                                    msg +='<div class="ml-auto"><button type="button" data-id="'+json[i].Msg_id+'"  data-name="'+json[i].User_name+'"  class="btn btn-link mr-1 btn-reply">回复</button>'
                                    msg +='<button type="button" data-id="'+json[i].Msg_id+'" class="btn btn-link btn-delete">删除</button></div></div>'
                                    msg +=json[i].User_content;
                                    if(json[i].Msg_reply!=''){
                                        msg +="<div class='border border-warning p-2'> 回复： "+json[i].Msg_reply+"</div>";
                                    }
                                    msg +="</div></li>";
                                    $('#msg_list_group').append(msg);
                                 }
                                  $('.btn-reply').click(function(){
                                         $('#message-reply-label').html('@'+$(this).attr('data-name'));
                                         $('#message-reply-id').val($(this).attr('data-id'));
                                         $('#exampleModal').modal('show')
                                   })

                                  $('.btn-delete').click(function(){
                                         $('#message-delete-id').val($(this).attr('data-id'));
                                         $('#modal_del').modal('show')
                                   })
                             }
                    });
                }
     });

     $('#submit_reply').click(function(){
        var msg = $('#message-reply-text').val();
        var id = $('#message-reply-id').val();
        if(''==msg){
               $('#modal_alert span').html('回复内容为空！请填写内容！');
              $('#modal_alert').modal('show');
              return false;
        }
        $.ajax({
           type: "POST",
           url: "/message/addreply",
           data: "Msg_id="+id+"&msg_reply="+msg,
           dataType: "json",
           success: function(msg){
                if(1==msg.ret){
                    $('#exampleModal').modal('hide')
                    window.location.reload()
                }else{
                        $('#modal_alert span').html('服务器错误，回复失败！');
                        $('#modal_alert').modal('show');
                        return false;
                }
           }
        });
     })

     $('#submit_delete').click(function(){
        var id = $('#message-delete-id').val();
        $.ajax({
           type: "POST",
           url: "/message/del",
           data: "Msg_id="+id,
           dataType: "json",
           success: function(msg){
                if(1==msg.ret){
                    $('#exampleModal').modal('hide')
                    window.location.reload()
                }else{
                        $('#modal_alert span').html('服务器错误，回复失败！');
                        $('#modal_alert').modal('show');
                        return false;
                }
           }
        });
     })
})

</script>







