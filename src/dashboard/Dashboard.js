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
                    <h1 className="title"><span>Învață programare de oriunde. Plătește abia după ce finalizezi. Construiește-ți o carieră pentru întreaga viață</span></h1>
                    </div>

                <div className="section">

                <div className="item-section">
                    <CalendarMonthOutlinedIcon  className="icons"></CalendarMonthOutlinedIcon>

                    <div className="description">
                    <h3><span>Invata in 10 luni</span></h3>
                    <p>online sau in campus</p>
                    </div>
                </div>

                <div className="item-section">
                    <WorkOutlineOutlinedIcon className="icons"></WorkOutlineOutlinedIcon>

                    <div className="description">
                    <h3><span>Job garantat în IT</span></h3>
                    <p>la una dintre companiile noastre partenere</p>
                    </div>
                </div>

                <div className="item-section">
                    <PriceCheckOutlinedIcon className="icons"></PriceCheckOutlinedIcon>
                    <div className="description">
                    <h3><span>7000 RON* salariu minim</span></h3>
                    <p>pe care îl poți dubla în mai puțin de 2 ani</p>
                    </div>
                </div>

                <div className="item-section">
                    <DesktopWindowsOutlinedIcon className="icons"></DesktopWindowsOutlinedIcon>
                    <div className="description">
                    <h3><span>Flexibilitate totală</span></h3>
                    <p>Tu alegi de unde vrei să studiezi și să lucrezi</p>
                        </div>
                </div>

                <div className="item-section">
                    <CreditScoreIcon className="icons"></CreditScoreIcon>
                    <div className="description">
                    <h3><span>Învață acum, plătește după</span></h3>
                    <p>Achită în rate abia după ce te angajezi</p>
                    </div>
                </div>

            </div>
                    <div className="center-btn">
                        <button className="btn" >
                            <div>FULLSTACK DEVELOPER</div>
                        </button>
                    </div>
                    <div>
                        <a className="align-anchor" href="www.google.com" role="button">Vezi toate cursurile</a>
                    </div>

        </div>

        </div>
        </div>
    )
}

export default Dashboard;