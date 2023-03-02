import * as React from 'react';
import CreditScoreIcon from '@mui/icons-material/CreditScore';
import CalendarMonthOutlinedIcon from '@mui/icons-material/CalendarMonthOutlined';
import WorkOutlineOutlinedIcon from '@mui/icons-material/WorkOutlineOutlined';
import DesktopWindowsOutlinedIcon from '@mui/icons-material/DesktopWindowsOutlined';
import PriceCheckOutlinedIcon from '@mui/icons-material/PriceCheckOutlined';
import './Dashboard.css';


function Dashboard() {



    return (
        <div>
        <div>
                <div className="dashBg">
                    <div className="text-center">
                    <h1 className="title"><span>Learn to code from anywhere. Pay when you’re done. Build a career for life.</span></h1>
                    </div>

                <div className="section">

                <div className="item-section">
                    <CalendarMonthOutlinedIcon  className="icons"></CalendarMonthOutlinedIcon>

                    <div className="description">
                    <h3><span>10-month course</span></h3>
                    <p>Learn remotely or on campus</p>
                    </div>
                </div>

                <div className="item-section">
                    <WorkOutlineOutlinedIcon className="icons"></WorkOutlineOutlinedIcon>

                    <div className="description">
                    <h3><span>Guaranteed job in IT</span></h3>
                    <p>At 450+ partner companies across Europe</p>
                    </div>
                </div>

                <div className="item-section">
                    <PriceCheckOutlinedIcon className="icons"></PriceCheckOutlinedIcon>
                    <div className="description">
                    <h3><span>40,000-60,000€ annual salary</span></h3>
                    <p>After 2-3 years of work experience, depending on the country</p>
                    </div>
                </div>

                <div className="item-section">
                    <DesktopWindowsOutlinedIcon className="icons"></DesktopWindowsOutlinedIcon>
                    <div className="description">
                    <h3><span>Full flexibility</span></h3>
                    <p>Study and work where you choose</p>
                        </div>
                </div>

                <div className="item-section">
                    <CreditScoreIcon className="icons"></CreditScoreIcon>
                    <div className="description">
                    <h3><span>Learn now, pay later</span></h3>
                    <p>Pay monthly after you're hired</p>
                    </div>
                </div>

            </div>
                    <div className="center-btn">
                        <button className="btn" >
                            <div>FULLSTACK DEVELOPMENT COURSE</div>
                        </button>
                    </div>
                    <div>
                        <a className="align-anchor" href="www.google.com" role="button">All courses</a>
                    </div>

        </div>

        </div>
        </div>
    )
}

export default Dashboard;