// 연습문제 1: UserProfile 조건부 렌더링 (if-else 사용)
// 문제:
// 전달받은 user 객체의 유무에 따라 서로 다른 JSX 전체를 반환하는 UserProfile 컴포넌트를 작성하세요.

// 요구사항:
// 1. props.user가 존재하면: 사용자의 이름과 이메일이 담긴 UI를 반환합니다.
// 2. props.user가 없으면: "사용자 정보가 없습니다."라는 문구가 담긴 UI를 반환합니다.
// 3. if-else 문을 사용하여 리턴(return) 문 자체를 두 개로 분리하세요.

// 힌트:
// 함수형 컴포넌트 내부에서 if (조건) { return <A />; } else { return <B />; }
// 패턴을 사용하면 조건에 따라 컴포넌트의 렌더링 결과가 완전히 달라집니다.
import React from "react";
function UserProfile({ user }) {
  if (user) {
    return (
      <>
        <h3>[데이터가 있는 경우]</h3>
        <div
          style={{
            height: "100px",
            border: "1px solid green",
            borderRadius: "10px",
            display: "flex",
            flexDirection: "column",
            paddingLeft: "15px",
            lineHeight: "1.0"
          }}
        >
          <h3 style={{ fontSize: "20px", color: "green",  }}>{user.name} </h3>
          <p style={{ marginTop: "1px" }}>{user.email}</p>
        </div>
      </>
    );
  } else {
    return (
      <>
        <h3>[데이터가 없는 경우]</h3>
        <div
          style={{
            padding: "15px",
            width: "auto",
            height: "50px",
            border: "none",
            backgroundColor: "#faecec",
            color: "red",
            borderRadius: "7px",
          }}
        >
          <p>사용자 정보가 없습니다. 로그인이 필요합니다.</p>
        </div>
      </>
    );
  }
}

export function User(props) {
  return <UserProfile user={props.user} />;
}

// 연습문제 2: Notification 컴포넌트 (삼항 연산자 사용)
// 문제:
// 알림 개수에 따라 메시지를 다르게 보여주는 Notification 컴포넌트를 작성하세요.

// 요구사항:
// 1. props.count가 0보다 클 때: "새로운 알림이 {count}개 있습니다."를 렌더링합니다.
// 2. props.count가 0일 때: "새로운 알림이 없습니다."를 렌더링합니다.
// 3. 삼항 연산자(? :)를 사용하여 코드를 간결하게 작성하세요.

// 힌트:
// {조건 ? (참일 때의 UI) : (거짓일 때의 UI)} 구조를 활용합니다.

export function Notification({ count }) {
  return (
    <div>
      {count > 0 ? (
        <p>새로운 알림이 {count}개 있습니다.</p>
      ) : (
        <p>새로운 알림이 없습니다.</p>
      )}
    </div>
  );
}

// 연습문제 3: Advertisement 컴포넌트 (&& 연산자 활용)
// 문제:
// 프리미엄 여부에 따라 서로 다른 안내 문구를 표시하는 Advertisement 컴포넌트를 작성하세요.

// 요구사항:
// 1. props.isPremium이 true일 때: "프리미엄 회원님, 환영합니다!" 문구를 렌더링합니다.
// 2. props.isPremium이 false일 때: "광고 영역" 문구를 렌더링합니다.
// 3. 반드시 논리 연산자(&&)만을 사용하여 두 상태를 모두 처리하세요.

// 힌트:
// {조건 && (참일 때 실행)} 형태를 두 번 사용하여,
// 하나는 isPremium일 때, 다른 하나는 !isPremium일 때 작동하도록 구성합니다.
export function Advertisement(props) {
  return (
    <div style={{ padding: "20px",border: "none", justifyContent: "flex-start",alignItems:"center"}}>
      {props.isPremium && <p style={{height:"50px",paddingTop:"30px",backgroundColor:"#c9ebf3"}}>프리미엄 회원님, 광고없는 서비스를 즐기고 계십니다!</p>}
      {props.isPremium && <p style={{height:"50px",paddingTop:"30px",backgroundColor:"#ddd8d8"}}>이곳은 광고 영역입니다.프리미엄 구도 시 광고가 제거됩니다.</p>}
    </div>
  );
}
