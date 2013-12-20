$(function() {
  // pick surface or floor pic
  $('.sur_or_floor').fancybox();

  // when select on fancybox
  $('#make-sur-pic,#upload-sur-pic').click(function() {
    $('#space_editor').fadeIn('fast', function() {
      $('.sur_or_floor').hide();
    });
  });


  // Boxer plugin
  $.widget("ui.boxer", $.ui.mouse, {
    options: {
      appendTo: 'body',
      distance: 0
    },
    _init: function() {
      console.log(this);
      this.element.addClass("ui-boxer");

      this.dragged = false;

      this._mouseInit();

      this.helper = $(document.createElement('div'))
        .css({border:'1px dotted black'})
        .addClass("ui-boxer-helper");
    },

    destroy: function() {
      console.log('destroy');
      this.element
        .removeClass("ui-boxer ui-boxer-disabled")
        .removeData("boxer")
        .unbind(".selectable");
      this._mouseDestroy();
      console.log(this);
      return this;
    },

    _mouseStart: function(event) {
      console.log('_mouseStart');
      console.log(this);
      var self = this;

      this.opos = [event.pageX, event.pageY];

      if (this.options.disabled)
        return;

      var options = this.options;

      this._trigger("start", event);

      $(options.appendTo).append(this.helper);

      this.helper.css({
        "z-index": 100,
        "position": "absolute",
        "left": event.clientX,
        "top": event.clientY,
        "width": 5,
        "height": 5
      });
    },

    _mouseDrag: function(event) {
      console.log('_mouseDrag');
      console.log(this);
      var self = this;
      this.dragged = true;

      if (this.options.disabled)
        return;

      var options = this.options;

      var x1 = this.opos[0], y1 = this.opos[1], x2 = event.pageX, y2 = event.pageY;
      if (x1 > x2) { var tmp = x2; x2 = x1; x1 = tmp; }
      if (y1 > y2) { var tmp = y2; y2 = y1; y1 = tmp; }
      this.helper.css({left: x1, top: y1, width: x2-x1, height: y2-y1});

      this._trigger("drag", event);

      return false;
    },

    _mouseStop: function(event) {
      var self = this;

      this.dragged = false;

      var options = this.options;

      var clone = this.helper.clone()
        .removeClass('ui-boxer-helper').appendTo(options.appendTo);

      this._trigger("stop", event, { box: clone });

      this.helper.remove();

      return false;
    }
  });
  var i = 0;
  var lot = [];

  $('#spaces_dumps').boxer({
    stop: function(event, ui) {
      lot.push(ui.box);
      var offset = lot[i].offset();

      // 樣式
      lot[i].css({ border: '1px solid white', background: '#e3e3e3' });

      // 取名字
      var lot_name = '方塊' + i;

      // 名字
      lot[i].html('<a href="#" id="lot-'+ i +'" data-type="text" data-placement="right" data-title="自定名稱：" data-name="test">'+ lot_name +'</a><span style="float: right"><i class="fa fa-pencil"></i><i class="fa fa-times"></i></span>');

      // 側邊加入
      $('#sidebar').append('<li id="lot_li-'+ i +'">'+ lot_name +'</li>');

      // 方塊加入 ID
      lot[i].attr('id', 'div-' + i);

      // 方塊 each
      $.each(lot, function(index, value) {
        value.find('a').editable({
          success: function(response, newValue) {
            $('#lot_li-' + $(this).attr('id').split('-')[1]).text(newValue);
          }
        }).end().draggable().resizable();

        value.on('click', '.fa-times', function() {
          var bye_lot = $(this).closest('div');
          $('#lot_li-' + bye_lot.attr('id').split('-')[1]).remove();
          bye_lot.remove();
        });
      })

      lot[i].on('dblclick',function() {
        alert($(this).text());
      });


      // 方塊計數
      i++;
    }
  });

  $('.fa-times').on('click', function() {
    alert(123);
  });



  // 自訂場地名稱
  $.fn.editable.defaults.mode = 'popup';
  //make username editable
  $('#space_name').editable();

});