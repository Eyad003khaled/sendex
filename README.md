# SENDEX

This Flutter-based mobile application provides a user-friendly interface for managing orders. It includes functionality for user login, viewing a list of orders, and viewing detailed order information with the ability to update the status of orders. The app uses mock data and can be easily integrated with a real backend for dynamic data retrieval and storage.

## Features

### 1. **Login Screen**
- **Email and Password fields**: Users can enter their credentials to log in.
- **Input Validation**: Ensures the email is correctly formatted and the password meets security requirements before submission.
- **Store Login Info Locally**: The app stores the login information in local Storage (using  mock data) to maintain session information for the user.

### 2. **Orders Screen**
- **Display List of Orders**: Shows a list of orders with relevant details for each order:
  - **Client Name**: The name of the client placing the order.
  - **Client Address**: The delivery address for the order.
  - **Order Status**: The current status of the order (e.g., Pending, Processing, Delivered, Cancelled).
  - **Details Button**: A button that navigates to the **Order Details Screen** for more information about the selected order.
- **Data Source**: The list of orders is populated from a mock API 

### 3. **Order Details Screen**
- **View Full Order Info**: Displays detailed information about a specific order, including client details, order date, product name, total amount, and order status.
- **Update Status Button**: Provides the functionality to update the status of the order. The status can be updated to either **Delivered** or **Cancelled**.
  - **Button Behavior**: The button toggles the order's status, cycling through possible states: `Pending → Processing → Delivered → Cancelled`.

## Technology Stack
- **Flutter**: For building the cross-platform mobile app.
- ** Local Storage (Shared Prefrences)**: Used for storing user login information and possibly order data.
- **Dart**: Programming language used for app development.
- **JSON / Mock API**: For providing data to the app (simulating real-world backend data).

## Installation Instructions

1. Clone this repository:

    ```bash
    git clone https://github.com/Eyad003khaled/sendex.git
    ```

2. Navigate to the project directory:

    ```bash
    cd sendex
    ```

3. Install the necessary dependencies:

    ```bash
    flutter pub get
    ```

4. Run the app on an emulator or a connected device:

    ```bash
    flutter run
    ```

## Contribution Guidelines

We welcome contributions to enhance and improve this project. Please fork the repository, make your changes, and create a pull request. Ensure that all code adheres to the existing style and includes relevant test cases where applicable.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


 
