  btn_up = $('button.vote_up')
  btn_down = $('button.vote_down')
  article_id = $('#article_id').data('id')
  type = $('#article_id').data('type')
  count_up = btn_up.find('span')
  count_down = btn_down.find('span')
  url = '/news/vote_change/'
  if (type == 'article') {
    url = '/articles/vote_change/'
  }
  if (type == 'deck') {
    url = '/decks/vote_change/'
  }
  btn_up.click(function () {
    vote = 0
    if ($(this).hasClass('clicked')) {
      $(this).removeClass('clicked');
      count_up.text(parseInt(count_up.text()) - 1)
    } else {
      $(this).addClass("clicked");
      if (btn_down.hasClass('clicked')) {
        btn_down.removeClass('clicked')
        count_down.text(parseInt(count_down.text()) - 1)
      }
      vote = 1
      count_up.text(parseInt(count_up.text()) + 1)
    }
    send_vote(vote, url)
  });

  btn_down.click(function () {
    vote = 0
    if ($(this).hasClass('clicked')) {
      $(this).removeClass('clicked');
      count_down.text(parseInt(count_down.text()) - 1)
    } else {
      $(this).addClass("clicked");
      if (btn_up.hasClass('clicked')) {
        btn_up.removeClass('clicked')
        count_up.text(parseInt(count_up.text()) - 1)
      }
      vote = -1
      count_down.text(parseInt(count_down.text()) + 1)
    }
    send_vote(vote, url)
  });
  send_vote = function (vote, url) {
    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'html',
      data: {
        id: article_id,
        vote: vote
      },
    }).fail(function (jqXHR, textStatus) {
      alert(jqXHR.responseText)
    });
  };