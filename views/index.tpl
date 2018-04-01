
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
        <textarea class="form-control" id="exampleFormControlTextarea1" name="user_message" rows="3" placeholder="请输入您的留言">今天天气真的不错啊！</textarea>
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


<script type="text/javascript">
var message_page_size=5;
var message_page_count={{.msg_count}};
var message_page_total=Math.ceil(message_page_count/message_page_size);
</script>
<script src="/static/js/jquery.twbsPagination.js" type="text/javascript"></script>
<script src="/static/js/index.js" type="text/javascript"></script>






