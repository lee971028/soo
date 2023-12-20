import axios from 'axios';
import React, { useEffect, useState } from 'react';

function MemberList(props) {
    
    //리스트배열선언
    const [memList,setMemList]=useState([]);

    //리스트 스프링에서가져오기이벤트
    const getList=()=>{

        const url="http://localhost:9000/member/list";
        axios.get(url)
        .then(res=>{
            setMemList(res.data);
            console.log(memList.length);
        })
    }
    //db삭제이벤트
    const onDataDelete=(num)=>{
        const url="http://localhost:9000/member/delete?num="+num;

        axios.delete(url)
        .then(res=>{
            alert("삭제성공!!");
            getList();
        })
    }

    useEffect(()=>{
        getList();
    },[]);
    
    return (
        <div style={{marginLeft:'100px'}}>
           <table className='table table-bordered' style={{width:'800px'}}>
              <caption align='top'><b>전체회원명단</b></caption>
              <thead>
                <tr className='table-info'>
                    <th width='60'>번호</th>
                    <th width='120'>회원명</th>
                    <th width='150'>아이디</th>
                    <th width='180'>핸드폰</th>
                    <th width='200'>이메일</th>
                    <th width='50'>삭제</th>
                </tr>
              </thead>
              {
                memList.map((row,idx)=>(

                    <tbody>
                        <tr>
                           <td>{idx+1}</td>
                           <td>{row.name}</td> 
                           <td>{row.id}</td> 
                           <td>{row.hp}</td> 
                           <td>{row.email}</td> 
                           <td>
                            <button type='button' className='btn btn-danger'
                            onClick={()=>{
                                onDataDelete(row.num)
                            }}>삭제</button>
                           
                            </td>
                        </tr>
                    </tbody>
                ))
              }
           </table>
           
        </div>
    );
}

export default MemberList;