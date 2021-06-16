// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

function requireAll(r) { r.keys().forEach(r) }

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
import "select2"


// Stylesheets
import "../../stylesheets/application"


// Images
require.context('../../images', true, /\.(gif|png|jpe?g|svg)$/i)


// Paloma controllers
requireAll(require.context("../palomaControllers", true, /(\.ts$)/));


// Set up Initialization
import Initializers from "../initializers"
$(document).on("turbolinks:load", function () {
  Initializers.initGlobals()
  Initializers.initPopovers()
  Initializers.initTooltips()
  Initializers.initSelect2()
  Initializers.initScrollBarModule()

  Paloma.start()
})