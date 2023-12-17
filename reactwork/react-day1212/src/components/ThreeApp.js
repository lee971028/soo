import React, { useState } from 'react';

function ThreeApp(props) {
    
    const [boards,setBoards]=useState([

        {
            no:1,
            writer:'김영환',
            subject:'영환아 미안^^',
            photo:'s1'
        },
        {
            no:2,
            writer:'양세형',
            subject:'새형이 만나자^^',
            photo:'s2'
        },
        {
            no:2,
            writer:'양세형',
            subject:'새형이 만나자^^',
            photo:'s2'
        },
        {
            no:3,
            writer:'유재석',
            subject:'재석이형 어디야',
            photo:'s3'
        },
        {
            no:4,
            writer:'김구라',
            subject:'구라씨 어디세요?',
            photo:'s4'
        },
        {
            no:5,
            writer:'하하',
            subject:'하하하하하하하',
            photo:'s5'
        }
    ]);
    
    
    return (
        <div style={{marginLeft:'100px'}}>
           <h3 className='alert alert-danger'>ThreeApp입니다_객체배열을 컴포넌트안에 출력</h3> 
            <table className='table table-bordered' style={{width:'600px'}}>
                <caption align='top'><b>배열객체출력</b></caption>
                <thead>
                    <tr className='table-success'>
                        <th width='60'>번호</th>
                        <th width='100'>사진</th>
                        <th width='260'>제목</th>
                        <th width='100'>작성자</th>
                    </tr>
                </thead>

                <tbody>
                    {
                        boards.map((row,index)=>(<tr>
                            <td>{row.no}</td>
                            <td><img src={`../image2/${row.photo}.JPG`} style={{width:'50px'}}/></td>
                            <td>{row.subject}</td>
                            <td>{row.writer}</td>
                        </tr>))
                    }
                </tbody>
            </table>
        </div>
    );
}

export default ThreeApp;