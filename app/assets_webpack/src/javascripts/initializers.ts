import ScrollBarModule from "./global/components/scrollBarModule"
import ToolTipModule from "./global/components/toolTipModule"
import Select2Module from "./global/components/select2Module"
import MenuLeftModule from "./global/layout/menuLeftModule"

export default class Initializers {
  static initScrollBarModule() {
    new ScrollBarModule().init()
  }

  static initTooltips() {
    new ToolTipModule().init()
  }

  static initPopovers() {
  }

  static initSelect2() {
    new Select2Module().init()
  }

  static initGlobals() {
  }

  static initMenuLeftModule(currentMenuItemId?: string) {
    let $menuLeftContainer = $("[data-menu-left]")
    if (!$menuLeftContainer.length) return

    let menuLeftModule = new MenuLeftModule({
      container: $menuLeftContainer, 
      currentMenuItemId: currentMenuItemId
    }).init()
    ko.applyBindings(menuLeftModule, $menuLeftContainer[0])
  }
}