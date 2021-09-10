export default class CustomerPrice {
  price: KnockoutObservable<number>
  compareAtPrice: KnockoutObservable<number>
  minimumQuantity: KnockoutObservable<number>

  constructor(params: {
    price?: number,
    compareAtPrice?: number,
    minimumQuantity?: number
  }) {
    params = { ...this._setDefaults(), ...params }
    this.price           = ko.observable(params.price)
    this.compareAtPrice  = ko.observable(params.compareAtPrice)
    this.minimumQuantity = ko.observable(params.minimumQuantity)
  }

  _setDefaults() {
    return {
      price: 50,
      compareAtPrice: 50,
      minimumQuantity: 1
    }
  }

  serialize() {
    return {
      price: this.price(),
      compare_at_price: this.compareAtPrice(),
      minimum_quantity: this.minimumQuantity(),
      price_type: "basic"
    }
  }

  init() {
    return this
  }
}