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
    let $element      = $(element)
    let optionsText   = allBindingsAccessor.get("optionsText")
    let optionsValue  = allBindingsAccessor.get("optionsValue")
    let subscriptions = []

    let select2Options = Object.assign({ 
      createTag: function (params) {
        let term = $.trim(params.term)
        if (term === '') return null
        
        let tag = { id: term, text: term, newOption: true }
        if (optionsText)  tag[optionsText]  = term
        if (optionsValue) tag[optionsValue] = term

        return tag
      }}, 
      ko.unwrap(valueAccessor())
    )

    // let options         = allBindingsAccessor.get("options")
    // let value           = allBindingsAccessor.get("value") // Single Selection
    // let selectedOptions = allBindingsAccessor.get("selectedOptions") // Multi Selection

    // $element.on('select2:select', function(event) {
    //   let selectedOption = event.params.data
      
    //   if (options().some((option) => (option[optionsText] || option).toLowerCase() == selectedOption.text.toLowerCase())) return

    //   if (selectedOptions) selectedOptions.push(selectedOption)
    //   if (value) value(selectedOption)
    //   return
    // })


    // $element.on('select2:unselect', function(event) {
    //   let selectedOption = event.params.data

    //   if (selectedOptions) selectedOptions.remove(selectedOption)
    //   if (value) value()
    //   refresh
    // })

    // $element.on('select2:selecting select2:unselecting', function() { ignoreChange = true })
    // $element.on('select2:select select2:unselect', function() { ignoreChange = false })

  
    let refresh = () => setTimeout(() => {
      console.log("REFRESHING.....")
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