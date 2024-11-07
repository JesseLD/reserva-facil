document.addEventListener("DOMContentLoaded", () => {
  const container = document.querySelector("#cookie-popup");
  const button = document.querySelector(".cookie-popup__button");

  button.addEventListener("click", () => {
    container.style.display = "none";
    localStorage.setItem("cookieAccepted", true);
  });

  if (!localStorage.getItem("cookieAccepted")) {
    container.style.display = "fixed";
  }
});
