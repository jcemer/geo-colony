flour = require 'flour'

# Build
# ===========

task 'build', ->
    invoke 'build:css'

task 'build:css', ->
    bundle [
        'assets/css/normalize.css'
        'assets/css/main.styl'
    ], 'public/assets/css/main.css'


# Watch
# ===========

task 'watch', ->
    invoke 'build'

    watch 'assets/css/', -> invoke 'build:css'
