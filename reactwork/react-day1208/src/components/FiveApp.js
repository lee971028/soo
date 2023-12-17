import React, { useState } from 'react';
import Alert from '@mui/material/Alert';
import img1 from '../image/s1.JPG';
import img2 from '../image/s2.JPG';
import img3 from '../image/s3.JPG';
import img4 from '../image/s4.JPG';
import img5 from '../image/s5.JPG';
import img6 from '../image/s6.JPG';

function FiveApp(props) {
    

    //이미지를 배열변수에 넣기(src)
    const imgArr=[img1,img2,img3,img4,img5,img6];

    //이미지를 배열변수에 넣기(public)
    const imgArr2=['1','2','3','4','5','6'];


    return (
        <div>
           <h3 className='alert alert-info'>FiveApp입니다</h3> 
           <Alert severity="success">배열연습_#5 </Alert>
           <h4>src 의 이미지를 배열로 넣어 반복하기</h4>
           {
              imgArr.map((myimg)=>(<img src={myimg} style={{width:'50px'}} />))
           }

           <h4>public 의 이미지를 배열로 넣어 반복하기</h4>
           {
               //예전방식
               /* imgArr2.map((photo)=>(<img  src={'../image2/a0'+photo+'.png'} 
                className='photo' />))*/

               //리터럴방식
               imgArr2.map((photo)=>(<img alt='' src={`../image2/a0${photo}.png`}  className='photo'/>))
           }
        </div>
    );
}

export default FiveApp;