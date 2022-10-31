// srcjs/input-range.js
var range = new Shiny.InputBinding();
$.extend(range, {
  initialize: function(el) {
    setThumbValue(el, this._convertValue(el), $(el).attr("min"), $(el).attr("max"));
  },
  find: function(scope) {
    return $(scope).find("input[type=range]");
  },
  _convertValue: function(el) {
    return parseFloat($(el).val(), 10);
  },
  getValue: function(el) {
    return this._convertValue(el);
  },
  setValue: function(el, value) {
  },
  receiveMessage: function(el, data) {
  },
  subscribe: function(el, callback) {
    self = this;
    $(el).on("input.range", function(e) {
      callback(true);
      setThumbValue(el, self.getValue(el), $(el).attr("min"), $(el).attr("max"));
    });
  },
  getRatePolicy: function() {
    return {
      policy: "debounce",
      delay: 250
    };
  },
  unsubscribe: function(el) {
    $(el).off(".range");
  }
});
Shiny.inputBindings.register(range, "dracula.range");
var setThumbValue = (el, value, min, max) => {
  const newValue = Number((value - min) * 100 / (max - min)), newPosition = 10 - newValue * 0.2;
  $("#" + el.id + "-range-value").html(`<span>${value}</span>`);
  $("#" + el.id + "-range-value").css({left: `calc(${newValue}% + (${newPosition}px))`});
};

// srcjs/utils.js
var updateLabel = (labelTxt, labelNode) => {
  if (typeof labelTxt === "undefined")
    return;
  if (labelNode.length !== 1) {
    throw new Error("labelNode must be of length 1");
  }
  var emptyLabel = $.isArray(labelTxt) && labelTxt.length === 0;
  if (emptyLabel) {
    labelNode.addClass("shiny-label-null");
  } else {
    labelNode.text(labelTxt);
    labelNode.removeClass("shiny-label-null");
  }
};
var escapeJQuery = (val) => {
  return val.replace(/([!"#$%&'()*+,.\/:;<=>?@\[\\\]^`{|}~])/g, "\\$1");
};

// srcjs/custom-radio-binding.js
$(document).ready(function() {
  $.extend(Shiny.inputBindings.bindingNames["shiny.radioInput"].binding, {
    receiveMessage: function(el, data) {
      var $el = $(el);
      if (data.hasOwnProperty("options")) {
        $el.find("div.drac-box").remove();
        $el.append(data.options);
      }
      if (data.hasOwnProperty("value"))
        this.setValue(el, data.value);
      updateLabel(data.label, this._getLabelNode(el));
      $(el).trigger("change");
    },
    _getLabelNode: function(el) {
      return $(el).parent().find('label[for="' + escapeJQuery(el.id) + '"]');
    }
  });
});

// srcjs/main.js
$(function() {
  $(".drac-tab").on("click", function() {
    $(".drac-tab.drac-tab-active").removeClass("drac-tab-active");
    $(this).toggleClass("drac-tab-active");
  });
});
