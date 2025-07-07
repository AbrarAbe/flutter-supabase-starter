# **Flutter Supabase Starter**

Starter for Flutter Project with Supabase Integration

## Table of Contents

*   [Project Overview 🚀](#project-overview-)
*   [Features ✅](#features-)
*   [Installation 💻](#installation-)
*   [Environment Configuration ⚙️](#environment-configuration-️)
*   [Usage 🚀](#usage-)
*   [Contributing 🤝](#contributing-)
*   [License 📄](#license-)
*   [Contact 📧](#contact-)

## Project Overview 🚀

The **Flutter Supabase Starter** is a foundational template designed for developers embarking on new Flutter applications that require robust backend services. It streamlines the initial setup process by providing out-of-the-box integration with Supabase, focusing primarily on user authentication and basic data retrieval functionalities. This starter kit is ideal for Flutter developers looking for a quick and efficient way to kickstart their projects with a secure and scalable backend. ✨

## Features ✅

This starter project comes packed with features to accelerate your development:

*   **Authentication Flow** 🔐: Includes a complete login and registration logic, with a user-friendly interface that allows switching between screens via swipe gestures. Email/password authentication is fully implemented, with plans to extend support for OAuth and various social logins.
*   **User Profile Management** 👤: Basic data fetching for user profiles (e.g., username, email) is set up, providing a clear example that can be easily reconfigured for your specific needs.
*   **Home Screen Template** 🏠: A pre-built home screen template featuring an app bar and navigation bar, ready for further customization.
*   **Easy Supabase API Key Setup** ⚙️: Designed for straightforward configuration of Supabase API keys, ensuring a smooth connection to your backend.
*   **Riverpod State Management** 🎨: Comes pre-loaded with Riverpod for theme management, offering a flexible state management solution that can be further configured or swapped out for your preferred alternative.

## Installation 💻

Follow these steps to get your **Flutter Supabase Starter** project up and running:

### Prerequisites ⬇️

Ensure you have a standard Flutter development environment set up. This includes:

*   **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
*   **Git**: [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### Get the Project 📦

You can obtain the project using one of the following methods:

1.  **Clone with Git:**
    ```/dev/null/install.sh#L1-2
    git clone https://github.com/AbrarAbe/flutter-supabase-starter
    cd flutter-supabase-starter
    ```
2.  **Use GitHub Template:**
    Alternatively, you can simply click the "Use this template" button on the [GitHub repository page](https://github.com/AbrarAbr/flutter-supabase-starter) to create a new repository based on this starter.

### Install Dependencies ⚙️

Once you have the project locally, install the Flutter dependencies:

```/dev/null/install.sh#L4-4
flutter pub get
```

### Supabase Setup 🌐

Detailed instructions for setting up your Supabase project (creating a new project, setting up tables, obtaining API keys, etc.) are provided in a separate configuration file. Please refer to [SUPABASE_CONFIG.md](SUPABASE_CONFIG.md) in the project root for comprehensive guidance.

### Environment Configuration ⚙️

This project uses the `flutter_dotenv` package to manage environment variables, specifically your Supabase URL and Anon Key.

**Steps to configure your environment:**

1.  **Rename `.env.example`:** Rename the `.env.example` file located in the root of the project to `.env`.

2.  **Open `.env`:** Open the newly renamed `.env` file in your code editor.

3.  **Populate with your Supabase credentials:** Replace the placeholders for `SUPABASE_URL` and `SUPABASE_ANON_KEY` in the `.env` file. You can find these credentials in your Supabase project dashboard under Settings -> API.

4.  **Run the app:** Run your Flutter app. The `flutter_dotenv` package will automatically load the environment variables from the `.env` file.

### Run the Application ▶️

After installing dependencies and configuring Supabase, you can run the application on your desired device or emulator:

```/bash
flutter run
```

## Usage 🚀

The **Flutter Supabase Starter** provides a clear user experience and a solid foundation for developers:

### For End-Users (Application Walkthrough) 💡

When a user opens the application, they will be presented with an initial screen featuring both login and registration options. A simple swipe gesture allows them to switch between these two forms. Upon successful authentication, the user is seamlessly redirected to the home screen, which displays their account information, such as their username and email.

### For Developers (Leveraging the Template) 🛠️

This template offers significant advantages for developers during project initialization:

*   **Complete Authentication Logic**: Ready-to-use login and registration logic, saving considerable development time.
*   **Simplified Supabase API Key Setup**: Easy-to-follow instructions for integrating your Supabase project.
*   **Pre-configured Home Screen**: A well-structured home screen setup complete with an app bar and navigation bar.
*   **Basic Data Fetching Examples**: Functional examples for fetching account and user profile data, which can be easily reconfigured to suit specific project requirements.
*   **Integrated State Management**: Comes with Riverpod preloaded for theme management, providing a robust state management solution that can be further customized or replaced based on developer preference.

## Contributing 🤝

We welcome contributions to the **Flutter Supabase Starter** project! While we don't have specific detailed guidelines yet, here's a general overview of how you can contribute:

*   **Reporting Bugs** 🐛: If you find any bugs or issues, please open an issue on the GitHub repository. Provide a clear description of the bug, steps to reproduce it, and any relevant error messages.
*   **Suggesting Features** ✨: Have an idea for a new feature or improvement? Feel free to open an issue to suggest it. Describe your idea and why you think it would be valuable.
*   **Submitting Pull Requests** ⬆️: If you'd like to contribute code, please fork the repository and create a pull request with your changes. Ensure your code is well-commented and follows general Flutter coding conventions.

We appreciate your help in making this starter even better!

## Contribution Stats ##
![Alt](https://repobeats.axiom.co/api/embed/17352fa024a29e62426902a8830a3a17cbb7b80b.svg "Repobeats analytics image")

## License 📄

This project is open-source and is distributed under the `Apache 2.0 License`. See the [LICENSE](LICENSE) file for details.

## Contact 📧

For any questions or support, please open an issue on the [GitHub repository](https://github.com/AbrarAbe/flutter-supabase-starter).