// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Home React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

const Home = props => (
  <div>Home {props.name}!</div>
)

Home.defaultProps = {
  name: 'David'
}

Home.propTypes = {
  name: PropTypes.string
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Home name="React" />,
    document.body.appendChild(document.createElement('div')),
  )
})
