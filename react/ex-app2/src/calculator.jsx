import React, { useState } from "react";
const style = {
  container: {
    margin: "20px auto",
    padding: "10px 30px 60px",
    width: "250px",
    border: "1px solid black",
    textAlign: "center",
  },
  inputNumber: {
    marginBottom: "10px",
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
  },
  input: {
    padding: "10px",
    width: "150px",
    backgroundColor: "#f4f0f0",
    border: "1px solid black",
    textAlign: "center",
  },
  resultBox: {
    padding: "10px",
    width: "150px",
    backgroundColor: "#a1a0a0",
    textAlign: "center",
  },
  buttonClick: {
    marginTop: "20px",
    display: "flex",
    flexDirection: "column",
    gap: "5px",
    marginTop: "20px",
  },
  blueBtn: {
    padding: "10px",
    backgroundColor: "#3376d2",
    color: "white",
    border: "none",
  },
  redBtn: {
    padding: "10px",
    backgroundColor: "red",
    color: "white",
    border: "none",
  },
};

function Calculator() {
  const [num1, setNum1] = useState("");
  const [num2, setNum2] = useState("");
  const [result, setResult] = useState("");
  const addition = () => setResult(Number(num1) + Number(num2));
  const subtraction = () => setResult(Number(num1) - Number(num2));
  const multiplication = () => setResult(Number(num1) * Number(num2));
  const division = () => {
    if (Number(num2) === 0) {
      alert("0으로 나눌 수 없습니다!");
      return;
    }
    setResult(Number(num1) / Number(num2));
  };
  const clear = () => {
    setNum1("");
    setNum2("");
    setResult("");
  };
  return (
    <div style={style.container}>
      <h1>React App</h1>
      <p>계산기 프로그램을 작성해 보자</p>
      <div style={style.inputNumber}>
        <label>숫자1</label>
        <input
          style={style.input}
          type="number"
          value={num1}
          onChange={(e) => setNum1(e.target.value)}
        />
      </div>
      <div style={style.inputNumber}>
        <label>숫자2</label>
        <input
          style={style.input}
          type="number"
          value={num2}
          onChange={(e) => setNum2(e.target.value)}
        />
      </div>
      <div style={style.inputNumber}>
        <label>연산결과</label>
        <input
          style={style.resultBox}
          type="number"
          value={result}
          onChange={(e) => setResult(e.target.value)}
        />
      </div>
      <div style={style.buttonClick}>
        <button onClick={addition} style={style.blueBtn}>
          덧셈
        </button>
        <button onClick={subtraction} style={style.blueBtn}>
          뺄셈
        </button>
        <button onClick={multiplication} style={style.blueBtn}>
          곱셈
        </button>
        <button onClick={division} style={style.blueBtn}>
          나눗셈
        </button>
        <button onClick={clear} style={style.redBtn}>
          지우기
        </button>
      </div>
    </div>
  );
}
export default Calculator;
