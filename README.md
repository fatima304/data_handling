# Employee Directory App

A Flutter app that fetches employee data from a REST API, displays it in a list, and allows users to view employee details. The app also handles errors, loading states, and locally cached data.

**GitHub Repository:** [https://github.com/fatima304/data_handling]

## Features

* Fetch employee data from a REST API
* JSON parsing with an Employee model
* Employee list with name and salary
* Employee details screen
* Navigation with data passing
* Loading and error states
* Local caching using SharedPreferences
* Load cached data after app restart

## Technologies

* Flutter & Dart
* HTTP
* Dio
* SharedPreferences
* REST API
* JSON
* Flutter Navigator

## API

**Endpoint:** `https://dummy.restapiexample.com/api/v1/employees`

**Method:** `GET`

## Project Structure

```text
lib/
├── main.dart
├── core/
│   └── constants/
│       └── api_constants.dart
└── features/
    └── employee/
        ├── data/
        │   ├── models/
        │   │   └── employee_model.dart
        │   └── service/
        │       ├── api_service.dart
        │       └── employee_cache_service.dart
        └── presentation/
            ├── employee_screen/
            │   ├── employee_screen.dart
            │   └── widgets/
            │       ├── employee_card.dart
            │       ├── employee_error_widget.dart
            │       ├── employee_header.dart
            │       ├── employee_list_content.dart
            │       └── load_employees_button.dart
            └── employee_details_screen/
                ├── employee_details_screen.dart
                └── widgets/
                    ├── employee_avatar.dart
                    └── employee_info_card.dart
```

## How to Run

```bash
flutter pub get
flutter run
```

## Screenshots

### Employee List

Shows the fetched employees with their names and salaries.

### Employee Details

Shows the selected employee's name, age, and salary.

### Loading State

Shows the loading indicator while fetching employee data.

### Cached Data

Shows cached employee data loaded after restarting the app.

## Implementation

### Phase 1

* HTTP API request
* JSON parsing
* Employee model
* Employee list

### Phase 2

* Replaced HTTP with Dio
* Error handling
* Loading indicator
* Details screen and navigation
* SharedPreferences caching
* Cached data loading on app restart
