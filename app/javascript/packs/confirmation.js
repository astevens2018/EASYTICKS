function hideAnimation() {
  const animation = document.querySelector(".animation");
  animation.classList.add('hidden');
  document.querySelector(".confirmation").classList.remove('hidden');
}
setTimeout(hideAnimation, 4000);