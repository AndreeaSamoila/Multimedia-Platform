import * as React from 'react';
import './Drawer.css';
import Box from '@mui/material/Box';
import Drawer from '@mui/material/Drawer';
import Button from '@mui/material/Button';
import List from '@mui/material/List';
import Divider from '@mui/material/Divider';
import ListItem from '@mui/material/ListItem';
import ListItemButton from '@mui/material/ListItemButton';
import ListItemIcon from '@mui/material/ListItemIcon';
import ListItemText from '@mui/material/ListItemText';
import InboxIcon from '@mui/icons-material/MoveToInbox';
import MailIcon from '@mui/icons-material/Mail';
import MenuIcon from '@mui/icons-material/Menu';
import IconButton from '@mui/material/IconButton';
import {Link,  useNavigate } from "react-router-dom";

function DrawerPage() {
    const [state, setState] = React.useState({
        left: false,
    });
    const navigate = useNavigate();

    const toggleDrawer = (anchor, open) => (event) => {
        if (event.type === 'keydown' && (event.key === 'Tab' || event.key === 'Shift')) {
            return;
        }

        setState({ ...state, [anchor]: open });
    };

    const handleClick = (page) => {
        return function() {
            navigate(`/${page}`);

        }
    }

    // const handleClickop = (page) => function () {
    //         navigate(`/${page}`);
    //     }
    // }

    const list = (anchor) => (
        <Box
            sx={{ width: anchor === 'top' || anchor === 'bottom' ? 'auto' : 250 }}
            role="presentation"
            onClick={toggleDrawer(anchor, false)}
            onKeyDown={toggleDrawer(anchor, false)}
        >
            <List>
                {['Courses', 'Forum', 'About', 'Contact'].map((text, index) => (
                    <ListItem key={text} disablePadding>
                        <ListItemButton onClick={handleClick(text)}>
                            <ListItemIcon>
                                {index % 2 === 0 ? <InboxIcon /> : <MailIcon />}
                            </ListItemIcon>
                            <ListItemText primary={text} />
                        </ListItemButton>
                    </ListItem>
                ))}
            </List>
            <Divider />

        </Box>
    );

    const anchor = 'left';

    return (
        <div>
            <React.Fragment key={anchor}>
                <IconButton onClick={toggleDrawer(anchor, true)}
                style={{color: 'white'}}>
                    <MenuIcon/>
                </IconButton>
                <Drawer
                    anchor={anchor}
                    open={state[anchor]}
                    onClose={toggleDrawer(anchor, false)}
                >
                    {list(anchor)}
                </Drawer>
            </React.Fragment>
        </div>
    );
}


export default DrawerPage;