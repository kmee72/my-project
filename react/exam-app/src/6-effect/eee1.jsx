//eee1.jsx
import React, { useState, useEffect } from "react";

export function DataFetchJS() {
  const [data, setData] = useState([]); // 1. 상태선언(State Management): 
  // 서버에서 받아온 데이터를 저장하고 관리
  // 역할 : API로부터 받아온 데이터를 컴포넌트 내부의 "메모리"에 저장 , [?컴포넌트 내부]
  // 왜 하는가? : React는 일반 변수 값이 바뀐다고 화면을 다시 그리지 않습니다.
  //              setData를 통해 상태를 업데이트해야만 React가
  //              "아, 데이터가 바뀌었으니 화면을 다시 그려야겠구나!"라고 인지합니다.

  const fetchData = async () => {
    //2. 비동기 데이터 로직(Data Fetching): 비동기 통신을 처리
    //역할 : 외부 서버(jsonplaceholder)와 통신하여 데이터를 
    // 가져오는 실행 부대입니다.
    //fetch를 통해 데이터를 요청하고, 응답이 올 때까지 
    // 기다린(await) 후 JSON 형태로 변환합니다.
    //async/await: 비동기 통신(기다림이 필요한 작업)을 마치 
    // 동기 코드처럼 순차적으로 읽히게 해줍니다.
    //response.ok & throw Error: 서버 통신은 성공했지만 
    // 데이터가 없는 경우(404, 500 에러 등)를
    //  대비한 예외 처리입니다.
    //slice(0, 10): 100개의 방대한 데이터 중 상위 10개만 
    // 골라내어 가독성을 높였습니다.
    // try...catch를 사용하는 습관을 들이면 통신 에러 대응에 좋습니다.
    try {
      const response = await fetch(
        "https://jsonplaceholder.typicode.com/posts ",
      );
      if (!response.ok) {
        throw new Error("네트워크 응답이 올바르지 않습니다.");
      }
      const result = await response.json();
      setData(result.slice(0, 10));
    } catch (error) {
      console.error("데이타 가져오기 실패", error);
    }
  };

  useEffect(() => {
    //3. 생명주기(Lifecycle) 관리
    //역할: "이 작업(데이터 가져오기)을 언제 실행할 것인가?"를 결정합니다
    //React 컴포넌트가 화면에 처음 그려진 직후에만 fetchData를 호출하도록 제어합니다.
    // 만약 두 번째 인자인 의존성 배열([])을 생략하면, 컴포넌트가 업데이트될
    //  때마다 데이터를 계속 불러오게 됩니다.
    //의존성 배열 []: 배열이 비어있으면 컴포넌트가 브라우저에 처음 
    // 나타날 때(Mount) 딱 한 번만 실행됩니다.
    // 만약 이 설정이 없다면, setData로 화면이 바뀔 때마다 다시 fetchData가 
    // 실행되는 무한 루프에 빠질 수 있습니다.
    console.log("DidMount");
    fetchData(); //마운드시에 한번만 호출.
  }, []);

  return (
    <div>
      <h1>fetch 통신으로 가져온 데이터</h1>
      <ul>
        {data.map(
          (
            post, //4. 배열 형태의 데이터를 HTML 요소로 변환합니다.
          ) => (
            //data.map()을 사용하여 배열 안의 객체들을 반복적으로 렌더링하며,
            //이때 key 값(여기서는 item.id)을 반드시 지정해줘야 React가 효율적으로
            //  화면을 갱신합니다.
            //key={post.id}: React가 리스트의 각 항목을 고유하게 식별하게 해주는
            //  필수 속성입니다.
            // 이를 통해 데이터가 변경될 때 바뀐 부분만 빠르게 업데이트할 수 있습니다.
            <li key={post.id}>{post.title}</li>
          ),
        )}
      </ul>
    </div>
  );
}
