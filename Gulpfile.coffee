gulp = require 'gulp'

webpack = require 'webpack'

gulp.task 'default', (cb) ->
	compiler = webpack
		context: __dirname + "/src"
		entry: './test'
		output: 
			path: __dirname + "/dist"
			filename: 'bundle.js'
		module:
			loaders: [
				test: /\.coffee$/
				loader: "coffee-loader"
			]
			
	compiler.run (err, stats) ->
	watcher = compiler.watch 200, (err, stats) ->
		# console.log err#, stats
		# cb()
		console.log "build over"

	# console.log watcher