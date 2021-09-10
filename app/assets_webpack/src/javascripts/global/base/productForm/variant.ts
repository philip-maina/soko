import AttachmentInputModule from "../../components/attachmentInputModule"
import Attachment from "../../components/attachmentInputModule/attachment"
import Unit from "../unit"
import Inventory from "./inventory"
import SeoListing from "./variant/seoListing"
import PersonalizationField from "./variant/personalizationField"
import ProductForm from "../productForm"
import CustomerPrice from "./variant/customerPrice"

export default class Variant {
  productForm: ProductForm
  master: boolean
  variantType: KnockoutObservable<string>
  title: KnockoutObservable<string>
  subtitle: KnockoutObservable<string>
  description: KnockoutObservable<string>
  sku: KnockoutObservable<string>
  careTags: KnockoutObservableArray<string>
  searchTags: KnockoutObservableArray<string>
  trackWeight: KnockoutObservable<boolean>
  trackInventory: KnockoutObservable<boolean>
  backorderable: KnockoutObservable<boolean>
  imageInputModule: AttachmentInputModule
  inventoryMultiplier: KnockoutObservable<number>
  inventoryMultiplierUnit: KnockoutObservable<Unit>
  inventories: Array<Inventory>
  inventoryUnits: KnockoutComputed<Unit[]>
  weight: KnockoutObservable<number>
  weightUnit: KnockoutObservable<Unit>
  weightUnits: KnockoutComputed<Unit[]>
  physical: KnockoutComputed<boolean>
  personalizationFields: KnockoutObservableArray<PersonalizationField>
  seoListing: SeoListing
  customerPrice: CustomerPrice

  __: {
    subscriptions: {
      trackInventory: Array<KnockoutSubscription>
    }
  }

  constructor(params: {
    productForm: ProductForm,
    master: boolean,
    variantType?: string,
    sku?: string,
    title?: string,
    subtitle?: string,
    trackInventory?: boolean,
    backorderable?: boolean,
    careTags?: Array<string>,
    searchTags?: Array<string>,
    inventoryMultiplier?: number,
    inventoryMultiplierUnit?: string,
    weight?: number | null,
    weightUnit?: string,
    $imagesModule: JQuery<HTMLElement>,
    images?: Array<{ name: string, dataUrl: string }>,
    seoListing?: { metaTitle: string, metaDescription: string },
    customerPrice?: { price: number, compareAtPrice: number, minimumQuantity: number },
    personalizationFields?: Array<{ id: number, required: boolean, label: string, placeholder: string, helpText: string, fieldType: string }>
  }) {
    params = { ...this._setDefaults(), ...params }
    
    this.productForm = params.productForm
    this.master = params.master
    this.variantType = ko.observable(params.variantType) 
    this.sku = ko.observable(params.sku)
    this.title = ko.observable(params.title)
    this.subtitle = ko.observable(params.subtitle)
    this.careTags = ko.mapping.fromJS(params.careTags)
    this.searchTags = ko.mapping.fromJS(params.searchTags)

    this.trackInventory = ko.observable(params.trackInventory)
    this.backorderable  = ko.observable(params.backorderable)
    this.trackWeight = ko.observable(params.weight ? true : false)

    this.inventoryMultiplier = ko.observable(params.inventoryMultiplier)
    this.inventoryMultiplierUnit = ko.observable(this.productForm.units().find(unit => unit.name() == params.inventoryMultiplierUnit))
    this.inventoryUnits = ko.pureComputed(() => {
      return this.productForm.units().filter((unit) => {
        return this.inventoryMultiplierUnit().compatible(unit)
      })
    })
    this.inventories = this.productForm.locations.map((location) => new Inventory({
      locationId: location.id,
      locationName: location.name
    }).init())
  
    

    this.weight = ko.observable(params.weight)
    this.weightUnit = ko.observable(this.productForm.units().find(unit => unit.name() == params.weightUnit))
    this.weightUnits = ko.pureComputed(() => { return this.productForm.units().filter(unit => unit.isWeight) })

    this.physical = ko.computed({
      read: function () { return this.variantType() === "physical" },
      write: function (value) { 
        this.variantType(value ? "physical"  : "digital")
        if (!value) this.trackWeight(false)
      },
      owner: this
    })

    this.personalizationFields = ko.observableArray(
      params.personalizationFields.map((personalizationField) => new PersonalizationField(
        personalizationField
      ).init())
    )

    this.seoListing    = new SeoListing(params.seoListing)
    this.customerPrice = new CustomerPrice(params.customerPrice) 

    this.imageInputModule = new AttachmentInputModule({
      $module: params.$imagesModule,
      attachments: params.images
    }).init()

    this.__ = {
      subscriptions: {
        trackInventory: []
      }
    }
  }


  addCareTag(_: any, event: any) { 
    return this.addTag(this.productForm.careTags, this.careTags, event) 
  }

  removeCareTag(data: any) {
    return this.removeTag(this.careTags, data)
  }

  addSearchTag(_: any, event: any) {
    return this.addTag(this.productForm.searchTags, this.searchTags, event) 
  }

  removeSearchTag(data: any) {
    return this.removeTag(this.searchTags, data)
  }


  addTag(
    allTags: KnockoutObservableArray<string>, 
    tags: KnockoutObservableArray<string>, 
    event: any
  ) {
    let token = event.target.value.trim().replace(",", "") 

    if (!(
      event.originalEvent instanceof KeyboardEvent ||
      event.originalEvent instanceof InputEvent
    )) {
      if (token.length && !this.hasTag(tags, token)) tags.push(token)
      return this.resetTarget(event.target)
    }

    if (!(event.key === "Enter" || event.key === ",")) return true
    if (!token.length) return this.resetTarget(event.target)
    if (this.hasTag(tags, token)) return this.resetTarget(event.target)

    let tag = allTags().find((tag) => tag.toLowerCase() == token.toLowerCase())
    if (tag) tags.push(tag)
    else tags.push(token)

    return this.resetTarget(event.target)
  }

  removeTag(tags: KnockoutObservableArray<string>, data: any) {
    tags.remove(data)
  }

  hasTag(tags: KnockoutObservableArray<string>, token: string) {
    return tags().some((tag) => tag.toLowerCase() == token.toLowerCase())
  }

  resetTarget(target) {
    target.value = ""
    target.blur()
    return false
  }


  addPersonalizationField() {
    this.personalizationFields.push(new PersonalizationField({}).init())
  }

  removePersonalizationField(data) {
    this.personalizationFields.remove(data)
  }


  serialize() {
  }

  valid(){

  }


  _resetBackorderable() {
    if (!this.trackInventory()) this.backorderable(false)
  }

  _setDefaults() {
    return {
      master: false,
      variantType: "physical",
      sku: "",
      title: "",
      subtitle: "",
      trackInventory: true,
      backorderable: false,
      careTags: [],
      searchTags: [],
      inventoryMultiplier: 1,
      inventoryMultiplierUnit: "pcs",
      weight: 0,
      weightUnit: "kg",
      personalizationFields: [],
      images: [],
      seoListing: {
        metaTitle: "",
        metaDescription: ""
      },
      customerPrice: {
        price: 50,
        compareAtPrice: 50,
        minimumQuantity: 1
      }
    }
  }


  init() {
    this.__.subscriptions.trackInventory = [
      this.trackInventory.subscribe(this._resetBackorderable.bind(this))
    ]

    return this
  }
}
