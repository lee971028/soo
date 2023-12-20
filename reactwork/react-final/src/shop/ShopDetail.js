import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import Button from '@mui/material/Button';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';


function ShopDetail(props) {

    const {num}=useParams();
    const navi=useNavigate();

    //삭제 다이얼로그 코드추가(mui)
    const [open, setOpen] = React.useState(false);

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };


    //dto들어올 변수선언
    const [data,setData]=useState('');

    //url등록
    let detailUrl="http://localhost:9000/shop/detail?num="+num;
    let photoUrl="http://localhost:9000/save/";
    let deleteUrl="http://localhost:9000/shop/delete?num="+num;

    //스프링으로부터 num에 해당하는 data받기
    const onDataReceive=()=>{

        axios.get(detailUrl)
        .then(res=>{

            console.log(res.data.sangpum);
            setData(res.data);
        }).catch(err=>{
            alert(err.data);
        })
    }

    //처음 랜더링시 위의 함수 호출
    useEffect(()=>{
        onDataReceive();
    },[]);

      //삭제시 호출될 함수
      const onDelete=()=>{

        console.log("delete");

        axios.delete(deleteUrl)
        .then(res=>{
            //삭제후 목록으로 이동
            navi("/shop/list")
        })


        handleClose();
      }


    return (
        <div>


      <Dialog
        open={open}
        onClose={handleClose}
        aria-labelledby="alert-dialog-title"
        aria-describedby="alert-dialog-description"
      >
        <DialogTitle id="alert-dialog-title">
          <h4>상품삭제확인</h4>
        </DialogTitle>
        <DialogContent>
          <DialogContentText id="alert-dialog-description">
            <h5>상품을 삭제하려면 [확인] 버튼을 눌러주세요</h5>
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose}>취소</Button>
          <Button onClick={onDelete} autoFocus>
           확인
          </Button>
        </DialogActions>
      </Dialog>
    


            {/* num 출력확인시 db에서 가져올수 있음 */}
            {/* <h1>{num}</h1> */}
            <table className='table' style={{width:'600px'}}>
               <caption align='top'><b>상품상세보기</b></caption>
               <tbody>
                <tr>
                   <td width='350' rowSpan='4'>
                    <img src={photoUrl+data.photo} className='large'/>
                   </td>
                   <td>
                    <h5>상품명: {data.sangpum}</h5>
                   </td>
                </tr>
                <tr>
                    <h5><td>수량:{data.su}</td></h5>
                </tr>
                <tr>
                    <h5><td>단가:{data.dan}</td></h5>
                </tr>
                <tr>
                    <h5><td>입고일:{data.ipgoday}</td></h5>
                </tr>
                <tr>
                    <td colSpan='2' align='center' className='detail'>
                        <button type='button' className='btn btn-outline-info'
                        onClick={()=>{
                            navi("/shop/list")
                        }}>목록</button>
                        <button type='button' className='btn btn-outline-warning'
                        onClick={()=>{
                            navi("/shop/form")
                        }}>상품추가</button>
                        <button type='button' className='btn btn-outline-success'>수정</button>
                        <button type='button' className='btn btn-outline-danger'onClick={handleClickOpen}>삭제</button>
                    </td>
                </tr>
               </tbody>
            </table>
        </div>
    );
}

export default ShopDetail;