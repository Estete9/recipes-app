// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"

//= require popper
//= require bootstrap
//= require_tree .

const popUpModal = () => {
  const headClose = document.getElementById('head-close-modal')
  const footerClose = document.getElementById('footer-close-modal')
  const modalEl = document.getElementById('genIngredient')
  const modal = new bootstrap.Modal(modalEl)
  modal.show()

  headClose.addEventListener('click', () => modal.hide())
}

document.addEventListener("turbo:load", () => {
  const generateIngredient = document.getElementById('generate-ingredient')

  generateIngredient?.addEventListener('click', popUpModal)
});
