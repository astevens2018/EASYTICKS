import flatpickr from "flatpickr";

const timeInput = document.getElementById("timepicker-input");
console.log(timeInput)
const pickr = flatpickr(timeInput, {
  enableTime: true,
  noCalendar: true
});
console.log(pickr)

