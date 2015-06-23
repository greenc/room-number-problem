'use strict';

module.exports = function (grunt) {

  // Time how long tasks take. Can help when optimizing build times
  require('time-grunt')(grunt);

  // Load grunt tasks automatically
  require('load-grunt-tasks')(grunt);

  // Define the configuration for all the tasks
  grunt.initConfig({

    pkg: grunt.file.readJSON('package.json'),

    // Empties folders to start fresh
    clean: {
      tmp: '.tmp',
    },

    // Copies files to relevant folders
    copy: {
      test: {
        dot: true,
        expand: true,
        cwd: 'test',
        dest: '.tmp',
        src: 'testrunner.html'
      }
    },

    // Mocha testing framework configuration options
    mocha: {
      naive: {
        src: ['.tmp/testrunner.html'],
        options: {
          run: true,
          mocha: {
            grep: 'naive'
          }
        }
      },
      optimized: {
        src: ['.tmp/testrunner.html'],
        options: {
          run: true,
          mocha: {
            grep: 'optimized'
          }
        }
      },
      all: {
        src: ['.tmp/testrunner.html'],
        options: {
          run: true
        }
      }
    },

    // Compiles CoffeeScript to JavaScript
    coffee: {
      compile: {
        files: {
          '.tmp/rooms.js': 'rooms.coffee'
        }
      },
      test: {
        files: {
          '.tmp/spec/rooms.js': 'test/spec/rooms.coffee'
        }
      }
    }

  });

  // Only runs tests for naive method
  grunt.registerTask('naive', [
    'prepare',
    'mocha:naive'
  ]);

  // Only runs tests for optimized method
  grunt.registerTask('optimized', [
    'prepare',
    'mocha:optimized'
  ]);

  // Compiles coffee and moves test files into .tmp/
  grunt.registerTask('prepare', [
    'clean:tmp',
    'copy:test',
    'coffee:compile',
    'coffee:test'
  ]);

  // Default task, runs all unit tests
  grunt.registerTask('default', [
    'prepare',
    'mocha:all',
    'clean:tmp'
  ]);

};