gulp = require 'gulp'
chalk = require 'chalk'
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
			extensions: [
				''
				'.coffee'
				'.js'
			]
			
	compiler.run (err, stats) ->
	watcher = compiler.watch 200, (err, stats) ->
		if err 
			console.log chalk.red "COMPILER ERROR"

		console.log chalk.green "Build over"
		console.log stats.endTime - stats.startTime + 'ms'

	# console.log watcher