import Initializers from "../../initializers"

Paloma.controller("MerchantsPortal/Home", {
  before: ['all -> init'],

  show: function () {  
  },

  init: function() {
    Initializers.initMenuLeftModule()
  }
})