import logo from './logo.svg';
import './App.css';
import ResponsiveAppBar from "./dashboard/AppBar";
import Dashboard from "./dashboard/Dashboard";
import Courses from "./dashboard/Courses";
import {BrowserRouter, Routes, Route} from "react-router-dom";
import Forum from "./dashboard/Forum";
import About from "./dashboard/About";
import Contact from "./dashboard/Contact";


function App() {


    return (
        <div className="App">


            <BrowserRouter>
                <ResponsiveAppBar></ResponsiveAppBar>
                <Routes>
                    <Route path="/" element={<Dashboard/>}/>
                    <Route path="/Courses" element={<Courses/>}/>
                    <Route path="/Forum" element={<Forum/>}/>
                    <Route path="/About" element={<About/>}/>
                    <Route path="/Contact" element={<Contact/>}/>
                </Routes>
            </BrowserRouter>


        </div>
    );
}

export default App;
