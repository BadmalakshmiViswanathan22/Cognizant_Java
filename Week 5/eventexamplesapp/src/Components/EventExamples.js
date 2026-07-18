import React, { useState } from "react";
import CurrencyConvertor from "./CurrencyConvertor";

function EventExamples() {

  const [count, setCount] = useState(0);

  // Increment Counter
  const increment = () => {
    setCount(count + 1);
  };

  // Decrement Counter
  const decrement = () => {
    setCount(count - 1);
  };

  // Say Hello
  const sayHello = () => {
    alert("Hello! Have a nice day.");
  };

  // Multiple Methods
  const increase = () => {
    increment();
    sayHello();
  };

  // Welcome Message
  const sayWelcome = (msg) => {
    alert(msg);
  };

  // Synthetic Event
  const onPress = (e) => {
    alert("I was clicked");
  };

  return (
    <div style={{ textAlign: "center", marginTop: "30px" }}>
      <h1>React Event Examples</h1>

      <h2>Counter : {count}</h2>

      <button onClick={increase}>Increment</button>

      <button onClick={decrement} style={{ marginLeft: "10px" }}>
        Decrement
      </button>

      <br /><br />

      <button onClick={() => sayWelcome("Welcome")}>
        Say Welcome
      </button>

      <br /><br />

      <button onClick={onPress}>
        OnPress
      </button>

      <br /><br />

      <CurrencyConvertor />

    </div>
  );
}

export default EventExamples;