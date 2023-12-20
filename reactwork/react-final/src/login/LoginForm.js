import axios from 'axios';
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

function LoginForm(props) {

    const [id,setId]=useState('');
    const [pass,setPass]=useState('');
    const navi=useNavigate();

    const onLogin=(e)=>{

        e.preventDefault();

        const url="http://localhost:9000/member/login";

        axios.post(url,{id,pass})
        .then(res=>{
            console.log(res.data);

            if(res.data===0){
                alert("아이디 또는 비번이 맞지않아요");
            }else{
                localStorage.loginok="yes";
                localStorage.myid=id;
                window.location.reload(); //새로고침
            }
        })
    }



    return (
        <div>
            <form onSubmit={onLogin}>
             <table className='table table-bordered' style={{width:'300px'}}>
               <caption align='top'><b>회원로그인</b></caption>
                <tr>
                    <td style={{width:'200px'}}>
                        <input type='text' placeholder='아이디'
                        style={{width:'180px'}} className='form-control' required
                        onChange={(e)=>{
                            setId(e.target.value);
                        }}/>
                    </td>
                    <td rowSpan={2}>
                        <button type='submit' className='btn btn-info' style={{width:'100px',height:'100px'}}>로그인</button>
                    </td>
                </tr>
                <tr>
                    <td>
                    <input type='password' placeholder='패스워드'
                        style={{width:'180px'}} className='form-control' required
                        onChange={(e)=>{
                            setPass(e.target.value);
                        }}/>
                    </td>
                </tr>
            </table>
            </form>
        </div>
    );
}

export default LoginForm;