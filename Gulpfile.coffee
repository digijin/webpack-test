gulp = require 'gulp'

webpack = require 'webpack'

gulp.task 'default', (cb) ->
	compiler = webpack
		context: __dirname + "/src"
		entry: './test'
		output: 
			path: __dirname + "/dist"
			filename: 'bundle.js'
			
	compiler.run (err, stats) ->
		console.log err, stats
		cb()