export default class Brand {
  id: number
  name: KnockoutObservable<string>

  constructor(params: {
    id?: number | undefined,
    name: string
  }) {
    params    = { ...this._setDefaults(), ...params }
    this.id   = params.id
    this.name = ko.observable(params.name)
  }

  get isNewRecord() {
    return this.id == undefined
  }

  get serialize() {
    return this.isNewRecord ? { brand: { name: this.name() } } : { brand_id: this.id }
  }

  _setDefaults() {
    return {
      id: undefined,
      name: ""
    }
  }

  init() {
    return this
  }
}