import logo from './logo.svg';
import './App.css';
import Quiz from './component/Quiz';

function App() {
    return (
        <div className='App'>
            <header>Szótár</header>
            <h1>Szavak</h1>
            <Quiz />
        </div>
    )
}

export default App;
