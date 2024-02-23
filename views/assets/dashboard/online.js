document.addEventListener('DOMContentLoaded', function() {
    fetch('/api/online')
      .then(response => response.json())
      .then(data => {
        const onlinePlayersContainer = document.getElementById('online-players');
        const players = data.players;

        if (players.length > 0) {
          const playerCards = players.map(player => `
            <div class="card" style="width: 18rem; margin: 5px;">
              <div class="card-body text-center">
                <h5 class="card-title">${player.name}</h5>
                <p class="card-text">ID: ${player.id}</p>
                <form action="/characters/search" method="post">
                <input type="hidden" name="character" value="${player.name}"/>
                <a href="#"><button type="submit" class="btn btn-primary"> Zobacz </button></a>
                </form>
              </div>
            </div>
          `).join('');

          onlinePlayersContainer.innerHTML = playerCards;
        } else {
          const emptyCard = `
            <div class="card" style="width: 18rem; margin: 5px;">
              <img src="/assets/dashboard/list_skin/brak.png" class="card-img-top mx-auto d-block" alt="..."
                style="width: 75px; margin-top: 2px;">
              <div class="card-body text-center">
                <h5 class="card-title">Brak osób online</h5>
              </div>
            </div>
          `;

          onlinePlayersContainer.innerHTML = emptyCard;
        }
      })
      .catch(error => {
        console.error(error);
      });
  });