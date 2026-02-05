import * as E from "./2-jsx/Jsx";
import Library from "./2-jsx/Library";
import * as Ex from "./2-jsx/Ex";

function App() {
  // 리액트 엘리먼트는 바로가능(한줄일때) 단 JSX 태그안에서는 { element }형식으로 반환.
  // return E.E1;
  // return E.E2;
  // return E.E3;
  // return E.E4;
  // return E.E5;
  //return E.E6;

  //함수형 component
  // return <Library />;

  //  return <Ex.Hello name="홍길동" />;
  // return <Ex.Sum num1={10} num2={20} />;
  // return <Ex.DrinkMachine price={1000} />;
  return <Ex.Greeting hour={15} />;
}
export default App;
