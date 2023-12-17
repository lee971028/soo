import React, { useState } from 'react';
import Alert from '@mui/material/Alert';
import ElectricBikeSharpIcon from '@mui/icons-material/ElectricBikeSharp';
import Face2SharpIcon from '@mui/icons-material/Face2Sharp';
import TwoSubApp from './TwoSubApp';
import TwoSubApp2 from './TwoSubApp2';
function TwoApp(props) {

   const [color,setColor]=useState('magenta');
   const [message,setMessage]=useState('오늘은 수요일^^');
   const [photo,setPhoto]=useState('s5');

  //app2
  const [likeColor,setLikeColor]=useState(['pink','yellow','gray']);


   //3개의 이벤트를 만들어 전달
   const changeMessage=(msg)=>{

        setMessage(msg);
   }

   const changeColor=(co)=>{
        setColor(co);
   }

   const changePhoto=(p)=>{
       setPhoto(p);
   }


   //sub2_색상추가
   const addColorEvent=(co)=>{
      setLikeColor(likeColor.concat(co));
   }

   //동그란 색상 더블클릭시 삭제
   const deleteLikeColor=(idx)=>{

    setLikeColor(likeColor.filter((a,i)=>(i!==idx)));
   }

    return (
        <div>
            <Alert severity="success">TwoApp!! <ElectricBikeSharpIcon/><Face2SharpIcon/></Alert>
            <br/>
            <h1 style={{color:color}}>{message}</h1>
            <img src={`../image/${photo}.JPG`}/>

            <br/>
            {
                likeColor.map((co,idx)=>(<div className='box' style={{backgroundColor:co}}
                onDoubleClick={()=>{
                    deleteLikeColor(idx);
                }}>{idx}</div>))
            }

            <br/>
            <TwoSubApp  onMessage={changeMessage}
            onColor={changeColor}  onPhoto={changePhoto}/>
            <br/>
            <TwoSubApp2  onAddColor={addColorEvent}/>

        </div>
    );
}

export default TwoApp;