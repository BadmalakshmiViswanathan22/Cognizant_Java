import React from "react";

function App() {
  const offices = [
    {
      Name: "DBS",
      Rent: 50000,
      Address: "Chennai",
      Image: "https://via.placeholder.com/250"
    },
    {
      Name: "Regus",
      Rent: 75000,
      Address: "Bangalore",
      Image: "https://via.placeholder.com/250"
    },
    {
      Name: "WeWork",
      Rent: 65000,
      Address: "Hyderabad",
      Image: "https://via.placeholder.com/250"
    }
  ];

  return (
    <div style={{ marginLeft: "50px" }}>
      <h1>Office Space, at Affordable Range</h1>

      {offices.map((item, index) => (
        <div key={index}>
          <img
            src={item.Image}
            alt="Office Space"
            width="250"
            height="250"
          />

          <h2>Name: {item.Name}</h2>

          <h3
            style={{
              color: item.Rent < 60000 ? "red" : "green"
            }}
          >
            Rent: Rs. {item.Rent}
          </h3>

          <h3>Address: {item.Address}</h3>
          <hr />
        </div>
      ))}
    </div>
  );
}

export default App;