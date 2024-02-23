const btn = document.getElementById("announcement");

btn.addEventListener("click", () => {
      Swal.fire({
        title: "Tworzenie ogłoszenia",
        html: `
          <div class="container">
            <div class="row">
              <div class="col-md-6 offset-md-3">
                <form id="user-form" action="/acp/addannouncement" method="POST">
                  <div class="form-group">
                    <label for="admin">Treść ogłoszenia, maksymalnie 121 znaków</label>
                   <textarea class="form-control" name="text"></textarea>
                  </div>
                </form>
              </div>
            </div>
          </div>
        `,
        icon: "info",
        confirmButtonText: "Dodaj ogłoszenie", 
        preConfirm: () => {
      const form = document.getElementById("user-form");
      form.submit();
  },
      });
    });