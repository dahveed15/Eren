import React from "react"
import PropTypes from "prop-types"
class Home extends React.Component {
  render () {
    return (
      <React.Fragment>
        {this.props.greeting}
        <button>Add Machine</button>
      </React.Fragment>
    );
  }
}

Home.propTypes = {
  greeting: PropTypes.string
};
export default Home;
