//배열연습
var numbers=[1,2,3,4,5];

var processd=numbers.map(function(num){
    return num*num;
});

console.log(processd); //1,4,9,16,25

var colors=['red','pink','gray','yellow','cyan'];

colors.map((color,index)=>{
    console.log(color,index);
})

let conk=[11,22].concat([33,44],[55,66]);
console.log(conk);