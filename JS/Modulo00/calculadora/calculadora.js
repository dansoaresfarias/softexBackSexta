function somar(){
    var num1 = parseFloat(document.getElementById("v1").value);
    var num2 = parseFloat(document.getElementById("v2").value);
    document.getElementById("resultado").innerHTML = "<b>" + "Resultado: " + "</b>"+ (num1+num2);
}

function subtrair(){
    var num1 = parseFloat(document.getElementById("v1").value);
    var num2 = parseFloat(document.getElementById("v2").value);
    document.getElementById("resultado").innerHTML = "<b>" + "Resultado: " + "</b>"+ (num1-num2);
}

function multiplicar(){
    var num1 = parseFloat(document.getElementById("v1").value);
    var num2 = parseFloat(document.getElementById("v2").value);
    document.getElementById("resultado").innerHTML = "<b>" + "Resultado: " + "</b>"+ (num1*num2);
}

function dividir(){
    var num1 = parseFloat(document.getElementById("v1").value);
    var num2 = parseFloat(document.getElementById("v2").value);
    document.getElementById("resultado").innerHTML = "<b>" + "Resultado: " + "</b>"+ (num1/num2);
}