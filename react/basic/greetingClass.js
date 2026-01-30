// import React from "react";
// React.js 8 이상에서는 import필요없음.

class Greeting extends React.Component {
  render() {
    return <h1 className="greeting"> Hello World!</h1>;
  }
}
const root = ReacDOM.createRoot(document.getElementById("root"));
root.render(React.createElement(Greeting));
