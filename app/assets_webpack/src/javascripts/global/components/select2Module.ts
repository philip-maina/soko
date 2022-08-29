export default class Select2Module {
  constructor() {}

  init(){
    $("[data-select2-tags]").each((_, target) => { 
      $(target).select2({
        tags: true,
        tokenSeparators: [',', ' ']
      }) 
    })
  }
}