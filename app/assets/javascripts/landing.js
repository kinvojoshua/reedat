// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
const search = document.getElementById('search-box')
console.log(search)

search.addEventListener('keyup', (e)=> {
  if(e.key === 'Enter'){
    data = {title: search.value}
    searchPost(data)
  }
})



function searchPost(data) {
  fetch('/posts/search', {
    method: 'POST',
    body: JSON.stringify(data),
    headers:{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-CSRF-Token': Rails.csrfToken()
    },
    credentials: 'same-origin'
  }).then(function(res){
    return res.json()
  }).then(function(data){
    
  })


}
