
var
  stir $ require :stir-template

var
  (object~ html head title body meta script link div a span) stir

var
  line $ \ (text)
    return $ div null text

= module.exports $ \ (data)
  return $ stir.render
    stir.doctype
    html null
      head null
        title null ":Coffee Webpack Starter"
        meta $ object (:charset :utf-8)
        link $ object (:rel :icon)
          :href :http://tp4.sinaimg.cn/5592259015/180/5725970590/1
        link $ object (:rel :stylesheet)
          :href :src/main.css
        script $ object (:src data.vendor) (:defer true)
        script $ object (:src data.main) (:defer true)
      body null
        div
          object (:class :intro)
          div
            object (:class :title)
            , ":This is a demo of Webpack usage."
          line ":Open Console to see how it loads."
          div null
            span null ":Read more at "
            a
              object (:href :http://github.com/teambition/coffee-webpack-starter)
              , :github.com/teambition/coffee-webpack-starter
            span null :.
        div
          object (:class :demo)
