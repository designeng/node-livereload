module.exports = (grunt) ->
  
    # Project configuration.
    grunt.initConfig
        serverFile: "index.js"
        shell:
            nodemon:
                command: "nodemon <%= serverFile %>"
                options:
                    stdout: true
                    stderr: true

        watch: {} # nothing to do in watch anymore

    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-shell"
    grunt.registerTask "default", "shell:nodemon"