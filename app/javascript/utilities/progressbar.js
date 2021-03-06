document.addEventListener('turbolinks:load', function() {
  let progressBar = document.getElementById('test-progress');

  if (progressBar) {
    showCurrentProgress(progressBar);
  }
});

function showCurrentProgress(progressBar) {
  let questionNumber = progressBar.dataset.questionNumber;
  let questionsCount = progressBar.dataset.questionsCount;
  let progressPercent = questionNumber/questionsCount * 100;
  progressBar.style.width = progressPercent + "%"
}
