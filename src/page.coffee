
React = require 'react'

div = React.createFactory 'div'

module.exports = React.createClass
  displayName: 'app-page'

  render: ->
    div className: 'app-page',
      'Empty Page'
