
webpack = require('webpack')
config = require('./webpack.config')
fs = require('fs')
ExtractTextPlugin = require 'extract-text-webpack-plugin'

fontName = 'fonts/[name].[ext]'

module.exports =
  entry:
    vendor: []
    main: ['./src/main', './src/main.css']
  output:
    path: 'build/'
    filename: '[name].[chunkhash:8].js'
    publicPath: './build/'
  resolve: config.resolve
  module:
    loaders: [
      {test: /\.coffee$/, loader: 'coffee'}
      {test: /\.less$/, loader: 'style!css!less'}
      {test: /\.css$/, loader: ExtractTextPlugin.extract('style-loader', 'css!autoprefixer')}
      {test: /\.(eot|woff|woff2|ttf|svg)((\?|\#)[\?\#\w\d_-]+)?$/, loader: "url", query: {limit: 100, name: fontName}}
    ]
  plugins: [
    new webpack.optimize.CommonsChunkPlugin('vendor', 'vendor.[chunkhash:8].js')
    new (webpack.optimize.UglifyJsPlugin)(sourceMap: false)
    new ExtractTextPlugin("style.[chunkhash:8].css")
    ->
      @plugin 'done', (stats) ->
        content = JSON.stringify(stats.toJson().assetsByChunkName, null, 2)
        fs.writeFileSync 'build/assets.json', content
  ]
