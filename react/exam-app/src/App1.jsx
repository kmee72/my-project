// import { element2 } from "./1-element/Element";
import { element1, element2 } from "./1-element/Element";
//와일드카드 임포트 방식
import * as E from "./1-element/Element";

function App() {
  //리액트 엘리먼트
  // return element2;
  //리액트 엘리먼트는 {element} 중괄호로 렌더링하고,
  //리액트 컴퍼넌트(함수형, 클래스형) => <Element1 /> 태그형식으로 렌더링
  return (
    <>
      {E.element1}
      {element1}
      {element2}
      {E.element3}
      {E.element4}
      {E.element5}
      <E.Hello name="홍길동" />
    </>
  );
}
export default App;
