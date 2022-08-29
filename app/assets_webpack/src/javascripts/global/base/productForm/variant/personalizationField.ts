export default class PersonalizationField {

  id: number | null
  required: KnockoutObservable<boolean>
  label: KnockoutObservable<string>
  helpText: KnockoutObservable<string>
  placeholder: KnockoutObservable<string>
  fieldType: KnockoutObservable<string>
  fieldTypes: KnockoutObservableArray<string>

  constructor(params: {
    id?: number,
    required?: boolean,
    label?: string,
    helpText?: string,
    placeholder?: string,
    fieldType?: string
  }) {
    params = { ...this._setDefaults(), ...params }
    this.id          = params.id
    this.required    = ko.observable(params.required)
    this.label       = ko.observable(params.label)
    this.helpText    = ko.observable(params.helpText)
    this.placeholder = ko.observable(params.placeholder)
    this.fieldType   = ko.observable(params.fieldType)
    this.fieldTypes  = ko.observableArray([
      "text_field",
      "text_area",
      "number_field",
      "date_field",
      "file_field"
    ]) 
  }

  _setDefaults() {
    return {
      id: null,
      required: true,
      label: "",
      helpText: "",
      placeholder: "",
      fieldType: "text_field"
    }
  }

  get serialize() {
    return {
      required: this.required(),
      label: this.label(),
      help_text: this.helpText(),
      placeholder: this.placeholder(),
      field_type: this.fieldType()
    }
  }

  get valid() {
    return !!this.label() &&
      !!this.helpText() &&
      !!this.placeholder() &&
      !!this.fieldType()
  }

  init() {
    return this
  }
}