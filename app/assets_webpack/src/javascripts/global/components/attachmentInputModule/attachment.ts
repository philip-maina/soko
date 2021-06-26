
export default class Attachment {
  name: string
  dataUrl: string
  __: {}

  constructor(options: {
    name: string,
    dataUrl: string,
  }) {
    this.name     = options.name
    this.dataUrl  = options.dataUrl

    this.__ = {}
  }
}