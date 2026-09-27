# DEVELOPMENT RULES

---

## 3.1 General Principles

The Hostel Management System must be developed using a clean, scalable, maintainable, and consistent development approach.

### Code Quality

- Code must be clean, readable, and properly structured.
- Follow consistent naming conventions throughout the project.
- Avoid unnecessary duplicate code.
- Reusable components should be created where appropriate.
- Keep each file and class focused on a specific responsibility.
- Avoid unnecessary complexity in implementation.

### Separation of Responsibilities

- UI code must be separated from business logic.
- Controllers must handle application state and user interactions.
- Data-related operations must remain inside the data/repository/service layer.
- Screens should not directly contain API, database, or storage implementation logic.
- Business logic should not be tightly coupled with UI widgets.

### Consistency

- Follow the same architecture and coding patterns throughout the application.
- Maintain consistent naming, folder organization, widget structure, and state-management patterns.
- Student and Admin modules must remain clearly separated.
- Reusable components should follow a common project-wide structure.

### Maintainability

- The project structure must make it easy to add, modify, or remove modules in the future.
- Changes in one module should not unnecessarily affect unrelated modules.
- Shared functionality should be centralized instead of being duplicated across modules.

### Responsive Development

- The application must support mobile, tablet, and desktop layouts.
- Responsive behavior should be handled consistently throughout the project.
- UI layout decisions should be separated from business logic.
- When mobile and desktop layouts are significantly different, separate view files may be used while keeping the same controller and business logic.

---

## 3.2 Technology & Coding Standards

### Framework and Language

- **Flutter** must be used for application development.
- **Dart** must be used as the programming language.
- Follow standard Dart and Flutter coding conventions.

### Architecture

- Use **GetX** for state management and dependency management.
- Follow an **MVVM-oriented architecture**.
- Use **Bindings** for dependency injection and module initialization.
- Maintain clear separation between View, Controller, and Data/Repository layers.

### API Communication

- Use **Dio** for HTTP/API communication.
- Use **Retrofit** for structured API service definitions.
- API-related code must remain inside the data/network/repository layer.
- UI screens must not directly perform API requests.

### Local Storage

- Use **GetStorage** for local storage requirements.
- Storage operations must be handled through a dedicated service or appropriate data layer.
- UI code must not directly contain storage implementation.

### Models and Serialization

- Create dedicated model classes for structured data.
- Use JSON serialization where required.
- Keep API models separate from UI-specific presentation logic.

### Naming Standards

- Use `lower_snake_case` for Dart file names.
- Use `PascalCase` for classes.
- Use `camelCase` for variables, methods, and object instances.
- Use clear and meaningful names.
- Avoid unclear abbreviations unless they are commonly understood.

### Dart/Flutter Standards

- Follow Dart null-safety.
- Prefer small, reusable widgets.
- Avoid unnecessarily large widget classes.
- Use `const` constructors/widgets where applicable.
- Keep business logic outside widget build methods.
- Avoid unnecessary rebuilds and redundant state updates.
- Use proper error handling for operations that can fail.

### Code Organization

- Imports should be organized consistently.
- Related code should remain grouped within its appropriate module.
- Shared utilities and reusable widgets must be placed in the `core` section.
- Data-related classes must remain within the `data` section or appropriate module data layer.

---

## 3.3 Project Structure

The project must follow a modular and scalable folder structure.

```text
lib/
├── core/
│   ├── theme/
│   ├── widgets/
│   ├── utils/
│   ├── constants/
│   ├── localization/
│   ├── error/
│   ├── services/
│   └── network/
│
├── data/
│   ├── models/
│   ├── network/
│   └── local/
│
├── modules/
│   ├── auth/
│   │   ├── views/
│   │   ├── controllers/
│   │   └── bindings/
│   │
│   ├── student/
│   │   ├── dashboard/
│   │   ├── hostel/
│   │   ├── room/
│   │   ├── fees/
│   │   ├── complaints/
│   │   ├── attendance/
│   │   ├── leave/
│   │   ├── mess/
│   │   ├── notices/
│   │   ├── notifications/
│   │   └── profile/
│   │
│   └── admin/
│       ├── dashboard/
│       ├── students/
│       ├── rooms/
│       ├── fees/
│       ├── complaints/
│       ├── attendance/
│       ├── leave/
│       ├── mess/
│       ├── notices/
│       ├── reports/
│       ├── notifications/
│       └── settings/
│
├── routes/
│   ├── app_routes.dart
│   └── app_pages.dart
│
├── app.dart
└── main.dart
```

### Core Directory

The `core` directory contains project-wide reusable resources.

```text
core/
├── theme/
├── widgets/
├── utils/
├── constants/
├── localization/
├── error/
├── services/
└── network/
```

These resources should be reusable across Student and Admin modules.

### Data Directory

The `data` directory contains data-related implementation.

```text
data/
├── models/
├── network/
└── local/
```

- `models/` → Data models
- `network/` → API/network-related implementation
- `local/` → Local data/storage-related implementation

### Module Structure

Each major application area must have its own module.

Example:

```text
fees/
├── views/
├── controllers/
└── bindings/
```

Where:

- `views/` → UI screens
- `controllers/` → State management and business interaction logic
- `bindings/` → Dependency injection and controller initialization

### Responsive View Structure

When mobile and desktop require substantially different layouts:

```text
fees/
├── views/
│   ├── fee_view.dart
│   ├── mobile_fee_view.dart
│   └── desktop_fee_view.dart
├── controllers/
│   └── fee_controller.dart
└── bindings/
    └── fee_binding.dart
```

The mobile and desktop views must use the same controller and business logic.

### Architecture Flow

The standard flow throughout the project must be:

```text
View
  ↓
GetX Controller
  ↓
Repository / Service
  ↓
API / Local Data
```

This separation must be maintained consistently across the project.
