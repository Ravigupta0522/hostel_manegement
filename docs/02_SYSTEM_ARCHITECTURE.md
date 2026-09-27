# SYSTEM ARCHITECTURE

---

## 2.1 High-Level Architecture

The Hostel Management System will follow a **clean, scalable, and modular application architecture**.

The architecture should separate the application into different responsibilities so that UI, business logic, data handling, API communication, local storage, and common application services do not become tightly coupled.

The overall application flow should follow this conceptual structure:

```text
User
  ↓
UI / View
  ↓
Controller
  ↓
Repository / Service
  ↓
API / Local Storage
  ↓
Data Source
```

### Architecture Responsibilities

#### Presentation Layer

The Presentation Layer will contain:

- Screens
- Views
- UI components
- Responsive layouts
- User interactions

The UI should be responsible for displaying information and receiving user input.

UI code should not directly handle API calls or plugin operations.

---

#### Controller Layer

Controllers will manage:

- UI state
- User interactions
- Form state
- Loading state
- Success state
- Error state
- Communication with repositories/services

Controllers should contain application-level presentation logic and should not contain unnecessary UI implementation details.

---

#### Data Layer

The Data Layer will handle:

- Data models
- API communication
- Local storage
- Repository/data access logic

The data layer should provide a clear separation between the UI and external data sources.

---

#### API Layer

The API layer will be responsible for communication with the backend.

The API architecture will use:

- Dio
- Retrofit

API-related implementation should remain separate from UI code.

---

#### Local Storage Layer

Local application data that needs to persist locally should be handled through the configured local storage mechanism.

The UI should not directly communicate with the storage plugin.

---

### Overall Architecture Flow

```text
┌──────────────────────────────┐
│            User              │
└──────────────┬───────────────┘
               ↓
┌──────────────────────────────┐
│       Presentation Layer     │
│                              │
│ Views / Screens / Widgets    │
└──────────────┬───────────────┘
               ↓
┌──────────────────────────────┐
│        GetX Controller       │
│                              │
│ State + UI Logic             │
└──────────────┬───────────────┘
               ↓
┌──────────────────────────────┐
│    Repository / Service      │
└──────────────┬───────────────┘
               ↓
        ┌──────┴──────┐
        ↓             ↓
┌──────────────┐ ┌──────────────┐
│ API / Retrofit│ │ Local Storage│
│    + Dio      │ │  GetStorage  │
└──────┬───────┘ └──────────────┘
       ↓
┌──────────────────────────────┐
│        Backend / API         │
└──────────────────────────────┘
```

---

## 2.2 Technology Stack

The application will use the following technology stack.

### Frontend

**Flutter**

Flutter will be used to build the application UI.

The application should support responsive layouts for:

- Mobile
- Tablet
- Desktop

---

### Programming Language

**Dart**

Dart will be used as the primary programming language for the Flutter application.

The implementation should follow Dart null-safety and clean coding practices.

---

### State Management

**GetX**

GetX will be used for:

- State management
- Controllers
- Dependency injection
- Navigation where applicable

Controllers should manage the state required by their respective modules.

---

### Architecture Pattern

**MVVM-oriented architecture**

The application should follow an MVVM-oriented separation between:

```text
View
 ↓
ViewModel / Controller
 ↓
Data / Repository / Service
```

In the Flutter implementation, GetX Controllers will handle the ViewModel/controller responsibilities.

---

### API Communication

**Dio + Retrofit**

Dio will be used as the HTTP client.

Retrofit will be used to define structured API service interfaces.

The API layer should remain independent from the UI.

---

### Local Storage

**GetStorage**

GetStorage will be used for local persistent application data where required.

Storage access should be handled through a dedicated service rather than directly from UI screens.

---

### Supporting Packages

The project may use the following configured technologies/packages where required by the architecture:

