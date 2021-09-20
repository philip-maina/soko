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

  _setDefaults() {
    return {
      id: undefined,
      name: ""
    }
  }

  serialize() {
    return { }
  }

  init() {
    return this
  }
}