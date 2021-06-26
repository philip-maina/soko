import AttachmentInputModule from "../../components/attachmentInputModule"
import Attachment from "../../components/attachmentInputModule/attachment"

export default class Variant {
  master: boolean
  title: KnockoutObservable<string>
  subtitle: KnockoutObservable<string>
  description: KnockoutObservable<string>
  sku: KnockoutObservable<string>
  careTags: KnockoutObservableArray<string>
  searchTags: KnockoutObservableArray<string>
  imageInputModule: AttachmentInputModule

  constructor(params: {
    master: boolean,
    title?: string,
    subtitle?: string,
    images?: Array<{
      name: string,
      dataUrl: string
    }>,
    $imagesModule: JQuery<HTMLElement>
  }) {
    this.master = params.master
    this.title = ko.observable(params.title)
    this.subtitle = ko.observable(params.subtitle)
    this.imageInputModule = new AttachmentInputModule({
      $module: params.$imagesModule,
      attachments: params.images || []
    }).init()
  }

  serialize() {
  }

  init() {

    return this
  }
}
