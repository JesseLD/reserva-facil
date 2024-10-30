$(document).ready(function() {
    // Função para carregar restaurantes
    function loadRestaurants() {
        // Simulação de dados
        const restaurants = [
            { id: 1, name: 'Restaurante A' },
            { id: 2, name: 'Restaurante B' },
            { id: 3, name: 'Restaurante C' }
        ];

        const restaurantSelect = $('#restaurant');
        const restaurantList = $('#restaurant-list');

        restaurants.forEach(restaurant => {
            restaurantSelect.append(`<option value="${restaurant.id}">${restaurant.name}</option>`);
            restaurantList.append(`<div>${restaurant.name} - Horário: 10:00 - 22:00</div>`);
        });
    }

    // Função para processar reserva
    $('#reservation-form').submit(function(event) {
        event.preventDefault();
        const restaurant = $('#restaurant').val();
        const date = $('#date').val();
        const time = $('#time').val();

        alert(`Reserva feita para o Restaurante ID ${restaurant} na data ${date} às ${time}`);
    });

    // Carregar restaurantes ao iniciar
    loadRestaurants();
});