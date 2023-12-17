import React from 'react';

function TwoSubApp(props) {


    return (
        <div style={{marginLeft:'100px'}}>
            <b>메세지</b>
            <input type='text' className='form-control'
            style={{width:'400px'}} 
            onChange={(e)=>{
                props.onMessage(e.target.value);
            }}/>
            <br/>
            <b>글자색변경</b>
            <input  type='color' defaultValue='#ffc'
            className='form-control' style={{width:'400px'}}
            onChange={(e)=>{
                props.onColor(e.target.value);
            }}/>
            <br/>
            <b>이미지변경</b>
            <select className='form-control'style={{width:'400px'}}
            onChange={(e)=>{
                props.onPhoto(e.target.value);
            }}>
                {
                    [...new Array(10)].map((a,idx)=>(<option>{`s${idx+1}`}</option>))
                }
            </select>
        </div>
    );
}

export default TwoSubApp;