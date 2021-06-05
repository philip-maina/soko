import Initializers from "../../initializers"

Paloma.controller("MerchantsPortal/Products", {
  before: ['all -> init'],

  index: function () {  
  },
  new: function () {
  },
  create: function () {
  },

  init: function(){
    Initializers.initMenuLeftModule("products_all")
  }
})
