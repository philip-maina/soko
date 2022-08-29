import Initializers from "../../initializers"
import ProductForm from "../../global/base/productForm"

Paloma.controller("MerchantsPortal/Products", {
  before: ['all -> init'],

  index: function () {  
  },
  new: function () {
    const form = new ProductForm({
      brands: this.params.brands,
      locations: this.params.locations,
      urls: this.params.urls,
      units: [
        { name: "pcs", measurementType: "quantity" },

        { name: "g", measurementType: "weight" },
        { name: "kg", measurementType: "weight" },
        { name: "lb", measurementType: "weight" },
        { name: "oz", measurementType: "weight" },

        { name: "ml", measurementType: "volume" },
        { name: "l", measurementType: "volume" },

        { name: "cm", measurementType: "length" },
        { name: "m", measurementType: "length" },

        { name: "cm2", measurementType: "area" },
        { name: "m2", measurementType: "area" }
      ],
      options: [],
      variants: [],
      collectionItems: [],
      careTags: ["Avoid Humidity", "Keep away from direct sunlight"],
      searchTags: ["clothing", "vegetables", "fruits", "groceries", "books", "stationery"]
    }).init()

    ko.applyBindings(form, $("[data-product-form]")[0])
    window.productForm = form
    Initializers.initImageSwapperModule()
  },
  create: function () {
  },

  init: function(){
    Initializers.initMenuLeftModule("products_all")
  }
})
