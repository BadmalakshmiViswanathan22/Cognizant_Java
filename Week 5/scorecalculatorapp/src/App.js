import './App.css';
import CalculateScore from './Components/CalculateScore';

function App() {
  return (
    <div className="App">
      <CalculateScore
        Name="Steeve"
        School="DNV Public School"
        Total={284}
        goal={300}
      />
    </div>
  );
}

export default App;