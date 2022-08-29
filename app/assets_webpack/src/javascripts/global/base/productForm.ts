import _ from "lodash"
import { serialize } from "object-to-formdata"
import Turbolinks from "turbolinks"
import * as Api from "./api/index"
import Brand from "./productForm/brand"
import CollectionItem from "./productForm/collectionItem"
import Option from "./productForm/option"
import Variant from "./productForm/variant"
import Unit from "./unit"

export default class ProductForm {
  units: Unit[]
  brands: Brand[]
  careTags: KnockoutObservableArray<string>
  searchTags: KnockoutObservableArray<string>
  locations: Array<{ id: number, name: string }>

  brand: Brand | undefined
  collectionItems: KnockoutObservableArray<CollectionItem>
  options: KnockoutObservableArray<Option>
  masterVariant: Variant
  nonMasterVariants: KnockoutObservableArray<Variant>

  hasChanges: KnockoutObservable<boolean>
  canSave: KnockoutObservable<boolean>
  isSaving: KnockoutObservable<boolean>
  errors: KnockoutObservableArray<string>

  __: {
    urls: { create: string }
  }

  constructor(params: {
    urls: { create: string },
    locations: Array<{ id: number, name: string }>,
    units: Array<{ name: string, measurementType: string }>,
    brands: Array<{ id: number, name: string }>,
    options: Array<{}>,
    variants: Array<any>,
    collectionItems: Array<{}>,
    careTags: Array<string>,
    searchTags: Array<string>
  }) {
    this.locations  = params.locations
    this.units      = params.units.map((unit) => new Unit(unit).init())
    this.careTags   = ko.observableArray(params.careTags)
    this.searchTags = ko.observableArray(params.searchTags)

    this.brand  = undefined
    this.brands = params.brands.map(brand => new Brand(brand).init())

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
        new Variant({...masterVariant, $imagesModule: $("#images"), productForm: this }).init() :
        new Variant({ master: true, $imagesModule: $("#images"), productForm: this}).init()


    this.hasChanges = ko.observable(false)
    this.canSave    = ko.observable(false)
    this.isSaving   = ko.observable(false)
    this.errors     = ko.observableArray([])   

    this.__ = {
      urls: { create: params.urls.create }
    }
  }

  
  get serialize() {
    return {
      merchants_portal_products_create_form: {
        product: {
          ...{
            product_type: "standard",
            collection_items: [],
            product_options: [],
            product_variants: [ this.masterVariant.serialize ],
            product_inventories: this.masterVariant.inventories.map(inventory => inventory.serialize)
          },
          ...(this.brand == undefined ? {} : this.brand.serialize)
        }
      }
    }
  }

  get valid() {
    return this.masterVariant.valid
  }

  save() {
    this.errors([])
    this.isSaving(true)
    // let formData = serialize(this.serialize, { allowEmptyArrays: true, nullsAsUndefineds: true })
    Api.Utilities.postRequest(this.__.urls.create, this.serialize).then((response: any) => {
      this.isSaving(false)
      if (response.success) { Turbolinks.visit(response.url) } 
      else { this.errors(response.errors) }
    })
  }

  addOption() {
  }

  removeOption() {
  }

  addVariant() {
  }

  removeVariant() {
  }

  setBrand(_: any, event: any) {
    let token = event.target.value.trim()
    if (!token.length) this.brand = undefined

    let brand = this.brands.find(brand => brand.name().toLowerCase() == token.toLowerCase())
    if (brand) this.brand = brand
    else this.brand = new Brand({name: token})
  }

  load(params) {
  }

  _updateCareTags() {
    this.careTags(
      _.uniq(
        this.careTags()
          .concat(this.masterVariant.careTags())
      )
    )
  }

  _updateSearchTags() {
    this.searchTags(
      _.uniq(
        this.searchTags()
          .concat(this.masterVariant.searchTags())
      )
    )
  }

  _resetHasChanges() {

  }

  _resetCanSave() {

  }


  init() {
    this.masterVariant.careTags.subscribe(this._updateCareTags.bind(this))
    this.masterVariant.searchTags.subscribe(this._updateSearchTags.bind(this))

    return this
  }
}