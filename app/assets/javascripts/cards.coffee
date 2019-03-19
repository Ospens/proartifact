$(document).on 'turbolinks:load', ->
  $ ->
    $('.filter_buttons').click (e) ->
      if $(e.target).parents('#filters_type').length
        hadnlefilter('#filters_type', e)
      if $(e.target).parents('#filters_rarity').length
        hadnlefilter('#filters_rarity', e)
      if $(e.target).parents('#filters_color').length
        hadnlefilter('#filters_color', e)
      if $(e.target).parents('#filters_set').length
        hadnlefilter('#filters_set', e)
      sendSearchQuery()
    $('#search_button').click (e) ->
      sendSearchQuery()
    $('#card_search_input input').blur -> 
      sendSearchQuery()

  sendSearchQuery = () ->
    card_class = dataValue('#filters_type')
    card_rarity = dataValue('#filters_rarity')
    card_color = dataValue('#filters_color')
    card_set = dataValue('#filters_set')
    search = $('#card_search_input input').val()
    $.ajax
      method: 'get'
      url: '/cards_filter'
      dataType: 'html'
      data:
        search: search,
        card_class: card_class,
        rarity: card_rarity,
        color: card_color,
        card_set: card_set
      success: (data) ->
        $('#filter_results').replaceWith(data)
        $('.tooltip-show').tooltipster();
      error: (e) ->
        console.log e
    
  hadnlefilter = (parentClass, e) ->
    $parent = $(parentClass)
    $val = $(e.target).parents('.btn')
    
    if parseInt( $val.attr("value")) == 1
      $val.attr("value", 0)
      $val.removeClass('check')
    else
      $val.attr("value", 1)
      $val.addClass('check')

  dataValue = (parent) ->
    val = []
    $(parent).children('div').each ->
      if $(this).attr('value') == '1'
        val.push parseInt($(this).attr('data-type'))
    return val
    
  # offline filters
  $ ->
    $('#toggle_description').click (e) ->
      x = document.getElementById("tl_description")
      if x.style.maxHeight == '0px'
        x.style.maxHeight = '1000px'
        $('#toggle_description').text('Свернуть')
      else
        x.style.maxHeight = '0px'
        $('#toggle_description').text('Развернуть')

    $('.list_filter_buttons').click (e) ->
      if $(e.target).parents('#filters_type').length
        hadnlefilter('#filters_type', e)
      if $(e.target).parents('#filters_rarity').length
        hadnlefilter('#filters_rarity', e)
      if $(e.target).parents('#filters_color').length
        hadnlefilter('#filters_color', e)
      if $(e.target).parents('#filters_set').length
        hadnlefilter('#filters_set', e)
      filterList()
    $('#search_button').click (e) ->
      filterList()
    $('#card_search_input input').blur -> 
      filterList()

  filterList = () ->
    card_class = dataValue('#filters_type')
    card_rarity = dataValue('#filters_rarity')
    card_color = dataValue('#filters_color')
    card_set = dataValue('#filters_set')
    search = $('#card_search_input input').val().toLowerCase()

    $('.card-column').each (i, el) ->
      $(el).css('height', 'auto').css('overflow', 'unset')
      $(el).find('.card_line').each (index, child) ->
        $child = $(child)
        $child.css('display', 'block')
        if search.length != 0
          $child.css('display', 'none')
          if ($child.data('title').includes(search)) || ($child.data('eng-title').includes(search))
            $child.css('display', 'block')
        if card_class.length != 0  && !card_class.includes($child.data('type'))
          $child.css('display', 'none')
        if card_rarity.length != 0  && !card_rarity.includes($child.data('rarity'))
          $child.css('display', 'none')
        if card_color.length != 0  && !card_color.includes($child.data('color'))
          $child.css('display', 'none')
        if card_set.length != 0  && !card_set.includes($child.data('set'))
          $child.css('display', 'none')

  hadnlefilter = (parentClass, e) ->
    $parent = $(parentClass)
    $val = $(e.target).parents('.btn')
    
    if parseInt( $val.attr("value")) == 1
      $val.attr("value", 0)
      $val.removeClass('check')
    else
      $val.attr("value", 1)
      $val.addClass('check')

  dataValue = (parent) ->
    val = []
    $(parent).children('div').each ->
      if $(this).attr('value') == '1'
        val.push parseInt($(this).attr('data-type'))
    return val
  
  $('.tooltip-card').tooltipster
    content: 'Загрузка...'
    contentAsHTML: true
    arrow: false
    trigger: 'custom'
    triggerOpen: {
      mouseenter: true,
      touchstart: true
    },
    triggerClose: {
      click: true,
      scroll: true,
      mouseleave: true
    }

    functionBefore: (instance, helper) ->
      $origin = $(helper.origin)
      card_id = $origin.data('id')
      # we set a variable so the data is only loaded once via Ajax, not every time the tooltip opens
      if $origin.data('loaded') != true
        $.ajax
          method: 'get'
          url: '/tooltip_card'
          dataType: 'html'
          data: id: parseInt(card_id)
          success: (data) ->
            instance.content data
          error: (e) ->
            console.log e
        #$.get '/images/cards/33/main_img/image_cards/medium/magnus.jpg', (data) ->
          # call the 'content' method to update the content of our tooltip with the returned data.
          # note: this content update will trigger an update animation (see the updateAnimation option)
        #instance.content '<img src=' + img_path + '>'
          # to remember that the data has been loaded
        $origin.data 'loaded', true

    