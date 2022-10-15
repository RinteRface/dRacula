// srcjs/input-range.js
var range = new Shiny.InputBinding();
$.extend(range, {
  find: function(scope) {
    return $(scope).find("input[type=range]");
  },
  getValue: function(el) {
    return parseFloat($(el).val(), 10);
  },
  setValue: function(el, value) {
  },
  receiveMessage: function(el, data) {
  },
  subscribe: function(el, callback) {
    $(el).on("input.range", function(e) {
      callback(true);
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

// srcjs/main.js
$(function() {
  $(".drac-tab").on("click", function() {
    $(".drac-tab.drac-tab-active").removeClass("drac-tab-active");
    $(this).toggleClass("drac-tab-active");
  });
});
