export default class ToolTipModule {
  constructor() {}

  init(){
    $("body").tooltip({
      container: "body",
      trigger: "hover",
      selector: '[data-bs-toggle="tooltip"]'
    })
  }
}