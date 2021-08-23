// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "bootstrap";
import "../stylesheets/application";
import "packs/order_index";
import "packs/search";
import "packs/imageUpload";
import "packs/form_valid";
import "packs/review";


Rails.start();
Turbolinks.start();
ActiveStorage.start();
require("jquery");
require("easy-autocomplete");
global.toastr = require("toastr");
console.log("jquery available");

require("trix")
require("@rails/actiontext")