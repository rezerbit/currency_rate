import "./navbar.scss"

document.addEventListener("DOMContentLoaded", () => {
  const burger = document.querySelector(".js-burger")
  const nav = document.querySelector(`#${burger.dataset.target}`)

  burger.addEventListener("click", () => {
    burger.classList.toggle("is-active")
    nav.classList.toggle("is-active")
  })
})
