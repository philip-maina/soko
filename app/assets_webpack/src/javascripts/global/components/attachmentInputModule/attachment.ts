
export default class Attachment {
  name: string
  dataUrl: string
  size: number
  rawFile: File
  __: {}

  constructor(options: {
    rawFile?: File,
    dataUrl: string
  }) {
    this.name    = options.rawFile.name
    this.size    = options.rawFile.size / 1024.0 / 1024.0 // in MB
    this.dataUrl = options.dataUrl
    this.rawFile = options.rawFile

    this.__ = {}
  }
}