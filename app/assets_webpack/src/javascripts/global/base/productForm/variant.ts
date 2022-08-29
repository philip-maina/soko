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
  descriptionEditor: HTMLElement
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
  weightUnits: Unit[]
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
    description?: string,
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
    customerPrice?: { price: number, compareAtPrice: number, minimumOrderQuantity: number },
    personalizationFields?: Array<{ id: number, required: boolean, label: string, placeholder: string, helpText: string, fieldType: string }>
  }) {
    params = { ...this._setDefaults(), ...params }
    
    this.productForm = params.productForm
    this.master      = params.master
    this.variantType = ko.observable(params.variantType) 
    this.sku         = ko.observable(params.sku)
    this.title       = ko.observable(params.title)
    this.subtitle    = ko.observable(params.subtitle)

    this.description       = ko.observable(params.description)
    this.descriptionEditor = $("trix-editor[input='masterVariant__description']")[0]

    this.careTags   = ko.mapping.fromJS(params.careTags)
    this.searchTags = ko.mapping.fromJS(params.searchTags)

    this.trackInventory = ko.observable(params.trackInventory)
    this.backorderable  = ko.observable(params.backorderable)

    this.inventoryMultiplier     = ko.observable(params.inventoryMultiplier)
    this.inventoryMultiplierUnit = ko.observable(this.productForm.units.find(unit => unit.name() == params.inventoryMultiplierUnit))
    this.inventoryUnits = ko.pureComputed(() => {
      return this.productForm.units.filter((unit) => {
        return this.inventoryMultiplierUnit().compatible(unit)
      })
    })
    this.inventories = this.productForm.locations.map((location) => new Inventory({
      locationId: location.id,
      locationName: location.name
    }).init())
  

    this.weight      = ko.observable(params.weight)
    this.weightUnit  = ko.observable(this.productForm.units.find(unit => unit.name() == params.weightUnit))
    this.weightUnits = this.productForm.units.filter(unit => unit.isWeight)
    this.trackWeight = ko.observable(params.weight ? true : false)

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

    this.seoListing       = new SeoListing(params.seoListing)
    this.customerPrice    = new CustomerPrice(params.customerPrice) 
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

  editDescription(_, event) {    
    this.description(event.target.value)
  }


  get thumbnail() {
    return this.imageInputModule.attachments[0]
  }

  get serialize() {
    return {
      master: this.master,
      variant_type: this.variantType(),
      sku: this.sku(),
      title: this.title(),
      subtitle: this.subtitle(),
      description: this.description(),
      track_inventory: this.trackInventory(),
      backorderable: this.backorderable(),
      weight: this.trackWeight() ? this.weight() : null,
      weight_unit: this.trackWeight() ? this.weightUnit().serialize : null,
      care_tags: this.careTags(),
      search_tags: this.searchTags(),
      inventory_multiplier: this.inventoryMultiplier(),
      inventory_multiplier_unit: this.inventoryMultiplierUnit().serialize,
      images: [],
      downloads: [],
      seo_listing: this.seoListing.serialize,
      customer_prices: [ this.customerPrice.serialize ],
      product_variant_inventories: this.inventories.map(inventory => ({ product_inventory_id: inventory.temporaryId })),
      product_variant_personalization_fields: this.personalizationFields().map(field => field.serialize),
      product_option_value_variants: []
    }
  }

  get valid(){
    return this._validAttrs() &&
           this.seoListing.valid &&
           this.customerPrice.valid &&
           this.inventories.every(inventory => inventory.valid) &&
           this.personalizationFields().every(field => field.valid)
  }

  _validAttrs() {
    return !!this.title() &&
           !!this.sku() &&
           !!this.variantType()
  }


  _resetBackorderable() {
    if (!this.trackInventory()) this.backorderable(false)
  }

  _initDescriptionEditor() {
    this.descriptionEditor.editor.loadHTML(this.description())
  }

  _setDefaults() {
    return {
      master: false,
      variantType: "physical",
      sku: "",
      title: "",
      subtitle: "",
      description: "<div><strong>Editor content goes here</strong></div>",
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
        minimumOrderQuantity: 1
      }
    }
  }


  init() {
    this.__.subscriptions.trackInventory = [ this.trackInventory.subscribe(this._resetBackorderable.bind(this)) ]
    this._initDescriptionEditor()

    return this
  }
}
