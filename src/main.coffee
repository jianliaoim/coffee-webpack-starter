
React = require 'react'

require('volubile-ui/ui/index.less')

Page = React.createFactory require './page'

React.render Page(), document.querySelector('.demo')
