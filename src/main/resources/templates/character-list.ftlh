<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Marvel Heroes</title>

  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
    crossorigin="anonymous"
  >

  <style>
    .character-img {
      width: 100%;
      height: 320px;
      object-fit: cover;
      object-position: top;
    }

    .hero-card .card {
      transition: transform 0.15s ease, box-shadow 0.15s ease;
    }

    .hero-card .card:hover {
      transform: translateY(-3px);
      box-shadow: 0 10px 25px rgba(0,0,0,0.12);
    }
  </style>
</head>

<body>

  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="/characters">
        <img src="/img/superhero-logo.png" alt="superhero logo" width="80" height="65">
      </a>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" href="/characters">Home</a>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
              Character Details
            </a>
            <ul class="dropdown-menu">
                <#list allCharacters as character>
                    <li><a class="dropdown-item" href="/characters/${character.characterId}">${character.name}</a></li>
                    <#if character_has_next>
                        <li><hr class="dropdown-divider"></li>
                    </#if>
                </#list>
            </ul>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="/about">About Us</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="/create">Add a Character</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <main class="container py-5">


    <div class="row justify-content-center mb-5">
      <div class="col-12 col-md-8 col-lg-6 text-center">

        <h1 class="h3 mb-3">Marvel Heroes & Villains</h1>

        <!-- <div class="input-group mb-2">
          <input
            type="text"
            id="searchInput"
            class="form-control"
            placeholder="Search characters..."
          >
          <button class="btn btn-outline-secondary" type="button" id="searchBtn">
            Search
          </button>
        </div> -->

        <form action="/characters/search" method="get" class="input-group mb-2">
          <input
            type="text"
            name="name"
            class="form-control"
            placeholder="Search characters by name"
          >
          <button class="btn btn-outline-secondary" type="submit">
            Search
          </button>
      </form>

      <!-- <p class="text-secondary mb-0">
        Search by character name or category (hero, villain, human, etc.).
      </p> -->

      <hr>
      <div class="mb-3">
        Or filter by universe:
        <a href="/characters" class="btn btn-primary">All</a>
        <a href="/characters/universe/Marvel" class="btn btn-danger">Marvel</a>
        <a href="/characters/universe/DC" class="btn btn-dark">DC</a>
      </div>

      </div>
    </div>


    <div class="row row-cols-1 row-cols-md-3 g-4">

        <#list characters as character>

      <div class="col hero-card"
        data-name="iron man tony stark hero avenger human technology marvel">
        <div class="card h-100">
          <img src="${character.imageUrl!'img/default.jpg'}" class="card-img-top character-img" alt="${character.name} image">

          <div class="card-body">
            <h5 class="card-title">${character.name}</h5>
            <ul class="list-unstyled small mb-2">
              <li><strong>Universe:</strong> ${character.universe}</li>
              <li><strong>Role:</strong> ${character.role}</li>
              <li><strong>Species:</strong> ${character.species}</li>
              <li><strong>Power Level:</strong> ${character.powerLevel}</li>
            </ul>
            <p class="card-text">
              ${character.description}
            </p>

            <a href="/characters/${character.characterId}" class="btn btn-primary btn-sm">View Details</a>
          </div>
        </div>
      </div>
      </#list>
    </div>

    <p id="noResults" class="text-center text-secondary mt-4 d-none">
      No characters found.
    </p>

  </main>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

  <!-- <script>
    const searchInput = document.getElementById("searchInput");
    const searchBtn = document.getElementById("searchBtn");
    const heroes = document.querySelectorAll(".hero-card");
    const noResults = document.getElementById("noResults");

    function runSearch() {
      const query = searchInput.value.trim().toLowerCase();
      let matches = 0;

      heroes.forEach(hero => {
        const keywords = hero.getAttribute("data-name");
        if (keywords.includes(query)) {
          hero.style.display = "";
          matches++;
        } else {
          hero.style.display = "none";
        }
      });

      noResults.classList.toggle("d-none", matches !== 0);
    }

    searchBtn.addEventListener("click", runSearch);
    searchInput.addEventListener("keydown", e => e.key === "Enter" && runSearch());

    searchInput.addEventListener("input", () => {
      if (!searchInput.value.trim()) {
        heroes.forEach(hero => hero.style.display = "");
        noResults.classList.add("d-none");
      }
    });
  </script> -->

</body>
</html>
