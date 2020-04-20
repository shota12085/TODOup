$(function(){
  let events = gon.acquisition_group_by

  let event = []

  $.each(events,function(key,value){
    event.push(value);

  })
  // console.log(event);

  let addHtml = function(id){
    let Html = '';
    $.each(event[id],function(key,event){
      let html = `
      <div class ="event-content">
        <div class = "event-content__events">
          <div class = "event-content__task">
            ${event.task}
          </div>
          <div class = "event-content__content">
            ${event.content}
          </div>
        </div>
      </div>`
      Html += html;
    })
    // console.log(Html)
    return Html
  }

  $(".search-day__day").on('click',function(e){
    e.preventDefault();
    let id = $(this).attr('id')
    // console.log(this);
    $(".event-content").remove();
    let insertHtml = ``;
    insertHtml += addHtml(id);
    // console.log(insertHtml)
    $(".event-main").append(insertHtml)
  })
})
$(function(){

  $(".lunking-top").on('click', function(){
    $(".lunking").show();
    $(".event-main").hide();
  })
  $(".search-day").on('click', function(){
    $(".lunking").hide();
    $(".event-main").show();
  })
  
})
