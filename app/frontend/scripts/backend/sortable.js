import Sortable from 'sortable.js'

document.addEventListener('turbolinks:load', () => {
  let el = document.querySelector('.sortable-items')

  if (el) {
    Sortable.create(el, {
      
    })
  }
})