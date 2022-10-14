function mudarCurriculoPaulo() {
    var titulo = document.getElementById("titulo");
    titulo.innerHTML = "Paulo César Ribeiro da Silva";
    var foto = document.getElementById("foto");
    foto.src = "img/paulo.jfif";
    var listaFormacaoPai = document.getElementById("listaFormacao");
    var mestrado = document.getElementById("mestrado");
    listaFormacaoPai.removeChild(mestrado);
    var tecnico = document.createElement("li");
    tecnico.innerHTML = "Técnico em TI - SENAC - 2019";
    listaFormacaoPai.appendChild(tecnico);
    window.scrollTo(0, 0);
}

function mudarCurriculoHenrique() {
    var titulo = document.getElementById("titulo");
    titulo.innerHTML = "Carlos Henrique Gomes Mendonça";
    var foto = document.getElementById("foto");
    foto.src = "https://avatars.githubusercontent.com/u/91921212?v=4";
    window.scrollTo(0, 0);
}