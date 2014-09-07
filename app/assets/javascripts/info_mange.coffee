$ ->
  setTableContent = (data) ->
    $(".modal-body td").text ""
    return if not data[0]?
    for d, i in data
      $(".duty" + (i + 1)).text d.duty
      $(".date" + (i + 1)).text parseInt(d.date.toString()[6..7], 10)
    return
  frontPadZero = (num, length) -> ((Array(length).join(0)) + num)[-2..]
  
  $("button").popover html: true

  $(document).on "click", ".duty", (event) ->
    date = new Date()
    year = date.getFullYear()
    month = frontPadZero date.getMonth() + 1, 2
    yearMonth = year + month
    $("#myModalLabel").text yearMonth
    $("#userName").text $(this).data "name"
    $("#userId").val($(this).data "user")
    $.ajax 
      url: '/info_manages/get_duty?month=' + yearMonth + '&id=' + $(this).data('user')
      dataType: 'json'
      success: (data) ->
        setTableContent data

  $(document).on "click", "#pre", (event) ->
    paramDate = $("#myModalLabel").text()
    year = paramDate[0..3]
    month = (parseInt paramDate[4..5], 10) - 1
    if month is 0 
      month = 12
      year = (parseInt year, 10) - 1
    yearMonth = year + frontPadZero month, 2
    $("#myModalLabel").text yearMonth
    userId = $("#userId").val()
    $.ajax
      url: 'info_manages/get_duty?month=' + yearMonth + '&id=' + userId
      dataType: 'json'
      success: (data) ->
        setTableContent data

  $(document).on "click", "#next", (event) ->
    paramDate = $("#myModalLabel").text()
    year = paramDate[0..3]
    month = parseInt(paramDate[4..5], 10) + 1
    if month is 13
      year = (parseInt year) + 1
      month = 1
    yearMonth = year + frontPadZero month, 2
    $("#myModalLabel").text yearMonth
    userId = $("#userId").val()
    $.ajax
      url: '/info_manages/get_duty?month=' + yearMonth + '&id=' + userId
      dataType: 'json'
      success: (data) ->
        setTableContent data

  $(document).keydown (event) ->
    if $("#myModal").attr("aria-hidden") is "false"
      if event.keyCode is 37 then $("#pre").click()
      if event.keyCode is 39 then $("#next").click()
