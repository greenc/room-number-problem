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
      reference: {
        src: ['.tmp/testrunner.html'],
        options: {
          run: true,
          mocha: {
            grep: 'countReference'
          }
        }
      },
      optimized: {
        src: ['.tmp/testrunner.html'],
        options: {
          run: true,
          mocha: {
            grep: 'countOptimized'
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
          '.tmp/count_reference.js': 'count_reference.coffee',
          '.tmp/count_optimized.js': 'count_optimized.coffee'
        }
      },
      test: {
        files: {
          '.tmp/spec/count_reference.js': 'test/spec/count_reference.coffee',
          '.tmp/spec/count_optimized.js': 'test/spec/count_optimized.coffee'
        }
      }
    }

  });

  // Only runs tests for reference method
  grunt.registerTask('ref', [
    'prepare',
    'mocha:reference'
  ]);

  // Only runs tests for optimized method
  grunt.registerTask('opt', [
    'prepare',
    'mocha:optimized'
  ]);

  // Compiles coffee and moves test files into .tmp/
  grunt.registerTask('prepare', [
    'clean:tmp',
    'copy:test',
    'coffee:compile',
    'coffee:test',
    'clean:tmp'
  ]);

  // Default task, runs all unit tests
  grunt.registerTask('default', [
    'prepare',
    'mocha:all',
  ]);

};