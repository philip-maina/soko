ko.bindingHandlers.contentEditable = {
  init: function(element, valueAccessor) {
    let $element = $(element)
    let contentEditableOptions = Object.assign({}, ko.unwrap(valueAccessor()))
    let initialValue = ko.utils.unwrapObservable(contentEditableOptions.value)
    let context = contentEditableOptions.context

    function onBlur() {
      let curVal = ko.utils.unwrapObservable(contentEditableOptions.value)
      let newVal = $element.html()

      if (context) context.replace(curVal, newVal)
      else if (ko.isObservable(contentEditableOptions.value)) contentEditableOptions.value(newVal);
    }

    $element.html(initialValue)
    $element.attr('contenteditable','true')
    $element.on('blur', onBlur)
  }
};