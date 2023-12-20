import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import ShopRowItem from './ShopRowItem';

function Shop(props) {

    const navi=useNavigate();

    //백앤드에서 받아올 리스트 데이타 변수
    const [shopList,setShopList]=useState([]);

    //데이타 가져오는 함수
    const list=()=>{

        let url="http://localhost:9000/shop/list";

        axios.get(url)
        .then(res=>{
             //스프링으로부터 받아온 list를 shopList에 넣기
            setShopList(res.data);
            console.log("len: "+res.data.length);  //요걸출력후 확인후 RowItem에서 출력예정
        })
    }


    //처음랜더링시 딱한번 데이터 가져오기
    useEffect(()=>{

        console.log("list");
        list();
    },[]);


    return (
        <div style={{marginLeft:'100px'}}>
            <button type='button' className='btn btn-info'
            style={{width:'120px'}}
            onClick={()=>{
                navi("/shop/form");
            }}>상품등록</button>
            

            <hr/>
            <table className='table table-bordered' style={{width:'500px'}}>
                <thead>
                    <tr>
                        <th width='60'>번호</th>
                        <th width='220'>상품명</th>
                        <th width='220'>상세보기</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        shopList.map((row,index)=>(<ShopRowItem row={row} idx={index}/>))
                    }
                </tbody>
            </table>
        </div>
    );
}

export default Shop;