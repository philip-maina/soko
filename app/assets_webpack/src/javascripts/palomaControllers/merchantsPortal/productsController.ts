import Initializers from "../../initializers"
import ProductForm from "../../global/base/productForm"

Paloma.controller("MerchantsPortal/Products", {
  before: ['all -> init'],

  index: function () {  
  },
  new: function () {
    const form = new ProductForm({
      brands: [],
      options: [],
      variants: [],
      collectionItems: [],
      careTags: [{ id: "1", name: "Avoid Humidity" } , { id: "1", name: "Keep away from direct sunlight" }]
    }).init()

    ko.applyBindings(form, $("[data-product-form]")[0])
    window.productForm = form
  },
  create: function () {
  },

  init: function(){
    Initializers.initMenuLeftModule("products_all")
  }
})
