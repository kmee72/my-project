import * as Ex from "./1-element/EX";
const products = [
  { id: 1, name: "노트북", price: 8000 },
  { id: 2, name: "스마트폰", price: 9000 },
  { id: 3, name: "맥미니", price: 10000 },
];
function App() {
  return <Ex.ProductListProps products={plist} />;
}

