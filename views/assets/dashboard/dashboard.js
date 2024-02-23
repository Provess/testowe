/* globals Chart:false, feather:false */



$(document).ready(function() {
  $('.dropdown-toggle').click(function() {
    $(this).siblings('.dropdown-menu').toggleClass('show');
  });

  $(document).click(function(event) {
    var target = $(event.target);
    if (!target.closest('.dropdown-toggle').length && $('.dropdown-menu').hasClass('show')) {
      $('.dropdown-menu').removeClass('show');
    }
  });
});



function isMobileResolution() {
  return window.innerWidth <= 768; 
}


function removeDownloadButtons() {
  var downloadButtons = document.getElementsByClassName("download-button");

  var buttonsArray = Array.from(downloadButtons);
  for (var i = buttonsArray.length - 1; i >= 0; i--) {
    var button = buttonsArray[i];

    if (isMobileResolution()) {
      button.remove();
    }
  }
}

fetch('/api/online')
.then(response => response.json())
.then(data => {
  document.getElementById('player-count').innerHTML = data.online
});


window.addEventListener("load", removeDownloadButtons)



const gamepad = document.querySelector('#gamepad');
gamepad.addEventListener('click', () => {
  Swal.fire({
    icon: 'success',
    title: 'Wybierz opcje!',
    html: `
    <a href="/characters/online"> <button class="btn btn-primary" id='players'><i class="fas fa-users"></i> Lista graczy</button> </a>
      <a href="samp://samp.la-rp.pl:7777"><button class="btn btn-primary" id='joingame'><i class="fas fa-gamepad"></i> Dołącz do gry</button></a>
    `,
    showConfirmButton: false,
  });
  
  document.getElementById('joingame').addEventListener('click', () => {
  Swal.close()
  })
})