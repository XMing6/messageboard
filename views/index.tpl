
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
    <ul class="list-group">
      <li class="media border-bottom p-2 ">
        <div class="media-body">
          <h5 class="mt-0 mb-1">List-based media object <small>2018-03-13 00:08:25</small></h5>
          Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
        </div>
      </li>
      <li class="media border-bottom p-3">
        <div class="media-body">
          <h5 class="mt-0 mb-1">List-based media object <small>2018-03-13 00:08:25</small></h5>
          Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
        </div>
      </li>
      <li class="media border-bottom p-3">
        <div class="media-body">
          <h5 class="mt-0 mb-1">List-based media object <small>2018-03-13 00:08:25</small></h5>
          Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
        </div>
      </li>
    </ul>
  </div>
  <div  class="card-footer">
          分页
      </div>
  </div>
  </div>
  <div class="tab-pane fade" id="leave_message" role="tabpanel" aria-labelledby="leave_message-tab">
  <div class="card mb-3">
      <div  class="card-header">
           我要留言
      </div>
      <div  class="card-body  p-5">
   <form  action="message/add" method="POST">
     <div class="form-group">
       <label for="inputAddress">您的名字</label>
       <input type="text" class="form-control" id="inputAddress" name="user_name" placeholder="请输入您的名字">
     </div>
     <div class="form-group">
       <label for="inputAddress2">您的Email</label>
       <input type="text" class="form-control" id="inputAddress2" name="user_email" placeholder="请输入您的Email">
     </div>
     <div class="form-group">
       <label for="inputAddress2">您的电话</label>
       <input type="text" class="form-control" id="inputAddress2" name="user_phone" placeholder="请输入您的电话">
     </div>
     <div class="form-group">
       <label for="inputAddress2">您的留言</label>
        <textarea class="form-control" id="exampleFormControlTextarea1" name="user_message" rows="3" placeholder="请输入您的留言"></textarea>
     </div>
     <button type="submit" class="btn btn-primary">提交</button>
   </form>
  </div>

  </div>

</div>








