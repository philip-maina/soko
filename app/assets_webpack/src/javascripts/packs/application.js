// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
// import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")


// Vendor libraries
import $ from "jquery"
import "bootstrap"
import "@fortawesome/fontawesome-free/js/all.js"
import "knockout"


// Stylesheets
import "../../stylesheets/application"


// Images
require.context('../../images', true, /\.(gif|png|jpe?g|svg)$/i)


// Set up Initialization
import Initializers from "../initializers"
$(document).on("turbolinks:load", function () {
  Initializers.initGlobals()
  Initializers.initPopovers()
  Initializers.initTooltips()
  Initializers.initScrollBarModule()
  // Paloma.start()
})