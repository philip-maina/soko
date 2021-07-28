import "select2"

// %select.form-control{ "data-bind": "
//   options: $root.brands, 
//   optionsCaption: 'Select/Add Brand...', 
//   optionsText: 'name', 
//   value: $root.selectedBrand, 
//   select2: { 
//     placeholder: 'Select/Add Brand...', 
//     allowClear: true, 
//     tags: true, 
//     tokenSeparators: [',', ' '], 
//   } 
// }"


ko.bindingHandlers.select2 = {
  after: ["options", "selectedOptions", "value"],
  init: function (element, valueAccessor, allBindingsAccessor) {
    let $element = $(element)
    let select2Options = Object.assign({}, ko.unwrap(valueAccessor()))
    let subscriptions = []

    let options         = allBindingsAccessor.get("options")
    let value           = allBindingsAccessor.get("value") // Single Selection
    let selectedOptions = allBindingsAccessor.get("selectedOptions") // Multi Selection
    let optionsText     = allBindingsAccessor.get("optionsText")

    $element.on('select2:select select2:unselect', function(event) {
      let selectedOption = event.params.data

      if (options().some((option) => option[optionsText].toLowerCase() == selectedOption.text.toLowerCase())) return

      if (event.type == "select2:select") {
        selectedOption[optionsText] = selectedOption.text
        options.push(selectedOption)
        selectedOptions.push(selectedOption)
        value(selectedOption)
      }

      if (event.type == "select2:unselect") {
        value()
        selectedOptions.remove(selectedOption)
        options.remove(selectedOption)
      }      
    });

    

    // Delay to allow other binding handlers to run, as this binding handler 
    // // depends on options, selectedOptions & value bindings
    // setTimeout(() => { $element.select2(select2Options) }, 0)

    let refresh = () => setTimeout(() => {
      $element.select2("destroy")
      $element.select2(select2Options)
    }, 0)

    let addSubscription = function (bindingKey) {
      let targetObservable = allBindingsAccessor.get(bindingKey)

      if (targetObservable && ko.isObservable(targetObservable)) {
        subscriptions.push(targetObservable.subscribe(refresh))
      }
    }

    addSubscription("options")
    addSubscription("value") // Single
    addSubscription("selectedOptions") // Multiple

    ko.utils.domNodeDisposal.addDisposeCallback(element, function () {
      while (subscriptions.length) {
        subscriptions.pop().dispose()
      }
    })
  },
  update: function (element, valueAccessor, allBindingsAccessor) {

  }
}