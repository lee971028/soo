import axios from 'axios';
import React, { useEffect, useState } from 'react';

function Logout(props) {

    const [name,setName]=useState('');
    let id=localStorage.myid;

    const initFunc=()=>{

        const url="http://localhost:9000/member/getname?id="+id;
        axios.get(url)
        .then(res=>{
            setName(res.data);
        })
    }

    const btnLogout=()=>{
        localStorage.removeItem("loginok");
        localStorage.removeItem("myid");
        window.location.reload();
    }

    useEffect(()=>{
        initFunc();  //처음랜더링시 한번만 호출
    },[]);

    return (
        <div>
            <b style={{marginLeft:'100px'}}>{name}님 로그인중...</b>
            <button type='button' className='btn btn-danger'
            style={{marginLeft:'50px'}}  onClick={btnLogout}>로그아웃</button>
        </div>
    );
}

export default Logout;