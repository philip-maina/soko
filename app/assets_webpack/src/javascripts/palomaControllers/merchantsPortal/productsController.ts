import Initializers from "../../initializers"
import ProductForm from "../../global/base/productForm"

Paloma.controller("MerchantsPortal/Products", {
  before: ['all -> init'],

  index: function () {  
  },
  new: function () {
    const form = new ProductForm({
      options: [],
      variants: [],
      collectionItems: []
    }).init()

    ko.applyBindings(form, $("[data-product-form]")[0])
  },
  create: function () {
  },

  init: function(){
    Initializers.initMenuLeftModule("products_all")
  }
})
