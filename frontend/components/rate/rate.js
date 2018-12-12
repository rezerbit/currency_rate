import createChannel from "client/cable"
import "./rate.scss"
import "images/loader.svg"

function renderRate(value) {
  const rate = document.querySelector(`.js-rate__value`)
  rate.innerText = value

  const sign = document.querySelector(`.js-rate__sign`)
  sign.style.display = "inline"
}

document.addEventListener("DOMContentLoaded", () => {
  createChannel(
    { channel: "CurrentRateChannel" },
    {
      received(value) {
        renderRate(value)
      }
    }
  )
})
