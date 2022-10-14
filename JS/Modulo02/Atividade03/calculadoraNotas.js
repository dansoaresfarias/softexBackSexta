function media() {
    try {
        var nota1 = parseFloat(document.getElementById("nota1").value);
        if (nota1 < 0 || nota1 > 10 || isNaN(nota1)) throw "Erro: Nota1 inválida.";
        var nota2 = parseFloat(document.getElementById("nota2").value);
        if (nota2 < 0 || nota2 > 10 || isNaN(nota2)) throw "Erro: Nota2 inválida.";
        var nota3 = parseFloat(document.getElementById("nota3").value);
        if (nota3 < 0 || nota3 > 10 || isNaN(nota3)) throw "Erro: Nota3 inválida.";
        var media = (nota1 + nota2 + nota3) / 3;
        media.toFixed(2);
        var situacao = media >= 7.0 ? "Aprovado" : "Reprovado";
        document.getElementById("media").innerHTML = "<b>" + "Media: " + "</b>" + media + " | <b>" + situacao + "</b>";
    } catch (erro) {
        alert(erro);
    }
}

function terceiraNota() {
    try {
        var nota01 = parseFloat(document.getElementById("nota01").value);
        if (nota01 < 0 || nota01 > 10 || isNaN(nota01)) throw "Erro: Nota1 inválida.";
        var nota02 = parseFloat(document.getElementById("nota02").value);
        if (nota02 < 0 || nota02 > 10 || isNaN(nota02)) throw "Erro: Nota1 inválida.";
        var nota03 = 21 - (nota01 + nota02);
        document.getElementById("nota03").innerHTML = "<b>" + "3ª Nota: " + "</b>" + nota03;
    } catch (error) {
        alert(error);
    }finally{
        alert("Erro inesperado!");
    }
}