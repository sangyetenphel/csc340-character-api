<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Marvel Heroes</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
        <a class="navbar-brand" href="/characters">
            <img src="img/superhero-logo.png" alt="Superhero logo" width="80" height="65">
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
                <a class="nav-link active" aria-current="page" href="/about">About Us</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/create">Add a Character</a>
            </li>
            </ul>
        </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="alert alert-danger">
            <h4>Character not found</h4>
            <p>Please check the ID and try again.</p>
        </div>

        <a href="/characters" class="btn btn-primary">Back</a>
    </div>
</body>
</html>