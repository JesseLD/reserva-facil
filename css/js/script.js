// Adiciona um evento ao botão de registro
document.addEventListener('DOMContentLoaded', function() {
    const registerButton = document.getElementById('register-btn');

    // Adiciona um evento de clique ao botão de registro
    registerButton.addEventListener('click', function() {
        window.location.href = 'cadastrar.html'; // Redireciona para a página de cadastro
    });
});