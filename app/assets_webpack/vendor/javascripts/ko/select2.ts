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
  after: ["options"],
  init: function (element, valueAccessor, allBindingsAccessor) {
    let $element       = $(element)
    let subscriptions  = []
    let select2Options = Object.assign({}, ko.unwrap(valueAccessor()))

  
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

    // Delay to allow other binding handlers to run, as this binding handler 
    // depends on options, selectedOptions & value bindings
    setTimeout(() => { $element.select2(select2Options) }, 0)
    
    ko.utils.domNodeDisposal.addDisposeCallback(element, function () {
      $element.select2("destroy")
      while (subscriptions.length) { subscriptions.pop().dispose() }
    })

  },
  update: function (element, valueAccessor, allBindingsAccessor) {

  }
}