# soft_bd



# Flutter App Documentation

## Table of Contents
1. [Overview](#overview)
2. [Installation](#installation)
3. [Screens](#screens)
    - [Home Page](#home-page)
    - [API Integration Page](#api-integration-page)
    - [User Input Page](#user-input-page)
4. [Features](#features)
5. [API Endpoints](#api-endpoints)
6. [Dependencies](#dependencies)
7. [State Management](#state-management)
8. [Responsiveness](#responsiveness)
9. [Screenshots and Video](#screenshots-and-video)
10. [Contributing](#contributing)
11. [License](#license)

## Overview
This Flutter application has three main screens with the following functionalities:
1. **Home Page:** 
    - Displays a circular progress bar to show the elapsed days, months, and years from the start date to today.
    - Shows the remaining days from today to the last day in a small box.
    - Displays some demo category items.
2. **API Integration Page:** 
    - Fetches data from an API.
    - Shows a small calendar with 7 previous and 7 upcoming days from today.
    - Allows the user to select a date and displays data from the API based on the selected date.
3. **User Input Page:** 
    - Allows the user to input extra data.
    - On submission, displays an alert dialog indicating that the data is saved and asks if the user wants to add more data.

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   ```
2. Navigate to the project directory:
   ```bash
   cd your-repo-name
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Screens

### Home Page
- **Progress Bar**: Displays elapsed time in days, months, and years from the start date to today.
- **Remaining Days**: Shows how many days are left until the last day.
- **Demo Categories**: Displays some demo category items.

### API Integration Page
- **Fetch Data**: Fetches and displays data from the provided API.
- **Calendar**: Shows 7 previous and 7 upcoming days from today.
- **Date Selection**: Allows the user to select a date and renders API data based on the selected date.

### User Input Page
- **Input Fields**: Allows users to enter extra data.
- **Submit Button**: On submission, displays an alert dialog indicating that the data is saved and asks if the user wants to add more data.

## Features
- **Circular Progress Bar**: Visual representation of elapsed and remaining days.
- **Date-based API Data Rendering**: Fetches and displays data based on selected dates.
- **User Data Input**: Allows users to input and save additional data.

## API Endpoints
- **GET Data**: Fetches data from the API.
  - Endpoint: `https://api.npoint.io/bc69ae1f6991da81ab9a`
  - Example response:
    ```json
    {
      "data": [
        {
          "date": "1720670400",
          "name": "Example Name",
          "category": "Example Category",
          "location": "Example Location"
        }
      ]
    }
    ```

## Dependencies
The project relies on the following dependencies:
- [`google_fonts: ^6.2.1`](https://pub.dev/packages/google_fonts)
- [`get: ^4.6.6`](https://pub.dev/packages/get)
- [`flutter_svg: ^2.0.10+1`](https://pub.dev/packages/flutter_svg)
- [`flutter_screenutil: ^5.9.3`](https://pub.dev/packages/flutter_screenutil)
- [`intl: ^0.19.0`](https://pub.dev/packages/intl)
- [`http: ^1.2.1`](https://pub.dev/packages/http)

Add these dependencies in your `pubspec.yaml` file:
```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.2.1
  get: ^4.6.6
  flutter_svg: ^2.0.10+1
  flutter_screenutil: ^5.9.3
  intl: ^0.19.0
  http: ^1.2.1
```

## State Management
This application uses GetX for state management. The controllers are used to manage the state of the application across different screens.

- **PreviUpcom7DayController**: Manages the state for the previous and upcoming 7 days.
- **TimeLineController**: Manages the state for the timeline.

Ensure to initialize your controllers properly and use `Obx` widgets to reactively update the UI based on state changes.

## Responsiveness
This app is designed to be responsive and adapts to various screen sizes using the `flutter_screenutil` package. Ensure to wrap your widgets with appropriate responsive units provided by `ScreenUtil` to maintain the layout consistency across different devices.

## Screenshots and Video
Here are some screenshots and a video demonstrating the app's functionality:

### Screenshots
![Screenshot_20240713-223715](https://github.com/user-attachments/assets/240e9d86-e528-4bb8-8b6a-a8c1d8fdc3ac)
![Screenshot_20240713-223739](https://github.com/user-attachments/assets/2f797667-787b-4d85-989e-a56325b1c9f1)
![Screenshot_20240713-223753](https://github.com/user-attachments/assets/5919a3d0-f40a-4376-b50d-9dbb6cd50666)
![Screenshot_20240713-223804](https://github.com/user-attachments/assets/8a031734-26c5-4417-aa0a-e69d63fc2aa0)
![Screenshot_20240713-223809](https://github.com/user-attachments/assets/b58a6c1b-7c4f-4929-9cc7-e17a38cf62fc)
![Screenshot_20240713-223815](https://github.com/user-attachments/assets/8b1da813-9370-4104-9e12-e79b3ad9e7ec)


### Video
[Watch the app video](https://drive.google.com/file/d/1a6DKdxVPOB6tYPmij3oKT0KR8aOKE5RL/view?usp=drive_link)

## Contributing
1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
3. Make your changes and commit them:
   ```bash
   git commit -m 'Add some feature'
   ```
4. Push to the branch:
   ```bash
   git push origin feature-name
   ```
5. Create a new Pull Request.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to further customize according to your project's specifics!

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to customize further according to your project's specifics!
