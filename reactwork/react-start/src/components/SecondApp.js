import React from 'react';
import img1 from '../image/dance4.png';

function SecondApp(props) {

    const imgstyle={

        border:'5px inset gray',
        borderRadius:'100px',
        width:'130px'
    }

    let helloEle=<h2 className='alert alert-info'>Hello~~</h2>;
    return (
        <div>
           <h2 className='alert alert-danger'>SecondApp입니다</h2> 
           <img src={img1} style={imgstyle}/>
           {helloEle}
           {helloEle}
           {helloEle}
        </div>
    );
}

export default SecondApp;