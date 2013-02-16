flour = require 'flour'

# Build
# ===========

task 'build', ->
    invoke 'build:css'
    invoke 'build:js'

task 'build:css', ->
    bundle [
        'assets/css/reset.css'
        'assets/css/main.styl'
    ], 'public/assets/css/main.css'

task 'build:js', ->
    bundle [
        'assets/js/main.coffee'
    ], 'public/assets/js/main.js'


# Watch
# ===========

task 'watch', ->
    invoke 'build'

    watch 'assets/css/', -> invoke 'build:css'
    watch 'assets/js/', -> invoke 'build:js'
