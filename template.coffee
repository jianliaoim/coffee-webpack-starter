
stir = require 'stir-template'
React = require 'react'

Page = React.createFactory require './src/page'

{html, head, title, body, meta, script, link, div, a, span} = stir

line = (text) ->
  div class: 'line', text

module.exports = (data) ->
  stir.render stir.doctype(),
    html null,
      head null,
        title null, "Coffee Webpack Starter"
        meta charset: 'utf-8'
        link
          rel: 'icon'
          href: 'http://tp4.sinaimg.cn/5592259015/180/5725970590/1'
        link
          rel: 'stylesheet'
          href: if data.dev then 'src/main.css' else data.style
        script src: data.vendor, defer: true
        script src: data.main, defer: true
      body null,
        div class: 'intro',
          div class: 'title', "This is a demo of Webpack usage."
          line "Open Console to see how it loads."
          div null,
            span null, "Read more at "
            a href: 'http://github.com/teambition/coffee-webpack-starter',
              'github.com/teambition/coffee-webpack-starter'
            span null, '.'
        div class: 'demo',
          React.renderToString Page()