- Get
- Dio
- Retrofit
- JSON Annotation
- GetStorage
- Image Picker
- File Picker
- Permission Handler
- Connectivity Plus
- Build Runner
- Retrofit Generator
- JSON Serializable

These technologies should be integrated according to their respective responsibilities.

---

## 2.3 Folder Structure

The project should follow a clean and scalable folder structure.

```text
lib/
│
├── core/
│   │
│   ├── theme/
│   │   ├── app_theme.dart
│   │   ├── app_colors.dart
│   │   └── app_text_styles.dart
│   │
│   ├── widgets/
│   │   ├── primary_button.dart
│   │   ├── secondary_button.dart
│   │   ├── app_text_field.dart
│   │   ├── password_text_field.dart
│   │   ├── loading_widget.dart
│   │   └── empty_state_widget.dart
│   │
│   ├── utils/
│   │   ├── validators.dart
│   │   ├── logger.dart
│   │   └── responsive.dart
│   │
│   ├── constants/
│   │   ├── app_constants.dart
│   │   └── app_strings.dart
│   │
│   ├── localization/
│   │   ├── translations.dart
│   │   └── languages/
│   │       ├── en.dart
│   │       └── hi.dart
│   │
│   ├── error/
│   │   ├── api_exception.dart
│   │   └── error_handler.dart
│   │
│   ├── services/
│   │   ├── storage_service.dart
│   │   ├── snackbar_service.dart
│   │   ├── loading_service.dart
│   │   ├── connectivity_service.dart
│   │   ├── image_picker_service.dart
│   │   ├── file_picker_service.dart
│   │   └── permission_service.dart
│   │
│   └── network/
│       ├── dio_client.dart
│       ├── api_service.dart
│       └── interceptors/
│
├── data/
│   │
│   ├── models/
│   │
│   ├── network/
│   │
│   └── local/
│
├── modules/
│   │
│   ├── auth/
│   │   ├── views/
│   │   ├── controllers/
│   │   └── bindings/
│   │
│   ├── student/
│   │
│   └── admin/
│
├── routes/
│   ├── app_routes.dart
│   └── app_pages.dart
│
├── app.dart
│
└── main.dart
```

---

## Module Structure

Each major feature/module should have its own directory.

Example:

```text
modules/
│
├── student/
│   │
│   ├── dashboard/
│   ├── hostel/
│   ├── room/
│   ├── fees/
│   ├── complaints/
│   ├── attendance/
│   ├── leave/
│   ├── mess/
│   ├── notices/
│   ├── notifications/
│   └── profile/
│
└── admin/
    │
    ├── dashboard/
    ├── students/
    ├── rooms/
    ├── fees/
    ├── complaints/
    ├── notices/
    ├── attendance/
    ├── leave/
    ├── mess/
    ├── reports/
    ├── notifications/
    └── settings/
```

---

## Individual Module Structure

Each module should maintain separation between its views, controllers, and dependency bindings.

Example:

```text
fees/
│
├── views/
│   ├── fee_dashboard_view.dart
│   ├── fee_details_view.dart
│   └── payment_view.dart
│
├── controllers/
│   └── fee_controller.dart
│
└── bindings/
    └── fee_binding.dart
```

If a screen requires different layouts for different platforms, the view structure can be separated accordingly:

```text
fees/
│
├── views/
│   ├── fee_view.dart
│   ├── mobile_fee_view.dart
│   └── desktop_fee_view.dart
│
├── controllers/
│   └── fee_controller.dart
│
└── bindings/
    └── fee_binding.dart
```

The Mobile and Desktop views must use the same controller and underlying business/data logic.

---

## Architecture Principles

The implementation should maintain the following separation:

```text
UI
 ↓
Controller
 ↓
Repository / Service
 ↓
API / Local Data
```

Avoid putting API calls, storage operations, or plugin operations directly inside UI screens.

The folder structure should remain modular so additional Hostel Management System features can be added without restructuring the entire project.
