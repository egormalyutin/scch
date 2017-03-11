
###
████──███──████───█─█──███──████──███──███
█──█──█────█──█───█─█───█───█──█──█────█
████──███──█─██───█─█───█───████──███──███
█─█───█────█──█───█─█───█───█─█───█──────█
█─█───███──█████──███──███──█─█───███──███
───────────────██
###


###
╔═╗ ║║ ║ ╔╗
║╔╗ ║║ ║ ║║
╚═╝ ╚╝ ╚ ╠╝
###

gulp        = require 'gulp'
uglify      = require 'gulp-uglify'
gulpIF      = require 'gulp-if'
fs          = require 'fs'
clean       = require 'gulp-clean'
rename      = require 'gulp-rename'
runSequence = require 'run-sequence'
spawn = require('child_process').exec





###
███──████──███──█──█──███
─█───█──█──█────█─█───█
─█───████──███──██────███
─█───█──█────█──█─█─────█
─█───█──█──███──█──█──███
###

gulp.task 'lib', ->
	gulp
		.src        'lib/*.js'
		.pipe uglify()
		.pipe gulp.dest '../lib/'

gulp.task 'bin', ->
	gulp
		.src        'bin/*.js'
		.pipe uglify()
		.pipe gulp.dest '../bin/'

gulp.task 'build', ['lib', 'bin']












