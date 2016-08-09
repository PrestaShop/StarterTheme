var webpack = require('webpack');
var path = require('path');
var ExtractTextPlugin = require("extract-text-webpack-plugin");

var plugins = [];

var production = false;

if (production) {
  plugins.push(
    new webpack.optimize.UglifyJsPlugin({
      compress: {
        warnings: false
      }
    })
  );
}

plugins.push(
  new ExtractTextPlugin(
    path.join(
      '..', 'css', 'theme.css'
    )
  )
);

module.exports = {
  entry: [
    './css/normalize.css',
    './css/example.less',
    './css/st/dev.styl',
    './css/theme',
    './js/theme.js'
  ],
  output: {
    path: '../assets/js',
    filename: 'theme.js'
  },
  devtool: 'source-map',
  module: {
    loaders: [{
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
      test: /.(png|woff(2)?|eot|ttf|svg)(\?[a-z0-9=\.]+)?$/,
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
};
