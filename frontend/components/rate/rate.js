import createChannel from "client/cable"
import "./rate.scss"
import "images/loader.svg"

function changeRate(value) {
  const rate = document.querySelector(`.js-rate__value`)
  rate.innerText = value
  rate.style.display = "inline"

  const sign = document.querySelector(`.js-rate__sign`)
  sign.style.display = "inline"
}

function get(url) {
  return new Promise((succeed, fail) => {
    const request = new XMLHttpRequest()
    request.open("GET", url, true)

    request.addEventListener("load", () => {
      if (request.status < 400) succeed(request.response)
      else fail(new Error(`Request failed:  ${request.statusText}`))
    })

    request.addEventListener("error", () => {
      fail(new Error("Network error"))
    })

    request.responseType = "json"
    request.send()
  })
}

function renderCurrentRate() {
  get("/api/current_rate").then(
    data => {
      changeRate(data.value)
    },
    () => {}
  )
}

document.addEventListener("DOMContentLoaded", () => {
  createChannel(
    { channel: "RateChannel" },
    {
      connected() {
        renderCurrentRate()
      },
      received(data) {
        changeRate(data.value)
      }
    }
  )
})
