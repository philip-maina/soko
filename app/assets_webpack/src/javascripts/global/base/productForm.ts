import _ from "lodash"
import Brand from "./productForm/brand"
import CollectionItem from "./productForm/collectionItem"
import Option from "./productForm/option"
import Variant from "./productForm/variant"
import Unit from "./unit"

export default class ProductForm {
  units: KnockoutObservableArray<Unit>
  brands: KnockoutObservableArray<{}>
  careTags: KnockoutObservableArray<string>
  searchTags: KnockoutObservableArray<string>
  locations: Array<{ id: number, name: string }>

  brand: KnockoutObservable<{}>
  collectionItems: KnockoutObservableArray<CollectionItem>
  options: KnockoutObservableArray<Option>
  masterVariant: Variant
  nonMasterVariants: KnockoutObservableArray<Variant>

  hasChanges: KnockoutObservable<boolean>
  canSave: KnockoutObservable<boolean>
  isSaving: KnockoutObservable<boolean>

  __: {}

  constructor(params: {
    locations: Array<{ id: number, name: string }>,
    units: Array<{ name: string, measurementType: string }>,
    brands: Array<{ id: number, name: string, isNewRecord: boolean }>,
    options: Array<{}>,
    variants: Array<any>,
    collectionItems: Array<{}>,
    careTags: Array<string>,
    searchTags: Array<string>
  }) {
    this.locations = params.locations

    this.units      = ko.observableArray(params.units.map((unit) => new Unit(unit).init()))
    this.careTags   = ko.observableArray(params.careTags)
    this.searchTags = ko.observableArray(params.searchTags)

    this.brand  = ko.observable()
    this.brands = ko.mapping.fromJS(params.brands)

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
    this.canSave = ko.observable(false)
    this.isSaving = ko.observable(false)
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

  setBrand() {
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