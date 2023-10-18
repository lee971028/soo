/**
 * 
 */
 $(function(){
    $("#myimg").attr("src","../image/b8.png"); 
    
    $("#myimg").hover(function(){
       $(this).attr("src","../image/b1.png"); 
      },function(){
        $(this).attr("src","../image/b8.png"); 
      });
 });