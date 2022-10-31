const updateLabel = (labelTxt, labelNode) => {
  // Only update if label was specified in the update method
  if (typeof labelTxt === "undefined") return;
  if (labelNode.length !== 1) {
    throw new Error("labelNode must be of length 1");
  }

  // Should the label be empty?
  var emptyLabel = $.isArray(labelTxt) && labelTxt.length === 0;

  if (emptyLabel) {
    labelNode.addClass("shiny-label-null");
  } else {
    labelNode.text(labelTxt);
    labelNode.removeClass("shiny-label-null");
  }
};

const escapeJQuery = (val) => {
  return val.replace(/([!"#$%&'()*+,.\/:;<=>?@\[\\\]^`{|}~])/g, '\\$1');
};

export { updateLabel, escapeJQuery };
