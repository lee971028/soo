import React, { useState } from 'react';

function WriteForm({onSave}) {

    const [name,setName]=useState('');
    const [blood,setBlood]=useState('A');
    const [photo,setPhoto]=useState('s1');

    //버튼이벤트
    const addDataEvent=()=>{
        //부모컴포넌트에서 만든 onSave를 호출
        onSave({name,photo,blood});
    }
    return (
        <div>
            <b>이름:</b>
            <input type='text' style={{width:'100px'}}
            onChange={(e)=>{
                setName(e.target.value);
            }}/>

            <b style={{marginLeft:'10px'}}>혈액형:</b>
            <select onChange={(e)=>{
                setBlood(e.target.value);
            }}>
                <option>A</option>
                <option>AB</option>
                <option>B</option>
                <option>O</option>
            </select>

            <b style={{marginLeft:'10px'}}>이미지</b>
            <select onChange={(e)=>{
                setPhoto(e.target.value);
            }}>
                {
                    //1~10까지 map으로 돌리기 s1~s10
                    [...new Array(10)].map((a,idx)=>(<option>{`s${idx+1}`}</option>))
                }

            </select>
            <button type='button' className='btn btn-info btn-sm'
            style={{marginLeft:'10px'}} onClick={addDataEvent}>추가</button>
        </div>
    );
}

export default WriteForm;