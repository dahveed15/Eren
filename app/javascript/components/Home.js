import React from "react"
import PropTypes from "prop-types"
class Home extends React.Component {
  render () {
    return (
      <React.Fragment>
        <div className='center-home-contents'>
          <h1>{this.props.greeting}</h1>
          <div>
            <a className='add-machine-button' href='/'>Add Machine</a>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

Home.propTypes = {
  greeting: PropTypes.string
};
export default Home;
