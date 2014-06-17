var path = require('path');

module.exports = function (grunt) {
    'use strict';
    // load all grunt tasks
    require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

    grunt.initConfig({
        copy: {
            main: {
                files: [
                    // copy all the dot files but not sudoers-linux
                    {
                        expand: true,
                        src: ['inc/*', 'config.fish', 'functions/*', 'completions/*'],
                        dest: path.join(process.env.HOME, '.config', 'fish')
                    }
                ]
            }
        },
        watch: {
            main: {
                files: [ 'functions/*', 'inc/*', 'config.fish' ],
                tasks: [ 'copy' ]
            }
        }
    });

    grunt.registerTask('default', ['copy']);
};
