var webpack = require('webpack');
var ExtractTextPlugin = require("extract-text-webpack-plugin");

var plugins = [];

plugins.push(
  new ExtractTextPlugin('../css/theme.css')
);

module.exports = [{
  // JavaScript
  entry: [
    './js/theme.js',
    './css/normalize.css',
    './css/example.less',
    './css/st/dev.styl',
    './css/theme.scss'
  ],
  output: {
    path: '../assets/js',
    filename: 'theme.js'
  },
  module: {
    loaders:  [{
      test: /\.js$/,
      exclude: /node_modules/,
      loaders: ['babel-loader']
    }, {
      test: /\.scss$/,
      loader: ExtractTextPlugin.extract(
          "style",
          "css-loader?sourceMap!postcss!sass-loader?sourceMap"
      )
    }, {
      test: /\.styl$/,
      loader: ExtractTextPlugin.extract(
          "style",
          "css-loader?sourceMap!postcss!stylus-loader?sourceMap"
      )
    }, {
      test: /\.less$/,
      loader: ExtractTextPlugin.extract(
          "style",
          "css-loader?sourceMap!postcss!less-loader?sourceMap"
      )
    }, {
      test: /\.css$/,
      loader: ExtractTextPlugin.extract(
          'style',
          'css-loader?sourceMap!postcss-loader'
      )
    }, {
      test: /.(png|woff(2)?|eot|ttf|svg|jpg)(\?[a-z0-9=\.]+)?$/,
      loader: 'file-loader?name=../css/[hash].[ext]'
    }]
  },
  externals: {
    prestashop: 'prestashop'
  },
  plugins: plugins,
  resolve: {
    extensions: ['', '.js', '.scss', '.styl', '.less', '.css']
  }
}];
