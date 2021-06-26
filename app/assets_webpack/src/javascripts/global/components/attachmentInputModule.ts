import Attachment from "./attachmentInputModule/attachment"

export default class AttachmentInputModule {
  attachments: KnockoutObservableArray<Attachment>
  
  __: {
    $module: JQuery<HTMLElement>
    $inputClickHandler: JQuery<HTMLInputElement>
  }

  constructor(params: {
    $module: JQuery<HTMLElement>
    attachments: Array<{
      name: string
      dataUrl: string
    }>
  }) {
    this.attachments = ko.observableArray(
      params.attachments.map((attachment) => {
        return new Attachment(attachment)
      })
    )

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
    this.attachments.push(
      new Attachment({
        name: attachment.name, 
        dataUrl: event.target.result 
      })
    )
  }

  editAttachment() {
  }

  removeAttachment(attachment) {
    this.attachments.remove(attachment)
  }

  removeAllAttachments() {
    this.attachments([])
  }

  openAttachmentPicker () {
    this.__.$inputClickHandler.trigger("click")
  }

  init() {
    return this
  }
}