export default class MenuLeftModule {
  container: JQuery
  currentMenuItemId: string
  __: {}

  constructor(options: {
    container: JQuery,
    currentMenuItemId: string
  }) {
    this.container         = options.container
    this.currentMenuItemId = options.currentMenuItemId
    this.__ = {}
  }

  toggleMenu() {
    $('body').toggleClass('vb__menuLeft--toggled')
  }

  toggleMobileMenu() {
    $('body').toggleClass('vb__menuLeft--mobileToggled')
  }

  toggleSubMenu(_, event) {
    let targetSubMenu   = $(event.target).closest('.vb__menuLeft__submenu')
    let expandedSubMenu = targetSubMenu.siblings('.vb__menuLeft__submenu--toggled')

    if (targetSubMenu.hasClass('vb__menuLeft__submenu--toggled')) {
      this._collapseSubMenu(targetSubMenu)
    } else {
      if (expandedSubMenu.length) this._collapseSubMenu(expandedSubMenu)
      this._expandSubMenu(targetSubMenu)
    }
  }

  private _collapseSubMenu(subMenu: JQuery) {
    subMenu
      .removeClass('vb__menuLeft__submenu--toggled')
      .find('> .vb__menuLeft__navigation')
      .slideUp(200)
  }

  private _expandSubMenu(subMenu: JQuery) {
    subMenu
      .addClass('vb__menuLeft__submenu--toggled')
      .find('> .vb__menuLeft__navigation')
      .slideDown(200)
  }

  private _collapseMenu() {
    $('body').addClass('vb__menuLeft--toggled')
  }

  private _bindEvents() {
    $(window).on('resize', () => {
      if ($(window).innerWidth() <= 992) this._collapseMenu()
    })
  }

  // Set active menu item & toggle all parent submenus
  private _load() {
    let currentMenuItem = $('.vb__menuLeft').find(`#${this.currentMenuItemId}`)

    currentMenuItem.addClass('vb__menuLeft__item--active')
    currentMenuItem.parents('.vb__menuLeft__submenu').each((_, el) => {
      $(el)
        .addClass('vb__menuLeft__submenu--toggled')
        .find('> .vb__menuLeft__navigation')
        .show()
    }) 
  }

  init() {
    this._load()
    this._bindEvents()

    return this
  }
}