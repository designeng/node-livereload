module.exports = (grunt) ->
  
    # Project configuration.
    grunt.initConfig
        nodemon: 
            dev:
                options:
                    file: 'app/js/index.js'
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

    grunt.registerTask "default", ["concurrent"]

    # for all at once compilation
    grunt.registerTask "coffee-compile", ["coffee:each"]

    grunt.registerTask "server", ()->
        console.log "server task"