import { updateLabel } from './utils.js';
import { escapeJQuery } from './utils.js';

$( document ).ready(function() {
 $.extend(
  Shiny
    .inputBindings
    .bindingNames['shiny.radioInput']
    .binding, {
    receiveMessage: function(el, data) {
      var $el = $(el);
      // This will replace all the options
      if (data.hasOwnProperty('options')) {
        // Clear existing options and add each new one
        $el.find("div.drac-box").remove();
        $el.append(data.options);
      }

      if (data.hasOwnProperty('value'))
        this.setValue(el, data.value);

      updateLabel(data.label, this._getLabelNode(el));

      $(el).trigger('change');
    },
    // Get the DOM element that contains the top-level label
    _getLabelNode: function(el) {
      return $(el).parent().find('label[for="' + escapeJQuery(el.id) + '"]');
    }
  });
});
