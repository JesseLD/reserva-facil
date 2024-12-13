const restaurantes = [
  {
    nome: "VARREDEIRA",
    endereco: "RUA A",
    phone: "123",
  },
];

const divLista = document.querySelector("#lista_restaurantes");

function frame() {
  for (let i = 0; i < restaurantes.length; i++) {
    divLista.innerHTML += `<div class="restaurant-card">
      <div class="restaurant-info">
        <h2>${restaurantes[i].nome}</h2>
        <p>${restaurantes[i].endereco}</p>
        <p>${restaurantes[i].phone}</p>
        <p class="stars">★★★★★</p>
      </div>
      <p class="status">Aberto Agora</p>
    </div>`;
  }
}

frame();
