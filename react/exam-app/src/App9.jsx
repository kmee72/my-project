import * as E from "./9-conditional-render/Ex";

// function App() {
//   return (
//     <>
//       <E.User />
//       <E.User user={{ name: "홍길동", email: "gm@example.com" }} />
//     </>
//   );
// }
// function App() {
//   return (
//     <>
//       <E.Notification />
//       <E.Notification count={5} />
//     </>
//   );
// }
function App() {
  return (
    <>
      <E.Advertisement isPremium={true} />
      <E.Advertisement isPremium={false} />
    </>
  );
}
export default App;
