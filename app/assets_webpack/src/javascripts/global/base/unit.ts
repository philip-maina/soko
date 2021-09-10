export default class Unit {

  name: KnockoutObservable<string>
  measurementType: KnockoutObservable<string>

  constructor(params: {
    name: string,
    measurementType: string
  }) {
    this.name = ko.observable(params.name)
    this.measurementType = ko.observable(params.measurementType)
  }

  get isQuantity():boolean {
    return this.measurementType() == "quantity"
  }

  get isWeight():boolean {
    return this.measurementType() == "weight"
  }

  get isVolume():boolean {
    return this.measurementType() == "volume"
  }

  get isLength():boolean {
    return this.measurementType() == "length"
  }

  get isArea():boolean {
    return this.measurementType() == "area"
  }

  compatible(unit: Unit): boolean {
    return this.measurementType() == unit.measurementType()
  }

  serialize(): string {
    return this.name()
  }

  init() {
    return this
  }
}