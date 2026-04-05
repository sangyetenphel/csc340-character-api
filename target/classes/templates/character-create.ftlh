<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add a Character</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
    crossorigin="anonymous">

  <style>
    .form-card {
      max-width: 720px;
      margin: 0 auto;
      border-radius: 16px;
    }
  </style>
</head>

<body>
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="/characters">
        <img src="img/navbar-logo.png" alt="Marvel logo" width="80" height="65">
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
            <a class="nav-link active" aria-current="page" href="/create">
              Add a Character
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <main class="container py-5">

    <div class="card form-card shadow-sm p-4">
      <h1 class="h3 mb-2">Add a New Character</h1>
      <p class="text-secondary mb-4">
        Use the form below to submit a new superhero or villain.
      </p>
      <form action="/create" method="post">
        <div class="mb-3">
          <label for="name" class="form-label">Character Name</label>
          <input
            type="text"
            class="form-control"
            id="name"
            name="name"
            placeholder="Enter character name"
            required
          >
        </div>

        <div class="mb-3">
          <label for="realName" class="form-label">Real Name</label>
          <input
            type="text"
            class="form-control"
            id="realName"
            name="realName"
            placeholder="Enter character's real name"
          >
        </div>

        <div class="mb-3">
          <label for="universe" class="form-label">Universe</label>
          <select class="form-select" name="universe" required>
            <option value="" selected disabled>Choose a universe</option>
            <option value="marvel">Marvel Universe</option>
            <option value="dc">DC Universe</option>
          </select>
        </div>

        <div class="mb-3">
          <label for="role" class="form-label">Character Role</label>
          <select class="form-select" name="role" required>
            <option value="" selected disabled>Select role</option>
            <option value="hero">Hero</option>
            <option value="villain">Villain</option>
            <option value="antihero">Anti-Hero</option>
            <option value="other">Other</option>
          </select>
        </div>

        <div class="mb-3">
          <label class="form-label">Species</label>
          <input type="text" class="form-control" name="species">
        </div>

        <div class="mb-3">
          <label class="form-label">Power Level</label>
          <input type="text" class="form-control" name="powerLevel">
        </div>

        <div class="mb-3">
          <label class="form-label">Image URL</label>
          <input type="text" class="form-control" name="imageUrl" placeholder="/img/ironman.jpg">
        </div>


        <div class="mb-4">
          <label for="description" class="form-label">Short Description</label>
          <textarea
            class="form-control"
            id="description"
            name="description"
            rows="4"
            placeholder="Briefly describe the character..."
            required
          ></textarea>
        </div>

        <div class="mb-3">
          <label class="form-label">Full Description</label>
          <textarea class="form-control" name="fullDescription" rows="5"></textarea>
        </div>

        <div class="mb-3">
          <label class="form-label">Abilities</label>
          <textarea class="form-control" name="abilities" rows="2"></textarea>
        </div>


        <button type="submit" class="btn btn-primary">
          Submit Character
        </button>
      </form>
    </div>

  </main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
