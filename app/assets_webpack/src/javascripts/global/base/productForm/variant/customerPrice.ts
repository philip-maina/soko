export default class CustomerPrice {
  id: number | null
  price: KnockoutObservable<number>
  compareAtPrice: KnockoutObservable<number>
  minimumOrderQuantity: KnockoutObservable<number>

  constructor(params: {
    id?: number,
    price?: number,
    compareAtPrice?: number,
    minimumOrderQuantity?: number
  }) {
    params = { ...this._setDefaults(), ...params }
    this.id                   = params.id
    this.price                = ko.observable(params.price)
    this.compareAtPrice       = ko.observable(params.compareAtPrice)
    this.minimumOrderQuantity = ko.observable(params.minimumOrderQuantity)
  }

  _setDefaults() {
    return {
      id: null,
      price: 50,
      compareAtPrice: 50,
      minimumOrderQuantity: 1
    }
  }

  get serialize() {
    return {
      price: this.price(),
      compare_at_price: this.compareAtPrice(),
      minimum_order_quantity: this.minimumOrderQuantity(),
      price_type: "basic"
    }
  }

  init() {
    return this
  }
}