import ScrollBarModule from "./global/components/scrollBarModule"
import ToolTipModule from "./global/components/toolTipModule"

export default class Initializers {
  static initScrollBarModule() {
    new ScrollBarModule().init()
  }

  static initTooltips() {
    new ToolTipModule().init()
  }

  static initPopovers() {
    
  }

  static initGlobals() {
  }
}