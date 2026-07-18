import React from "react";
import "../Stylesheets/mystyle.css";

function CalculateScore(props) {

  const score = ((props.Total / props.goal) * 100).toFixed(2);

  return (
    <div className="container">
      <h1>Student Details:</h1>

      <h2>
        <span className="label">Name:</span> {props.Name}
      </h2>

      <h2>
        <span className="label">School:</span> {props.School}
      </h2>

      <h2>
        <span className="label">Total:</span> {props.Total}Marks
      </h2>

      <h2>
        <span className="score">Score:</span> {score}%
      </h2>
    </div>
  );
}

export default CalculateScore;