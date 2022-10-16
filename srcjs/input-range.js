var range = new Shiny.InputBinding();
$.extend(range, {
  initialize: function(el) {
    setThumbValue(el, this._convertValue(el), $(el).attr('min'), $(el).attr('max'))
  },
  find: function(scope) {
    return $(scope).find('input[type=range]');
  },
  _convertValue: function(el) {
    return parseFloat($(el).val(), 10);
  },
  getValue: function(el) {
    return this._convertValue(el);
  },
  setValue: function(el, value) {
    // JS code to set value
  },
  receiveMessage: function(el, data) {
    // this.setValue(el, data);
  },
  subscribe: function(el, callback) {
    self = this;
    $(el).on('input.range', function(e) {
      callback(true);
      setThumbValue(el, self.getValue(el), $(el).attr('min'), $(el).attr('max'))
    });
  },
  getRatePolicy: function() {
    return {
      policy: 'debounce',
      delay: 250
    };
  },
  unsubscribe: function(el) {
    $(el).off('.range');
  }
});
Shiny.inputBindings.register(range, 'dracula.range');


const setThumbValue = (el, value, min, max) => {
    const
      newValue = Number( (value - min) * 100 / (max - min) ),
      newPosition = 10 - (newValue * 0.2);
    $('#' + el.id + '-range-value').html(`<span>${value}</span>`);
    $('#' + el.id + '-range-value').css({ 'left': `calc(${newValue}% + (${newPosition}px))` });
  };
