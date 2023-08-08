# SwiftGitApp
Aplicación **SwiftUI** para visualizar datos de Github dados un usuario y un token (Github token), implementa autenticación biométrica mediante **FaceID**.

![](https://camo.githubusercontent.com/cbe540fa5f1bd4860434caea1ebe43419ed42d92d54084d529c3a93a67139f10/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f73776966742532302d2532334641373334332e7376673f267374796c653d666f722d7468652d6261646765266c6f676f3d7377696674266c6f676f436f6c6f723d7768697465)

### Implementación
La aplicación está escrita en Swift con SwiftUI, implementa el patrón de arquitectura **MVVM** y una estructura similar a lo que se especifica para **Clean Code**.

Se utiliza biometría como factor de autenticación posterior al registro del usuario, el registro se basa en colocar el username y un token de Github que debe tener al menos permisos de repositorio (carga de repositorios privados).

Los servicios que se consumen son los siguientes:

> Repositorios: https://api.github.com/search/repositories?q=user:{username}

> Commits: https://api.github.com/repos/{username}/{reponame}/commits

> Info de usuario: https://api.github.com/users/{username}

Se debe de enviar el token de usuario en el **HEADER** del request (Bearer ghp_XXXXXXXXXXXXXXXX...) para el field **Authorization**.

Para almacenar los datos de utiliza **UserDefaults** (usuario) y **Keychain** (github token).

### Como se ve?

<img src="https://user-images.githubusercontent.com/61942641/173165878-583a3f30-787f-4bc0-850b-b99fce31d7b8.png" width="250">   <img src="https://user-images.githubusercontent.com/61942641/173165874-539422de-db45-4bd1-a4bd-9083fba4c283.png" width="250">   <img src="https://user-images.githubusercontent.com/61942641/173165877-53ad80a3-48fc-493e-8eda-423bb3201b57.png" width="250">

### Importante

El proyecto no usa **Pods** ni ninguna librería/paquete de terceros.

> Relacionado: https://github.com/hajc1294/KotlinGitApp

# TODO

* Pruebas unitarias
* Git worflow

