document.addEventListener('turbolinks:load', function() {
  const timerBlock = document.getElementById('timer')

  if (timerBlock) startTimer(timerBlock)
})

function startTimer(timerBlock) {
  let spentTime = parseInt(timerBlock.dataset.spentTime)

  setInterval(() => {
    let minutes = parseInt(spentTime / 60, 10)
    let seconds = parseInt(spentTime % 60, 10)

    minutes = minutes < 10 ? '0' + minutes : minutes
    seconds = seconds < 10 ? '0' + seconds : seconds

    timerBlock.textContent = minutes + ':' + seconds

    if (--spentTime < 0) {
      document.forms[0].submit()
    }
  }, 1000);
}
