import flatpickr from "flatpickr"
import "./rate-form.scss"

document.addEventListener("DOMContentLoaded", () => {
  const expiresAt = document.querySelector(".flatpickr")

  if (expiresAt) {
    flatpickr(".flatpickr", {
      enableTime: true,
      dateFormat: "Z",
      altInput: true,
      altFormat: "Y-m-d H:i",
      minuteIncrement: 1,
      time_24hr: true
    })
  }
})
