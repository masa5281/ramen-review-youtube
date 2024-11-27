# Pin npm packages by running ./bin/importmap

# Hotwire(Turbo + Stimulus)
# 開発者がすぐにHotwireを使えるようデフォルトで用意されている
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js" # Rails7に読み込まれているTurboを利用するための設定
pin "@hotwired/stimulus", to: "stimulus.min.js" # Stimulusを利用するための設定
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
