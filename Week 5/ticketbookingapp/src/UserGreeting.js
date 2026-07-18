import React from "react";
import FlightDetails from "./FlightDetails";

function UserGreeting() {
  return (
    <div>
      <h1>Welcome Back</h1>

      <p>You can now book your tickets.</p>

      <FlightDetails />

      <br />

      <button>Book Ticket</button>
    </div>
  );
}

export default UserGreeting;