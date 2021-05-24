import PerfectScrollbar from 'perfect-scrollbar'

export default class ScrollBarModule {
  constructor() {}

  init(){
    if (/Mobi/.test(navigator.userAgent)) return
    $("[data-scroll-bar]").each((_, scrollBar) => { 
      new PerfectScrollbar(scrollBar)
    })
  }
}