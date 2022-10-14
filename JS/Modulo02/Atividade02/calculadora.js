function somar() {
    var num1 = parseFloat(document.getElementById("v1").value);
    var num2 = parseFloat(document.getElementById("v2").value);
    document.getElementById("resultado").innerHTML = "<strong>" + "Resultado: " + "</strong>" + (num1 + num2);
}

function subtrair() {
    var num1 = parseFloat(document.getElementById("v1").value);
    var num2 = parseFloat(document.getElementById("v2").value);
    document.getElementById("resultado").innerHTML = "<strong>" + "Resultado: " + "</strong>" + (num1 - num2);
}

function multiplicar() {
    var num1 = parseFloat(document.getElementById("v1").value);
    var num2 = parseFloat(document.getElementById("v2").value);
    document.getElementById("resultado").innerHTML = "<strong>" + "Resultado: " + "</strong>" + (num1 * num2);
}

function dividir() {
    try {
        var num1 = parseFloat(document.getElementById("v1").value);
        var num2 = parseFloat(document.getElementById("v2").value);
        if (num2 == 0)  throw "Erro: Divisor igual a ZERO.";
        document.getElementById("resultado").innerHTML = "<strong>" + "Resultado: " + "</strong>" + (num1 / num2);
    } catch (erro) {
        document.getElementById("resultado").innerHTML = "<strong>" + "Resultado: " + "</strong>" + erro;
        alert(erro);
    }
}