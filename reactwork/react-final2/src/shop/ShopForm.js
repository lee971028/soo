import { UploadFile } from '@mui/icons-material';
import axios from 'axios';
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

function ShopForm(props) {

    const [photo,setPhoto]=useState('');  //db명과 일치
    const [sangpum,setSangpum]=useState('');
    const [su,setSu]=useState('');
    const [dan,setDan]=useState('');

    const navi=useNavigate();

    let uploadUrl="http://localhost:9000/shop/upload";
    let photoUrl="http://localhost:9000/save/";
    let insertUrl="http://localhost:9000/shop/insert";


    const uploadImage=(e)=>{

        const uploadFile=e.target.files[0];
        const imageFile=new FormData();
        imageFile.append("uploadFile",uploadFile);



        axios({
            method:'post',
            url:uploadUrl,
            data:imageFile,
            headers:{'Content-Type':'Multipart/form-data'}
        }).then(res=>{
            setPhoto(res.data);
        }).catch(err=>{
            alert(err);
        })


    }


   const onInsert=()=>{

    axios.post(insertUrl,{sangpum,su,dan})
    .then(res=>{
        navi("/shop/list");
    })
   }



    return (
        <div style={{marginLeft:'100px'}}>
            <table className='table table-bordered' style={{width:'600px'}}>
                <caption align='top'><b>상품등록</b></caption>
                <tbody>
                    <tr>
                        <th>상품명</th>
                        <td>
                            <input type='text' className='form-control'
                            style={{width:'250px'}} onChange={(e)=>{
                                setSangpum(e.target.value);
                            }}/>
                        </td>
                        <th>{sangpum}</th>
                    </tr>
                    <tr>
                        <th>상품사진</th>
                        <td>
                            <input type='file' className='form-control'
                            style={{width:'250px'}} onChange={uploadImage}/>
                        </td>
                        <th></th>
                    </tr>
                    <tr>
                        <th>수량</th>
                        <td>
                            <input type='text' className='form-control'
                            style={{width:'250px'}}
                            onChange={(e)=>{
                                setSu(e.target.value);
                            }}/>
                        </td>
                        <th>{su}</th>
                    </tr>
                    <tr>
                        <th>단가</th>
                        <td>
                            <input type='text' className='form-control'
                            style={{width:'250px'}}
                            onChange={(e)=>{
                                setDan(e.target.value);
                            }}/>
                        </td>
                        <th>{dan}</th>
                    </tr>
                    <tr>
                        <td colSpan='2'>
                            <img src={photoUrl+photo} style={{width:'120px',marginLeft:'130px'}}
                            />
                        </td>
                        <td>
                            <button type='button' className='btn btn-info'
                            style={{width:'100px',height:'100px',marginLeft:'30px',marginTop:'10px'}}
                            onClick={onInsert}>상품등록</button>
                        </td>
                    </tr>

                </tbody>
            </table>
        </div>
    );
}

export default ShopForm;