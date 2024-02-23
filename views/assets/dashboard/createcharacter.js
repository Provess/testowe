let skinId;
const skinInput = document.getElementById("skin-input");
const woman = [
  '55', '56', '63', '64', '65', '69', '75', '76', '77', '85',
  '87', '88', '89', '90', '91', '93', '129', '130', '131', '141', '148', '150', '151', '152', '157', '169', '172', '178',
  '190', '191', '192', '193', '194', '195', '198', '201', '207', '211', '214', '215', '216', '219', '224', '225', '226',
  '233', '237', '238', '243', '244', '245', '256', '263', '9', '10', '11', '12', '13', '31', '39', '40', '41', '53', '54'
];

const man = [
  '1', '2', '3', '4', '5', '6', '7', '8', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25',
  '26', '27', '28', '29', '30', '32', '33', '34', '35', '36', '37', '42', '43', '44', '46', '47', '48', '49', '50',
  '57', '58', '59', '60', '61', '62', '66', '67', '68', '72', '73', '78', '79', '82', '83', '84', '86', '94', '95', '96',
  '98', '100', '101', '102', '103', '104', '105', '106', '107', '108', '109', '110', '111', '112', '113', '114', '115',
  '116', '117', '118', '120', '121', '122', '123', '124', '125', '126', '127', '128', '132', '133', '134', '135',
  '136', '137', '142', '143', '144', '146', '147', '153', '154', '155', '156', '158', '159', '160', '161', '162',
  '168', '170', '161', '173', '174', '175', '176', '177', '179', '180', '181', '182', '183', '184', '185', '186',
  '187', '188', '189', '200', '202', '206', '208', '210', '212', '213', '217', '220', '221', '222', '223', '227', '228',
  '229', '230', '234', '235', '236', '239', '240', '241', '242', '247', '248', '249', '250', '254', '255', '258', '259',
  '260', '261', '262', '268', '269', '270', '271', '272', '273', '289', '290', '291', '292', '293', '294', '295',
  '296', '297', '299'
];

const select2 = document.getElementById("plec");
const characters = document.getElementById("characters");
const prevButton = document.getElementById("prev-button");
const nextButton = document.getElementById("next-button");
const pageSize = 10;
let currentPage = 1; 
let array = [];

select2.addEventListener("change", function () {
  const option2 = select2.value;
  array = option2 === "male" ? man : option2 === "female" ? woman : [];
  currentPage = 1;
  renderPage(currentPage);
});

characters.addEventListener("click", function (event) {
  const selectedSkin = event.target;
  if (selectedSkin.tagName === "IMG") {
    const selectedSkinId = selectedSkin.id;

    if (selectedSkin.classList.contains("selected")) {
      showAllSkins();
      selectedSkin.classList.remove("selected");
      skinInput.value = "";
    } else {
      const previouslySelectedSkin = characters.querySelector(".selected");
      if (previouslySelectedSkin) {
        previouslySelectedSkin.classList.remove("selected");
      }
      selectedSkin.classList.add("selected");
      skinInput.value = selectedSkinId;
      hideOtherSkins(selectedSkinId);
      console.log(document.getElementById("birth").value);
    }
  }
});

prevButton.addEventListener("click", function () {
  if (currentPage > 1) {
    currentPage--;
    renderPage(currentPage);
  }
});

nextButton.addEventListener("click", function () {
  const totalPages = Math.ceil(array.length / pageSize);
  if (currentPage < totalPages) {
    currentPage++;
    renderPage(currentPage);
  }
});

function renderPage(page) {
  const startIndex = (page - 1) * pageSize;
  const endIndex = startIndex + pageSize;
  const paginatedArray = array.slice(startIndex, endIndex);

  characters.innerHTML = "";

  paginatedArray.forEach(function (skinId) {
    const fileName = `${skinId}.png`;
    const img = document.createElement("img");
    img.src = `/assets/dashboard/list_skin/${fileName}`;
    img.id = skinId;
    characters.appendChild(img);
  });

  updatePaginationButtons();
}

function hideOtherSkins(selectedSkinId) {
  characters.querySelectorAll("img").forEach(function (img) {
    if (img.id !== selectedSkinId) {
      img.style.display = "none";
    }
  });
}

function showAllSkins() {
  characters.querySelectorAll("img").forEach(function (img) {
    img.style.display = "block";
  });
}

function updatePaginationButtons() {
  const totalPages = Math.ceil(array.length / pageSize);
  prevButton.disabled = currentPage <= 1;
  nextButton.disabled = currentPage >= totalPages;
}
