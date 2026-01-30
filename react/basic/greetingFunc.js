//생성자함수이므로, 첫글자는 대문자로 한다.
function Greeting() {
  return <h1 className="greeting">Hello world!</h1>;
}

const root = ReactDom.createRoot(document.getElementById("root"));
root.render(React.createElement(Greeting));
