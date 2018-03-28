/**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 */
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
