function fetchCharacters() {
    return fetch('/getCharacters')
      .then(response => response.json())
      .then(data => data)
      .catch(error => {
        console.error('Wystąpił problem:', error);
        return [];
      });
  }
  
  function generateSelectDropdown(characters) {
    let selectHTML = '<select name="character" class="form-control" style="color: black !important;">';
    selectHTML += '<option value="" disabled selected>Wybierz postać</option>';
    characters.forEach(character => {
      const optionText = character.status === 3 ? `<span style="color: red;">${character.name} (zablokowana)</span>` : character.name;
      selectHTML += `<option value="${character.name}">${optionText}</option>`;
    });
    selectHTML += '</select>';
    return selectHTML;
  }
  
  $('.blockchar').click(function() {
    fetchCharacters().then(characters => {
      const selectDropdownHTML = generateSelectDropdown(characters);
  
      Swal.fire({
        title: 'Zablokuj swoją postać',
        html: `
          <form id="blockChar" method="POST" action="/shop/buy">
            <div class="form-group">
              ${selectDropdownHTML}
              <input type="hidden" name="item" value="1">
            </div>
          </form>
        `,
        showCancelButton: true,
        confirmButtonText: 'Zakup',
        cancelButtonText: 'Anuluj',
        focusConfirm: false,
        preConfirm: function() {
          const form = document.getElementById('blockChar');
          form.submit();
        },
      });
    });
  });
  


  $('.delchar').click(function() {
    fetchCharacters().then(characters => {
      const selectDropdownHTML = generateSelectDropdown(characters);
  
      Swal.fire({
        title: 'Usuń swoją postać',
        html: `
          <form id="delChar" method="POST" action="/shop/buy">
            <div class="form-group">
              ${selectDropdownHTML}
              <input type="hidden" name="item" value="3">
            </div>
          </form>
        `,
        showCancelButton: true,
        confirmButtonText: 'Zakup',
        cancelButtonText: 'Anuluj',
        focusConfirm: false,
        preConfirm: function() {
          const form = document.getElementById('delChar');
          form.submit();
        },
      });
    });
  });
  