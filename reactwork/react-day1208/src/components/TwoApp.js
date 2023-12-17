import React, { useState } from 'react';

function TwoApp(props) {


   const [photo,setPhoto]=useState('../image2/a01.png');
   const changePhoto=(e)=>{
        setPhoto(e.target.value);
   }



    return (
        <div>
            <h3 className='alert alert-info'>TwoApp입니다_Radio버튼</h3>
            <div>
                <b>이미지선택: </b><br/>
                <label>
                    <input type='radio' name='photo' value='../image2/a.png'
                    onClick={changePhoto}/> 이미지1
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type='radio' name='photo' value='../image2/a01.png'
                    defaultChecked onClick={changePhoto}/> 이미지2
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type='radio' name='photo' value='../image2/a02.png'
                    onClick={changePhoto}/> 이미지3
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type='radio' name='photo' value='../image2/a03.png'
                    onClick={changePhoto}/> 이미지4
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type='radio' name='photo' value='../image2/a04.png'
                    onClick={changePhoto}/> 이미지5
                </label>
                &nbsp;&nbsp;
            </div>

            <img src={photo}/>
        </div>
    );
}

export default TwoApp;