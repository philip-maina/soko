import Attachment from "./attachmentInputModule/attachment"

export default class AttachmentInputModule {
  attachments: KnockoutObservableArray<Attachment>
  defaultAttachment: KnockoutComputed<Attachment>
  
  __: {
    $module: JQuery<HTMLElement>
    $inputClickHandler: JQuery<HTMLInputElement>
  }

  constructor(params: {
    $module: JQuery<HTMLElement>
    attachments: Array<{
      name: string,
      dataUrl: string,
      rawFile: File
    }>
  }) {
    this.attachments = ko.observableArray(
      params.attachments.map((attachment) => {
        return new Attachment(attachment)
      })
    )

    this.defaultAttachment = ko.pureComputed(() => this.attachments()[0])

    this.__ = {
      $module: params.$module,
      $inputClickHandler: params.$module.find('input[type="file"]') as JQuery<HTMLInputElement>
    }
  }

  onAttachmentChange() {
    let fileList = this.__.$inputClickHandler[0].files
    
    for (let i = 0; i < fileList.length; i++) {
      let fileReader = new FileReader()
      let file = fileList.item(i)

      fileReader.onload = this.addAttachment.bind(this, file)
      fileReader.readAsDataURL(file)
    } 
  }

  addAttachment(attachment, event) {
    let dataUrl = event.target.result
    if (this.attachments().some(attachment => attachment.dataUrl == dataUrl)) return

    this.attachments.push(
      new Attachment({
        rawFile: attachment,
        dataUrl: dataUrl
      })
    )
  }

  editAttachment() {
  }

  removeAttachment(attachment) {
    this.attachments.remove(attachment)
  }

  removeAllAttachments() {
    this.__.$inputClickHandler.val("")
    this.attachments([])
  }

  openAttachmentPicker () {
    this.__.$inputClickHandler.trigger("click")
  }

  init() {
    return this
  }
}