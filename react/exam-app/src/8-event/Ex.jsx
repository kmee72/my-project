//Ex.jsx
//연습문제1: 마우스 오버와 마우스 아웃 이벤트
// 목표: onMouseEnter와 onMouseLeave 이벤트를 사용하여
//  마우스가 특정 영역에 들어오거나 나갈 때 상태를 변경하는 방법을 학습합니다.
// 요구사항: 다음 조건에 맞는 컴포넌트를 작성하세요.
// 마우스가 박스 위에 올라가면 DIV 배경색이 변경됩니다.
// 마우스가 박스를 벗어나면 원래 배경색으로 돌아옵니다.
// 상태로 관리되는 메시지를 화면에 출력하세요.
//    (예: "마우스가 들어왔습니다", "마우스가 나갔습니다")

import { useState } from "react";

export function Event4() {
  const [message, setMessage] = useState("박스에 마우스를 올려보세요.");
  const [color, setColor] = useState("pink");

  const handleMouseEnter = () => {
    setColor("pink");
    setMessage("마우스가 들어왔습니다.");
  };
  const handleMouseLeave = () => {
    setColor("skyblue");
    setMessage("마우스가 나갔습니다.");
  };

  return (
    <div
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
      style={{
        width: "200px",
        height: "100px",
        border: "1px solid black",
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
        cursor: "Pointer",
        backgroundColor: color,
      }}
    >
      {message}
    </div>
  );
}

//연습문제2: 폼 제출 이벤트 처리하기
// 목표: onSubmit 이벤트를 통해 폼 제출을 처리하고 기본 동작을 방지하는 방법
//요구사항 - 다음 조건에 맞는 컴포넌트를 작성하세요.
// 1.사용자 이름과 나이를 입력하는 폼을 만드세요.
// 2.폼이 제출되면 입력값을 콘솔에 출력하고 입력 필드를 비웁니다.
// 3.기본 폼 제출 동작을 방지하세요 (e.preventDefault() 사용).

export function Event5() {
  const [submit, setSubmit] = useState({
    name: "",
    age: "",
  });
  const handleChange = (e) => {
    const { name, value } = e.target;
    setSubmit({
      ...submit,
      [name]: value,
    });
  };
  const handleSubmit = (e) => {
    e.preventDefault();
    console.log("제출된 데이터:", submit);
    setSubmit({ name: "", age: "" });
  };
  return (
    <div
      style={{
        display: "flex",
        justifyContent: "center",
        flexDirection: "column",
        width: "250px",
        padding: "20px",
      }}
    >
      <form
        onSubmit={handleSubmit}
        style={{
          display: "flex",
          flexDirection: "column",
          gap: "10px",
        }}
      >
        <h3 style={{ textAlign: "center" }}>폼 제출 예제</h3>
        <input
          name="name"
          type="text"
          placeholder="이름"
          value={submit.name}
          onChange={handleChange}
        ></input>
        <input
          name="age"
          type="number"
          placeholder="나이"
          value={submit.age}
          onChange={handleChange}
        ></input>

        <button
          type="submit"
          style={{
            width: "100px",
            alignSelf: "center",
            padding: "8px",
          }}
        >
          제출하기
        </button>
      </form>
    </div>
  );
}

// 연습문제 3: 입력 필드에서 글자 수 제한하기
// 목표: 입력 필드의 입력값을 상태로 관리하고 글자 수 제한하는 방법을 학습합니다.
// 요구사항: 다음 조건에 맞는 컴포넌트를 작성하세요.
// 1.사용자가 텍스트를 입력할 수 있는 입력 필드가 있습니다.
// 2.입력값은 최대 10자까지만 허용됩니다.
// 3.입력값의 길이에 따라 남은 글자 수를 화면에 표시하세요.
export function Event6() {
  const [inputText, setInputText] = useState("");
  const maxLength = 10;
  const handleChange = (e) => {
    const value = e.target.value;
    if (value.length <= maxLength) {
      setInputText(value);
    }
  };

  return (
    <div
      style={{
        display: "flex",
        justifyContent: "center",
        flexDirection: "column",
        width: "250px",
        padding: "20px",
      }}
    >
      <h2
        style={{
          textAlign: "center",
        }}
      >
        글자 수 제한 입력 필드
      </h2>
      <input
        type="text"
        placeholder="최대 10자 입력가능"
        value={inputText}
        onChange={handleChange}
        style={{
          width: "250px",
          height: "100px",
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
        }}
      />
      <h4
        style={{
          textAlign: "center",
        }}
      >
        남은 글자수:{maxLength - inputText.length}
      </h4>
    </div>
  );
}
