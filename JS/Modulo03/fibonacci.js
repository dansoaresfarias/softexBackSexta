var readlineSync = require('readline-sync');

var n = readlineSync.question('Qual Fibonacci: ');

console.log('Fibonacci de ' + n + ' é ' + fibo(n) + ' !');

function fibo(n){    
     if(n < 2){
        return n;
     } else {
        return fibo(n - 1) + fibo(n - 2);
     }
}