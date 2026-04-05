<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${character.name} – Character Details</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

  <style>
    .hero-banner {
      max-height: 420px;
      object-fit: cover;
      object-position: top;
    }

    .details-card {
      border-radius: 16px;
    }
  </style>
</head>

<body>
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="/characters">
        <img src="/img/superhero-logo.png" alt="Superhero logo" width="80" height="65">
      </a>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link" href="/characters">Home</a>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown">
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

  <img src="${character.imageUrl!'/img/default.jpg'}" class="img-fluid w-100 hero-banner" alt="${character.name} flying">

  <main class="container py-5">

    <div class="row g-4">
      <div class="col-lg-8">
        <h1 class="mb-3">${character.name}</h1>
        <#list character.fullDescription?split("\n\n") as paragraph>
          <p>${paragraph}</p>
        </#list>
      </div>

      <div class="col-lg-4">
        <div class="card details-card shadow-sm p-3">
          <h5 class="mb-3">Character Details</h5>

          <ul class="list-unstyled mb-0">
            <li><strong>Name:</strong> ${character.realName}</li>
            <li><strong>Alias:</strong> ${character.name}</li>
            <li><strong>Universe:</strong> ${character.universe}</li>
            <li><strong>Role:</strong> ${character.role}</li>
            <li><strong>Species:</strong> ${character.species}</li>
            <li><strong>Power Level:</strong> ${character.powerLevel}</li>
            <li><strong>Abilities:</strong> ${character.abilities}</li>
          </ul>

          <hr>

          <a href="/edit/${character.characterId}" class="btn btn-warning mb-2">Edit</a>
          <a href="/delete/${character.characterId}" class="btn btn-danger">Delete</a>
        </div>
      </div>
    </div>

  </main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
