# Projekt Chat App README

## 1. Przegląd Projektu

Chat App jest nowoczesną platformą komunikacyjną zaprojektowaną do bezpiecznego i płynnego przesyłania wiadomości w czasie rzeczywistym za pomocą przyjaznego dla użytkownika interfejsu. Zapewnia funkcjonalności takie jak rejestracja użytkowników, logowanie, zarządzanie kontaktami, wysyłanie i odbieranie wiadomości oraz dostęp do historii konwersacji. System kładzie duży nacisk na solidne zabezpieczenia oraz efektywne zarządzanie danymi.

## 2. Funkcje Aplikacji

- **Rejestracja Użytkownika**: Użytkownicy mogą łatwo tworzyć nowe konta za pomocą uproszczonego formularza rejestracyjnego.
- **Logowanie**: Bezpieczne uwierzytelnianie użytkowników za pomocą JWT zapewnia, że dostęp do aplikacji mają tylko autoryzowane osoby.
- **Lista Kontaktów**: Użytkownicy mogą tworzyć, aktualizować oraz usuwać informacje o swoich kontaktach w aplikacji.
- **Wysyłanie i Odbieranie Wiadomości**: Obsługa komunikacji w czasie rzeczywistym poprzez Spring WebSocket API.
- **Historia Wiadomości**: Aplikacja rejestruje i pokazuje historię konwersacji pomiędzy użytkownikami dla łatwego odniesienia.

## 3. Technologie

Aplikacja opiera się na zestawie nowoczesnych technologii i frameworków, aby zapewnić skalowalną i łatwą w utrzymaniu platformę komunikacyjną:

- **Spring Boot**: Ułatwia tworzenie wydajnych i odpornych aplikacji opartych na Spring Framework.
- **Spring WebSocket API**: Umożliwia interaktywne, dwukierunkowe sesje komunikacyjne między klientami a serwerami.
- **Spring Data JPA (Hibernate)**: Zarządza interakcjami z bazą danych za pomocą odwzorowania obiektowo-relacyjnego.
- **PostgreSQL**: Potężny, otwartoźródłowy system baz danych obiektowo-relacyjnych.
- **AspectJ**: Implementuje programowanie zorientowane na aspekty dla efektywnego rozdzielenia kodu.
- **JWT**: Zabezpiecza informacje za pomocą JSON Web Tokens.
- **Docker & Docker Compose**: Narzędzia do konteneryzacji i orkiestracji upraszczające procesy wdrożenia.

## 4. Narzędzia Projektowe

Różnorodne narzędzia wspierają rozwój i testowanie aplikacji:

- **IntelliJ IDEA**: Kompleksowe środowisko integracji dla Java.
- **JavaDoc**: Generuje szczegółową dokumentację bezpośrednio z kodu źródłowego Java.
- **JUnit**: Umożliwia rygorystyczne testowanie jednostkowe.
- **Postman**: Wszechstronne narzędzie do testowania i rozwijania API.
- **Cypress**: Ułatwia testy end-to-end zapewniając spójne doświadczenia użytkownika.
- **Maven**: Efektywnie zarządza zależnościami projektu oraz procesami budowania.

## 5. Kompatybilność Systemu

Aplikacja zapewnia kompatybilność z:

- **Java 17 lub nowszą**: Zgodność z najnowszymi ulepszeniami w ekosystemie Java.
- **Docker 20.x oraz Docker Compose 2.x**: Niezbędne do wdrażania i zarządzania kontenerami aplikacji.
- **Przeglądarki**: Kompatybilna z nowoczesnymi przeglądarkami internetowymi, w tym Chrome, Firefox i Edge.

## 6. Diagramy i Architektura

### Architektura Systemu
```mermaid
graph TD;
    User-->UI;
    UI-->Server;
    Server-->Database;
    Server-->API;
    API-->ExternalServices;
```

### Diagram Klas UML
```mermaid
classDiagram
    class User {
        +String firstName
        +String lastName
        +String email
        +login()
        +logout()
    }
    class Message {
        +String text
        +Date dispatchTime
        +User sendingUser
        +User receivingUser
        +send()
        +receive()
    }
```

### Schemat Bazy Danych
```mermaid
erDiagram
    USERS {
        id int PK
        first_name varchar
        last_name varchar
        email varchar
    }
    MESSAGES {
        id int PK
        text varchar
        dispatch_time timestamp
        sender_id int
        receiver_id int
    }
    USERS ||--o{ MESSAGES : sends
    USERS ||--o{ MESSAGES : receives
```

## 7. Specyfikacja API OpenAPI

```yaml
openapi: 3.0.0
info:
  title: Chat App API
  version: 1.0.0
paths:
  /auth/register:
    post:
      summary: Register a new user
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/UserRegistration'
      responses:
        '201':
          description: User registered successfully
  /auth/login:
    post:
      summary: Authenticate user and return a token
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/UserLogin'
      responses:
        '200':
          description: Authentication successful
  /contacts:
    get:
      summary: Retrieve contact list
      responses:
        '200':
          description: Contact list retrieved successfully
    post:
      summary: Add a new contact
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Contact'
      responses:
        '201':
          description: Contact added successfully
  /contacts/{id}:
    delete:
      summary: Remove a contact
      parameters:
        - name: id
          in: path
          required: true
          schema:
            type: integer
      responses:
        '204':
          description: Contact removed successfully
components:
  schemas:
    UserRegistration:
      type: object
      properties:
        firstName:
          type: string
        lastName:
          type: string
        email:
          type: string
        password:
          type: string
    UserLogin:
      type: object
      properties:
        email:
          type: string
        password:
          type: string
    Contact:
      type: object
      properties:
        firstName:
          type: string
        lastName:
          type: string
        email:
          type: string
```

**Ostateczne Uwagi**: Regularne aktualizacje dokumentacji technicznej są kluczowe dla utrzymania integralności projektu oraz zrozumienia.