// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require turbolinks
import "controllers"
import "channels"
import "@hotwired/turbo-rails"
import "turbo-rails"

import "jquery"
import "jquery_ujs"
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = true
import "./add_jquery"