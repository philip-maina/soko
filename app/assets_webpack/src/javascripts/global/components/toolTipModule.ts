export default class ToolTipModule {
  constructor() {}

  init(){
    $("body").tooltip({
      container: "body",
      selector: '[data-bs-toggle="tooltip"]'
    })
  }
}