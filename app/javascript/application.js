// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false
import "controllers"

const source = document.getElementById('autocomplete');
const result = document.getElementById('result');

const inputHandler = function(e) {
  result.innerHTML = ''

  // TODO  avoid duplication
  let list_id = document.getElementById('autocomplete').dataset.id

  fetch(`/user_list_options?key=${e.target.value}&list_id=${list_id}`)
    .then(response => response.json())
    .then(data => {
      data.forEach(el => {
        let html = `<div class='option' data-id='${el.id}'>${el.email}</div>`
        result.innerHTML += html
      })
    });
}

source.addEventListener('input', inputHandler);
