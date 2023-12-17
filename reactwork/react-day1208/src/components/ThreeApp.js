import React, { useState } from 'react';
import img1 from '../image/s1.JPG';
import img2 from '../image/s2.JPG';
import img3 from '../image/s3.JPG';
import img4 from '../image/s4.JPG';
import img5 from '../image/s5.JPG';

function ThreeApp(props) {

   const [hp1,setHp1]=useState('02');
   const [hp2,setHp2]=useState('1111');
   const [hp3,setHp3]=useState('2222');
   const [photo,setPhoto]=useState(1);

   const changeHp1=(e)=>{
      setHp1(e.target.value);
   }
   const changeHp2=(e)=>{
      setHp2(e.target.value);
   }
   const changeHp3=(e)=>{
     setHp3(e.target.value);
   }

   const cahngePhoto=(e)=>{
      setPhoto(Number(e.target.value));
   }



    return (
        <div>
           <h3 className='alert alert-info'>ThreeApp입니다_문제1</h3> 
           <div className='d-inline-flex' style={{height:'35px'}}>
              <select style={{width:'100px'}} onChange={changeHp1}>
                  <option>02</option>
                  <option>010</option>
                  <option>031</option>
                  <option>017</option>
                  <option>052</option>
              </select>
              <b>-</b>
              <input type='text' maxLength='4' className='form-control' style={{width:'120px'}}
             defaultValue={hp2} onKeyUp={changeHp2}/>
              <b>-</b>
              <input type='text' maxLength='4' className='form-control' style={{width:'120px'}}
              defaultValue={hp3}  onKeyDown={changeHp3}/>
           
           <br/>
           <b style={{marginLeft:'50px',width:'300px'}}>이미지 선택: </b>
           <select className='form-control'onChange={cahngePhoto}>
              <option value='1'>이미지1</option>
              <option value='2'>이미지2</option>
              <option value='3'>이미지3</option>
              <option value='4'>이미지4</option>
              <option value='5'>이미지5</option>
           </select>
           </div>

<br/><br/>
  <h1>{hp1}-{hp2}-{hp3}</h1>
  <img src={photo===1?img1:photo===2?img2:photo===3?img3:photo===4?img4:img5}/>



        </div>
    );
}

export default ThreeApp;