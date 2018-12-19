import flatpickr from "flatpickr"
import "./rate-form.scss"

document.addEventListener("DOMContentLoaded", () => {
  if (document.querySelector(".flatpickr")) {
    flatpickr(".flatpickr", {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      minDate: new Date(),
      time_24hr: true
    })
  }

  const timezone = document.querySelector(".js-rate-form__timezone")
  if (timezone) {
    timezone.value = Intl.DateTimeFormat().resolvedOptions().timeZone
  }
})
