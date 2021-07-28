import Brand from "./productForm/brand"
import CollectionItem from "./productForm/collectionItem"
import Option from "./productForm/option"
import Variant from "./productForm/variant"

export default class ProductForm {
  constants: Readonly<{}>

  brand: KnockoutObservable<{}>
  brands: KnockoutObservableArray<{}>
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
    collectionItems: Array<{}>
  }) {
    this.constants = Object.freeze({})

    this.brand = ko.observable()
    this.brands = ko.observableArray([
      { id: "0", text: "Barnes & Nobles" },
      { id: "1", text: "Macmillan Publishers" },
      { id: "2", text: "Hachette Livre" }
    ])
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
        new Variant({ master: true, $imagesModule: $("#images") }).init()

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