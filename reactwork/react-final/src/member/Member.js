import React, { useState } from 'react';

function Member(props) {


    const [data,setData]=useState({
        id:'',
        name:'',
        pass:'',
        email:'',
        hp:'',
        addr:''
    });

    const [passOk,setPassOk]=useState(false);
    const [email1,setEmail1]=useState('');
    const [email2,setEmail2]=useState('');
    const [btnOk,setBtnOk]=useState(false);

    //submit이 호출될 함수
    const onSave=(e)=>{
      e.preventDefault(); //기본이벤트 무효화 submit시에 액션이 호출안되게
      console.dir(data); //onchange해줄때 데이타 어떻게 들어가나 확인


      //이메일 합치기
      setData({
        ...data,
        email:`${email1}@${email2}`
      });

      if(!btnOk){
        alert("아이디 중복체크 해주세요");
        return;
      }

      if(!passOk){
        alert("비밀번호 확인을 해주세요");
        return;
      }

    }


    //data 입력시 호출
    const onDataChange=(e)=>{

      const {name,value}=e.target;

      //이벤트발생시 name이 pass일경우 passOk 는 false
      if(name==='pass')
          setPassOk(false);

          setData({
            ...data,
            [name]:value
          })
    }

    //이메일 select 변경시 호출
    const onEmailChange=(e)=>{
        
      const {value}=e.target;
      console.log(value);

      if(value==='-')
         setEmail2('');
      else
        setEmail2(value);

    }

    //2번째 pass입력시 호출
    const onPassChange=(e)=>{
      const {value}=e.target;

      if(value===data.pass)
        setPassOk(true);
      else
        setPassOk(false);
    }


    return (

        <div >
      <form onSubmit={onSave}>
        <table class="table" style={{width:'600px'}}>
            <caption align="top"><b>회원가입</b></caption>
            <tbody>
              
              <tr >
                <th width='100'>아이디</th>
                <td className='d-inline-flex'>
                  <input type='text' className='form-control' style={{width:'130px'}}
                  name='id' required onChange={onDataChange}/>
                  <button type='button' className='btn btn-danger'
                  style={{marginLeft:'5px'}}>중복체크</button>
                </td>
              </tr>
              
              <tr>
              <th width='100'>이름</th>
                <td>
                  <input type='text' className='form-control' style={{width:'130px'}}
                  name='name' required  onChange={onDataChange}/>
                </td>
              </tr>

              <tr>
              <th width='100'>비밀번호</th>
                <td className='d-inline-flex'>
                  <input type='password' className='form-control' style={{width:'130px'}}
                  name='pass' required  onChange={onDataChange}/>
                  <input type='password' className='form-control' style={{width:'130px'}}
                   required onChange={onPassChange}/>

                   <span style={{marginLeft:'5px',color:'red'}}>비밀번호 확인할예정</span>
                </td>
              </tr>

              <tr>
                <th>이메일</th>
                <td className='d-inline-flex'>
                    <input type='text' className='form-control' style={{width:'100px'}} required
                    onChange={(e)=>{
                      setEmail1(e.target.value)
                    }}/>
                    <b>@</b>
                    <input type='text' className='form-control' style={{width:'130px'}}
                    defaultValue={email2} required
                    onChange={(e)=>{
                      setEmail2(e.target.value)
                    }}/>
                    &nbsp;&nbsp;
                    <select className='form-control' onChange={onEmailChange}>
                      <option value='-'>직접입력</option>
                      <option value='naver.com'>네이버</option>
                      <option value='gmail.com'>구글</option>
                      <option value='daum.net'>한메일</option>
                    </select>
                </td>
              </tr>

              <tr>
              <th width='100'>핸드폰</th>
                <td>
                  <input type='text' className='form-control' style={{width:'180px'}}
                  name='hp' required   onChange={onDataChange}/>
                </td>
              </tr>

              <tr>
              <th width='100'>주소</th>
                <td>
                  <input type='text' className='form-control' style={{width:'330px'}}
                  name='addr' required  onChange={onDataChange}/>
                </td>
              </tr>

              <tr>
                <td colSpan='2' style={{textAlign:'center'}}>
                   <button type='submit' className='btn btn-info'style={{width:'100px'}}>가입하기</button>
                   <button type='button' className='btn btn-success'style={{width:'100px',marginLeft:'10px'}}>목록</button>
                </td>
              </tr>
            </tbody>
        </table>
       </form>
        </div>
    );
}

export default Member;