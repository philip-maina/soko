const { environment } = require("@rails/webpacker")
const webpack = require("webpack") 

environment.plugins.append("Provide", new webpack.ProvidePlugin({
  $: "jquery",
  jQuery: "jquery",
  "window.$": "jquery",
  "window.jQuery": "jquery",
  ko: "knockout"
}))

module.exports = environment
