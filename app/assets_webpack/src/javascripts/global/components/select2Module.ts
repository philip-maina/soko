export default class Select2Module {
  constructor() {}

  init(){
    $("[data-select2-tags]").each((_, target) => { 
      console.log("FOUND SELECT2 TAGS")
      $(target).select2({
        tags: true,
        tokenSeparators: [',', ' ']
      }) 
    })
  }
}