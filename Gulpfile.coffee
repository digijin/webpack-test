gulp = require 'gulp'

webpack = require 'webpack'

gulp.task 'default', ['startWebpack']

gulp.task 'startWebpack', ->
	compiler = webpack
		# context: __dirname + "/src"
		entry: './src/test.js'
		output: 
			path: __dirname + "/dist"
			filename: 'bundle.js'
		module:
			loaders: [
				test: /\.coffee$/
				loader: "coffee-loader"
			]
		resolve:
			root: __dirname + "/src"
			
	compiler.run (err, stats) ->
	watcher = compiler.watch 200, (err, stats) ->
		console.log "build over"

	# console.log watcher