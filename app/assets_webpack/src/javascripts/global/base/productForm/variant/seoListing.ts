export default class SeoListing {
  id: number | null
  metaTitle: KnockoutObservable<string>
  metaDescription: KnockoutObservable<string>

  constructor(params: {
    id?: number,
    metaTitle?: string,
    metaDescription?: string 
  }) {
    params = { ...this._setDefaults(), ...params }
    this.id              = params.id
    this.metaTitle       = ko.observable(params.metaTitle)
    this.metaDescription = ko.observable(params.metaDescription)
  }

  _setDefaults() {
    return {
      id: null,
      metaTitle: "",
      metaDescription: ""
    }
  }

  get serialize() {
    return {
      meta_title: this.metaTitle(),
      meta_description: this.metaDescription()
    }
  }

  get valid() {
    return !!this.metaTitle() && !!this.metaDescription()
  }

  init() {
    return this
  }
}