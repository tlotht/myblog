# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

# From "jquery-rails" gem

pin "jquery", to: "jquery3.min.js", preload: true

pin "jquery\_ujs", to: "jquery\_ujs.js", preload: true



# From "bootstrap" gem

pin "bootstrap", to: "bootstrap.min.js", preload: true

pin "@popperjs/core", to: "popper.js", preload: true



# Custom JS

pin "my\_script", to: "my\_script.js", preload: true