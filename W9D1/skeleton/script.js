document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const restaurants = document.getElementById('restaurants')
  const addPlace = document.getElementsByClassName('favorite-submit')[0];
  
  addPlace.addEventListener('click', function() {
    const newLi = document.createElement('li');
    const placeInput = document.getElementsByClassName('favorite-input')[0];
    newLi.innerText = placeInput.value;
    placeInput.innerText = '';
    restaurants.appendChild(newLi);
  });

  // --- your code here!
  const dogPhotos = document.getElementsByClassName('dog-photos');
  const addPhoto = document.getElementsByClassName('photo-show-button')[0];
  
  addPhoto.addEventListener('click', function() {
    const photoForm = document.getElementsByClassName('photo-form-container');
    if (photoForm[0].className.split(" ").length > 1) {
      
      photoForm[0].className = 'photo-form-container';
      const photoUrl = document.getElementsByClassName('photo-url-input')[0];
      const submitPhoto = document.getElementsByClassName('photo-url-submit')[0];
      
      submitPhoto.addEventListener('click', function() {
        const newImg = document.createElement('img');
        newImg.src = photoUrl.value;
        photoUrl.value = '';
        dogPhotos.appendChild(newImg)
      });

    } else {
      photoForm[0].className = 'photo-form-container hidden';
    }
  })

  // adding new photos

  // --- your code here!



});
