
stir = require 'stir-template'
React = require 'react'
config = require 'config'

assetLinks = require '../packing/asset-links'

Page = React.createFactory require '../src/page'

{html, head, title, body, meta, script, link, div, a, span} = stir

module.exports = (data) ->

  stir.render stir.doctype(),
    html null,
      head null,
        title null, "Coffee Webpack Starter"
        meta charset: 'utf-8'
        link rel: 'icon', href: 'http://tp4.sinaimg.cn/5592259015/180/5725970590/1'
        if assetLinks.style?
          link rel: 'stylesheet', href: assetLinks.style
        script src: assetLinks.vendor, defer: true
        script src: assetLinks.main, defer: true
      body null,
        div class: 'intro',
          div class: 'title', "This is a demo of Webpack usage."
          div class: 'line', "Open Console to see how it loads."
          div null,
            span null, "Read more at "
            a href: 'http://github.com/teambition/coffee-webpack-starter',
              'github.com/teambition/coffee-webpack-starter'
            span null, '.'
        div class: 'demo',
          React.renderToString Page()
