# Ashoai

Ashoai (عشوائي) is a Flutter-based mobile application designed as a local directory for the city of Basous, Egypt. It helps users discover and locate various services such as cafes, restaurants, and pharmacies within different neighborhoods. The app features a unique dark, purple-themed UI with glowing visual effects.

## Key Features

*   **Regional Navigation:** Easily browse through different areas and sub-regions of Basous.
*   **Service Discovery:** Find local businesses categorized by service type (e.g., Restaurants, Cafes, Pharmacies).
*   **Detailed Listings:** Access essential information for each place, including its name, address, and phone number.
*   **Modern UI/UX:** A visually appealing dark interface with custom glow background effects for an immersive user experience.

## Application Flow

1.  **Home Screen:** The app opens with the logo and a "Join" button to enter the directory.
2.  **Region Selection:** Users choose a main region (currently, "Basous" is the primary available region).
3.  **Sub-Region Selection:** A grid of neighborhoods within the chosen region is displayed (e.g., Rustom, Fares St.).
4.  **Service Selection:** Users pick a service category they are interested in for the selected neighborhood.
5.  **Places List:** A list of relevant businesses is shown, with each entry displaying a name, address, and phone number.

## Technology Stack

*   **Framework:** Flutter
*   **Language:** Dart

## Project Structure

The core application logic is located within the `lib/screens` directory, organized as follows:

-   `home_screen.dart`: The initial landing screen of the application.
-   `regions_screen.dart`: Displays the main geographical regions.
-   `sub_regions_screen.dart`: Shows the sub-regions or neighborhoods within a selected region.
-   `services_screen.dart`: Lists the available service categories (cafes, restaurants, etc.).
-   `places_screen.dart`: Presents the final list of businesses based on user selections. It contains the hardcoded data for the listings.
-   `background_painter.dart`: A custom painter used to create the app's signature glowing background effect.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

Ensure you have the Flutter SDK installed on your machine. For installation instructions, see the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

### Installation

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/YousefAlBadawi/Ashoai.git
    ```

2.  **Navigate to the project directory:**
    ```sh
    cd Ashoai
    ```

3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

4.  **Run the application:**
    ```sh
    flutter run
