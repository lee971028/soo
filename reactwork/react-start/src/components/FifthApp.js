import React, { useState } from 'react';

function FifthApp(props) {

    const [name,setName]=useState('');
    const [java,setJava]=useState(0);
    const [react,setReact]=useState(0);
    const [total,setTotal]=useState(0);
    const [avg,setAvg]=useState(0);

    return (
        <div>
            <h2 className='alert alert-danger'>FifthApp입니다</h2>
            <div className='inp'>
               이름: <input  type='text' style={{width:'100px'}}
               onChange={(e)=>{
                  setName(e.target.value);
               }}/>
               <span style={{marginLeft:'10px'}}>{name}</span><br/><br/>
               자바점수: <input  type='text' style={{width:'100px'}}
               onChange={(e)=>{
                setJava(e.target.value);
             }}/>
               <span style={{marginLeft:'10px'}}>{java}</span><br/><br/>
               리액트점수: <input  type='text' style={{width:'100px'}}
               onChange={(e)=>{
                setReact(e.target.value);
             }}/>
               <span style={{marginLeft:'10px'}}>{react}</span><br/><br/>
            <button type='button' className='btn btn-outline-info'
            onClick={()=>{
                setTotal(Number(java)+Number(react));
                setAvg((Number(java)+Number(react))/2);
            }}>결과보기</button>
               
            </div>
            <div className='result'>
                [시험결과]<br/>
                이름:{name}<br/>
                자바점수:{java}<br/>
                리액트점수:{react}<br/>
                총점:{total}점<br/>
                평균:{avg}점<br/>
            </div>
        </div>
    );
}

export default FifthApp;