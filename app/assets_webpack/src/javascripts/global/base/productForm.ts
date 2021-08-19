import Brand from "./productForm/brand"
import CollectionItem from "./productForm/collectionItem"
import Option from "./productForm/option"
import Variant from "./productForm/variant"

export default class ProductForm {
  constants: Readonly<{}>

  brand: KnockoutComputed<{}>
  brandId: KnockoutObservable<{}>
  brands: KnockoutObservableArray<{}>
  careTags: KnockoutObservableArray<{}>

  collectionItems: KnockoutObservableArray<CollectionItem>
  options: KnockoutObservableArray<Option>
  masterVariant: Variant
  nonMasterVariants: KnockoutObservableArray<Variant>

  isSaving: KnockoutObservable<boolean>
  canSave: KnockoutObservable<boolean>

  __: {}

  constructor(params: {
    brands: Array<{}>,
    options: Array<{}>,
    variants: Array<any>,
    collectionItems: Array<{}>,
    careTags: Array<{}>
  }) {
    this.constants = Object.freeze({})

    this.brandId = ko.observable()
    this.brands  = ko.observableArray([
      { id: "0", name: "Barnes & Nobles", newOption: false },
      { id: "1", name: "Macmillan Publishers", newOption: false },
      { id: "2", name: "Hachette Livre", newOption: false }
    ])
    this.brand = ko.computed(() => {
      return this.brands().find((brand) => brand.id == this.brandId())
    })

    this.collectionItems = ko.observableArray([])
    this.options = ko.observableArray([])
    this.nonMasterVariants =
      ko.observableArray(
        params.variants.reduce((acc, variant) => {
          if (!variant.master) acc.push(new Variant(variant).init())
          return acc
      }, []))  

    let masterVariant = params.variants.find((variant) => variant.master)
    this.masterVariant = 
      masterVariant ? 
        new Variant({...masterVariant, $imagesModule: $("#images") }).init() :
        new Variant({ 
          master: true, 
          $imagesModule: $("#images"),
          careTags: params.careTags
        }).init()


    this.careTags = ko.observableArray(params.careTags)
    this.canSave = ko.observable(false)
    this.isSaving = ko.observable(false)

    this.__ = {}
  }

  


  serialize() {
  }

  valid() {
  }

  preview() {
  }

  save() {
  }

  addOption() {
  }

  removeOption() {
  }

  addVariant() {
  }

  removeVariant() {
  }

  load(params) {
  }


  init() {

    return this
  }
}