import Unit from "../unit"
import { v4 as uuidv4 } from 'uuid'

export default class Inventory {
  temporaryId: string
  locationId: KnockoutObservable<number>
  locationName: KnockoutObservable<string>
  quantityOnHand: KnockoutObservable<number>
  lowInventoryThreshold: KnockoutObservable<number>
  expiresIn: KnockoutObservable<Date>
  unit: KnockoutObservable<Unit>

  constructor(params: {
    locationId: number,
    locationName: string,
    quantityOnHand?: number,
    lowInventoryThreshold?: number,
    unit?: { 
      name: string,
      measurementType: string
    }
  }) {
    this.temporaryId = uuidv4()
    this.locationId = ko.observable(params.locationId)
    this.locationName = ko.observable(params.locationName)
    this.quantityOnHand = ko.observable(params.quantityOnHand || 1)
    this.lowInventoryThreshold = ko.observable(params.lowInventoryThreshold || 1)
    this.unit = ko.observable()
  }

  serialize() {
  }

  init() {
    return this
  }
}