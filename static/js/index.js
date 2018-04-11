$(function(){
    //添加ajax评论
    $('#message_new').click(function(){
        if(0==message_user_id){
            $('#modal_login').modal('show')
            return false;
        }
        $.ajax({
            type: "POST",
            url: "/message/add",
            data: $('#form1').serialize(),
            success: function(msg){
                alert( "Data Saved: " + msg );
            }
        });
    })

    $('#submit_login').click(function(){
        location.href="/member/login";
    }) ;

    // ajax 翻页
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
                        if(0==message_user_id){
                            $('#modal_login').modal('show');
                            return false;
                        }
                        $('#message-reply-label').html('@'+$(this).attr('data-name'));
                        $('#message-reply-id').val($(this).attr('data-id'));
                        $('#exampleModal').modal('show')
                    })

                    $('.btn-delete').click(function(){
                        if(0==message_user_id){
                            $('#modal_login').modal('show');
                            return false;
                        }
                        $('#message-delete-id').val($(this).attr('data-id'));
                        $('#modal_del').modal('show')
                    })
                }
            });
        }
    });

    //评论回复
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

    //评论删除
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