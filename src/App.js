
import './App.css';
import ResponsiveAppBar from "./dashboard/AppBar";
import Dashboard from "./dashboard/Dashboard";
import Courses from "./dashboard/Courses";
import {BrowserRouter, Routes, Route} from "react-router-dom";
import Forum from "./dashboard/Forum";
import About from "./dashboard/About";
import Contact from "./dashboard/Contact";
import Profile from "./account/Profile";
import Account from "./account/Account";
import Login from "./account/Login";
import Events from "./dashboard/Events";
import FAQ from "./dashboard/FAQ";
import Chat from "./chat/chat";




function App() {


    return (
        <div className="App">


            <BrowserRouter>
                <ResponsiveAppBar></ResponsiveAppBar>
                <Routes>
                    <Route path="/" element={<Dashboard/>}/>
                    <Route path="/Courses" element={<Courses/>}/>
                    <Route path="/Events" element={<Events/>}/>
                    <Route path="/FAQ" element={<FAQ/>}/>
                    <Route path="/Forum" element={<Forum/>}/>
                    <Route path="/About" element={<About/>}/>
                    <Route path="/Contact" element={<Contact/>}/>
                    <Route path="/Profile" element={<Profile/>}/>
                    <Route path="/MyAccount" element={<Account/>}/>
                    <Route path="/Login" element={<Login/>}/>
                    <Route path="/Let's talk" element={<Chat/>}/>

                </Routes>
            </BrowserRouter>


        </div>
    );
}

export default App;
