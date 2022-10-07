function media(){
    var nota1 = parseFloat(document.getElementById("nota1").value);
    var nota2 = parseFloat(document.getElementById("nota2").value);    
    var nota3 = parseFloat(document.getElementById("nota3").value);
    var media = (nota1+nota2+nota3)/3;
    var situacao = media >= 7.0 ? "Aprovado" : "Reprovado";
    document.getElementById("media").innerHTML = "<b>" + "Media: " + "</b>"+ media + " | <b>" + situacao + "</b>";
}

function terceiraNota(){
    var nota01 = parseFloat(document.getElementById("nota01").value);
    var nota02 = parseFloat(document.getElementById("nota02").value);   
    var nota03 = 21 - (nota01+nota02);
    document.getElementById("nota03").innerHTML = "<b>" + "3ª Nota: " + "</b>"+ nota03;
}