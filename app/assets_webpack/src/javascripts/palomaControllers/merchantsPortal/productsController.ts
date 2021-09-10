import Initializers from "../../initializers"
import ProductForm from "../../global/base/productForm"

Paloma.controller("MerchantsPortal/Products", {
  before: ['all -> init'],

  index: function () {  
  },
  new: function () {
    const form = new ProductForm({
      locations: [
        { id: 1, name: "Muhoho Ave." },
        { id: 2, name: "Langata Otiende"}
      ],
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
      brands: [
        { id: 0, name: "Barnes & Nobles", isNewRecord: false },
        { id: 1, name: "Macmillan Publishers", isNewRecord: false },
        { id: 2, name: "Hachette Livre", isNewRecord: false }
      ],
      options: [],
      variants: [],
      collectionItems: [],
      careTags: ["Avoid Humidity", "Keep away from direct sunlight"],
      searchTags: ["clothing", "vegetables", "fruits", "groceries", "books", "stationery"]
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
