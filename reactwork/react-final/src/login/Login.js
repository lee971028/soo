import React from 'react';
import LoginForm from './LoginForm';
import Logout from './Logout';

function Login(props) {


   let loginok=localStorage.loginok;

    return (
        <div style={{marginLeft:'100px'}}>
           {
            loginok==null?<LoginForm/>:<Logout/>
           }
        </div>
    );
}

export default Login;