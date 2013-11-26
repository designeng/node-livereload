module.exports = (grunt) ->
  
    # Project configuration.
    grunt.initConfig
        nodemon: 
            dev:
                options:
                    file: 'app/js/index1.js'
                    ignoredFiles: ["node_modules/**"]
                    legacyWatch: true

        concurrent:
            dev:
                tasks: ['watch:coffee', 'nodemon', 'watch:js']
                options:
                    logConcurrentOutput: true
        watch:
            coffee:
                files: ['app/coffee/**.coffee']
                tasks: ['coffee-compile']
            js:
                files: ['app/js/**.js']
                tasks: ["server"]
                options:
                    livereload: true

        coffee:
            each:
                options: {
                    bare: true
                }
                files: [
                    expand: true,
                    cwd: 'app/coffee',
                    src: ['**/*.coffee'],
                    dest: 'app/js/',
                    ext: '.js'
                ]


    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-concurrent"
    grunt.loadNpmTasks "grunt-nodemon"

    # grunt.loadNpmTasks "grunt-shell"

    # grunt.registerTask "default", ["shell:nodemon", "watch:js"] "watch:coffee", 
    grunt.registerTask "default", ["concurrent"]

    grunt.registerTask "coffee-compile", ["coffee:each"]

    grunt.registerTask "server", ()->
        console.log "server task"

    # grunt.event.on 'watch', (action, filepath, target) ->
    #     matches = filepath.match(/\.coffee/)
    #     if matches
    #         coffeeToJsResultPath = filepath.slice(0, matches.index) + ".js"
    #         console.log "coffeeToJsResultPath", coffeeToJsResultPath

    #         gruntOptions = 
    #             coffee:
    #                 options:
    #                     bare: true
    #                 compileChanged:
    #                     files: {}

    #         gruntOptions.coffee.compileChanged.files[coffeeToJsResultPath] = filepath
    #         grunt.initConfig gruntOptions
    #         grunt.task.run "coffee:compileChanged"