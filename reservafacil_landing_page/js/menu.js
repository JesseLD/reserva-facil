document
  .querySelector("#mobile-menu-button")
  .addEventListener("click", function () {
    const menu = document.querySelector("#mobile-menu");
    menu.classList.toggle("hidden");
  });
