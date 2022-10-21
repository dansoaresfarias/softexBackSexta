function calcular15(){
    var a = parseFloat(document.getElementById("v1").value);
    var i, j;
    for(i = 1 ; i <= 4 ; i++){
        j = 1;
        while(j<3){
            a = a + 2;
            j++;
        }
    }
    document.getElementById("resultado").innerHTML = "<b>" + "Resultado: " + "</b>"+ a;
}

function calcFibo(){
    var n = parseFloat(document.getElementById("n").value);
    var resultado = fibo(n);
    document.getElementById("resultFibo").innerHTML = "<b>" + "Resultado: " + "</b>"+ resultado;
}

function fibo(n){    
     if(n < 2){
        return n;
     } else {
        return fibo(n - 1) + fibo(n - 2);
     }
}