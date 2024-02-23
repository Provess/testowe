const messages = [
    "Dalej tu jesteś?",
    "Nie ukryjesz się przed nami.",
    "Internet to ogromne i tajemnicze miejsce.",
    "Wiemy, że się zgubiłeś. Jesteśmy tutaj aby pomóc.",
    "Nie przejmuj się, pomożemy Ci wrócić.",
    "Jeśli za pierwszym razem Ci się nie udało - nie poddawaj się.",
    "Może to nie jest strona, której szukasz...",
    "Nie martw się, jesteśmy przy Tobie.",
    "404 error: strona nie została znaleziona, ale nie jesteś sam.",
  ];

  const messagesDiv = document.getElementById('messages');
  let i = 0;

  setInterval(() => {
    messagesDiv.innerHTML = `<p class="animated">${messages[i]}</p>`;
    i++;
    if (i === messages.length) {
      i = 0;
    }
  }, 10000);