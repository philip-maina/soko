import Unit from "../unit"
import { v4 as uuidv4 } from 'uuid'

export default class Inventory {
  temporaryId: string
  locationId: number
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
    this.temporaryId           = uuidv4()
    this.locationId            = params.locationId
    this.locationName          = ko.observable(params.locationName)
    this.quantityOnHand        = ko.observable(params.quantityOnHand || 1)
    this.lowInventoryThreshold = ko.observable(params.lowInventoryThreshold || 1)
    this.unit                  = ko.observable()
  }

  get serialize() {
    return {
      temporary_id: this.temporaryId,
      quantity_on_hand: this.quantityOnHand(),
      low_inventory_threshold: this.lowInventoryThreshold(),
      location_id: this.locationId,
      unit: this.unit().name(),
      expires_on: null
    }
  }

  get valid() {
    return !!this.quantityOnHand() &&
           !!this.lowInventoryThreshold() &&
           !!this.unit()
  }

  init() {
    return this
  }
}