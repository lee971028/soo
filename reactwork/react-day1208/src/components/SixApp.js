import React, { useState } from 'react';
import Alert from '@mui/material/Alert';
import ElectricBikeIcon from '@mui/icons-material/ElectricBike';

function SixApp(props) {

    const [names,setNames]=useState(['진평','현규','희찬','민규','성신']);
    const [irum,setIrum]=useState('');

    //추가버튼 이벤트
    const btnInsert=()=>{
        setNames(names.concat(irum)); //배열에 irum데이타 추가
        setIrum('');
    }

    //Enter이벤트
    const txtEnter=(e)=>{

        if(e.key==='Enter'){
            btnInsert();
        }
    }

    //입력이 되도록...이벤트
    const txtInput=(e)=>{
        setIrum(e.target.value);
    }

    //더블클릭시 삭제
    const dataRemove=(index)=>{

         console.log("remove: "+index);


        //방법1..slice
       /* setNames([
            ...names.slice(0,index),
            ...names.slice(index+1,names.length)

        ]);*/ //index번지만 빼고 잘라서 넣음

        //방법2..filter
        setNames(names.filter((item,i)=>i!==index));




    }

    return (
        <div>
            <h3 className='alert alert-info'>SixApp입니다</h3>
            <Alert severity="warning">배열연습_#6 <ElectricBikeIcon/></Alert>

            <input value={irum} onChange={txtInput} placeholder='이름입력'
            onKeyUp={txtEnter}/>
            <button type='button' className='btn btn-info' style={{marginLeft:'10px'}}
            onClick={btnInsert}>추가</button>
            <br/>
            <h4>이름을 더블클릭하면 삭제됩니다</h4>
            <ul>
                {
                    names.map((name,index)=>(<li className='data'
                    onDoubleClick={()=>dataRemove(index)}>{name}</li>))
                }
            </ul>
        </div>
    );
}

export default SixApp;