import React from "react"
import ReactDom from "react-dom"

class MainComponent extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {
    let verbs = this.props.verbs.map( v => {
      return (
        <div key={v.yomi}>{v.midashi}</div>
      );
    });
    return (

      <div>
        <h2>Verbs</h2>
        {verbs}
      </div>

    )
  };
}
export default MainComponent;
