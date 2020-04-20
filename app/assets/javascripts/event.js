
  $(window).load(function () {
    $(".user__back").click(function(){
    $(".user__levelup").fadeOut(300);
    })
    if (gon.thresold_in === gon.ex_point && gon.level != 1){
      $(".user__levelup").fadeIn(500);
    }
})

  $(function(){
    $("#level-bar").width(gon.gage+ '%');
  });
  
  

   
$(function(){
  function buildHTML(event){
      var html = `
      <div class = "event" data-event-id=${event.id}>
      <div class = "event-page">
      <div class = "event-tape"></div>
      <div class = "event__content">
      <div class = "event__content--date">
      ${event.date}
      </div>
      <div class = "event__content--content">
      ${event.content}
      </div>
      </div>
      <div class = "event__content--menu">
      <div class = "event__content--delete">
      <a data-method = "delete" href=/events/${event.id}>削除</a>
      </div>
      <form action="./acquisitions" method="post" class = "form-input">
      <input type = "date" name = "date" class = "form__success", value = ${event.date} %>
      <input tyoe = "text" name = "task" class = "form__success", value = ${event.task} %>
      <input type = "text" name = "content" class = "form__success", value = ${event.content} %>
      <input type="submit" value="完了" class = "success-btn">
      </form>
      </div>
      </div>
      </div>
      </div>` 
      return html;
  }
  $(".form__new").on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      if(data.task === "ToDo"){
        $(".task-content1").append(html);
      }else if(data.task === "日課" ){
        $(".task-content2").append(html);
      }else if(data.task === "習慣"){
        $(".task-content3").append(html);
      }
      $("form")[0].reset();
      $(".create-btn").prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})

$(function() {
  
  $(document).on('click',"#success-btn",function(){
    let EventID = $(this).data("event-id");
    console.log(EventID);
    $.ajax({
      url: "/events/" + EventID,
      type: "POST",
      data: {"id":EventID,"_method": "DELETE"} ,
    });
  });
});



$(window).load(function() {
  var message = [
    '素晴らしい一日になること請け合い！',
    '今日は何か良いことがありそう',
    '良いことがあれば…いいなぁ',
    '運は心の持ちようです',
    '元気いっぱいな一日になりそう',
    '他人への感謝の気持ちを忘れずに',
    '今日は何か良いことがありそう',
    '元気よく挨拶すれば吉',
    '普通に無難な一日です',
    '足元に気を付けて！',
    '家にこもってゆっくりしましょう'
  ];
  $('#btn').one('click', function(e) {
    $('#result').text(message[Math.round(Math.random() * 10)]); 
  });

   var mes=["大吉\n今日は絶好調♪","中吉\nいいことあるかも♪","小吉\n小さな幸せ訪れます","末吉\n運気復調の兆し！","凶\n気を取り直して更新しましょう"];
   $('#btn').one('click', function(e) {
   $('#unnsei').text(mes[Math.round(Math.random()*5)]);
   });
});