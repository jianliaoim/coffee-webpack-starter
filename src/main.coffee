
React = require 'react'

require('volubile-ui/ui/index.less')
require('./main.css')

Page = React.createFactory require './page'

React.render Page(), document.querySelector('.demo')
