gulp = require 'gulp'
chalk = require 'chalk'
webpack = require 'webpack'
path = require 'path'

gulp.task 'default', ['startWebpack']

gulp.task 'startWebpack', ->
	compiler = webpack
		# context: __dirname + "/src"
		devtool: 'sourcemap'
		debug: true
		entry: './src/test.js'
		output: 
			path: __dirname + "/dist"
			filename: 'bundle.js'
			sourceMapFilename: "[file].map"
		module:
			loaders: [
				test: /\.coffee$/
				loader: "coffee-loader"
			]
		resolve:
			root: [
				path.join(__dirname, "bower_components")
			]
			extensions: [
				'' # required to get other exts working
				'.coffee'
				'.js'
			]
		plugins: [
			new webpack.ResolverPlugin(
				new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin("bower.json", ["main"])
			)
		]
			
	compiler.run (err, stats) ->
	watcher = compiler.watch 200, (err, stats) ->
		if err 
			console.log chalk.red "COMPILER ERROR"

		console.log chalk.green "Build over"
		console.log stats.endTime - stats.startTime + 'ms'

	# console.log watcher