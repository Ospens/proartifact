$(document).on('turbolinks:load', function() {
    var $example, currDate, diff, initData, labels, nextDate, nextYear, parser, strfobj, template;
    labels = ['Дней', 'Часов', 'Минут', 'Секунд'];
    nextYear = '2018/11/28 10:00:00';
    $('#main-example').empty()
    template = function (obj) { obj || (obj = {}); var __t, __p = ''; with (obj) { __p += '\n    <div class="time ' + ((__t = (label)) == null ? '' : __t) + '">\n        <span class="count curr top">' + ((__t = (curr)) == null ? '' : __t) + '</span>\n        <span class="count next top">' + ((__t = (next)) == null ? '' : __t) + '</span>\n        <span class="count next bottom">' + ((__t = (next)) == null ? '' : __t) + '</span>\n        <span class="count curr bottom">' + ((__t = (curr)) == null ? '' : __t) + '</span>\n        <span class="label">' + ((__t = (label.length < 6 ? label : label.substr(0, 3))) == null ? '' : __t) + '</span>\n    </div>\n'; } return __p }
    currDate = '00:00:00:00:00';
    nextDate = '00:00:00:00:00';
    parser = /([0-9]{2})/gi;
    $example = $('#main-example');
    strfobj = function(str) {
      var obj, parsed;
      parsed = str.match(parser);
      obj = {};
      labels.forEach(function(label, i) {
        obj[label] = parsed[i];
      });
      return obj;
    };
    initData = strfobj(currDate);
    diff = function(obj1, obj2) {
      var diff;
      diff = [];
      labels.forEach(function(key) {
        if (obj1[key] !== obj2[key]) {
          diff.push(key);
        }
      });
      return diff;
    };
    labels.forEach(function(label, i) {
      $example.append(template({
        curr: initData[label],
        next: initData[label],
        label: label
      }));
    });
    var delay = function($node) {
      $node.addClass('flip')
    }
    $example.countdown(nextYear, function(event) {
      var data, newDate;
      newDate = event.strftime('%D:%H:%M:%S');
      data = void 0;
      if (true) {
        currDate = nextDate;
        nextDate = newDate;
        data = {
          'curr': strfobj(currDate),
          'next': strfobj(nextDate)
        };
        diff(data.curr, data.next).forEach(function(label) {
          var $node, selector;
          selector = '.%s'.replace(/%s/, label);
          $node = $example.find(selector);
          $node.removeClass('flip');
          $node.find('.curr').text(data.curr[label]);
          $node.find('.next').text(data.next[label]);
          setTimeout(delay, 50, $node);
        });
      }
    });
});