const { environment } = require("@rails/webpacker")
const webpack = require("webpack") 

// Provide jQuery and knockout to all modules in the pack w/out explicit importing
environment.plugins.append("Provide", new webpack.ProvidePlugin({
  $: "jquery",
  jQuery: "jquery",
  ko: "knockout"
}))



// Webpack doesn’t pollute the global namespace by default
// This makes jquery, knockout,..etc available globally i.e in views(<!-- ko if: -->), console, 
// window
environment.loaders.append("expose-loader-jquery", {
  test: require.resolve("jquery"),
  use: [
    {
      loader: "expose-loader",
      options: {
        exposes: ["$", "jQuery"],
      }
    }
  ]
})
environment.loaders.append("expose-loader-knockout", {
  test: require.resolve("knockout"),
  use: [
    {
      loader: "expose-loader",
      options: {
        exposes: "ko"
      }
    }
  ]
})


module.exports = environment
