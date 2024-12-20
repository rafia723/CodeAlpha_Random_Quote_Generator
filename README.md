# CodeAlpha_Random_Quote_Generator
A full-stack project that generates random quotes with their authors and allows users to share quotes on social media. This project consists of two main parts:
- **Backend**: A Node.js API server that serves quotes from a database.
- **Frontend**: A Flutter mobile app that fetches quotes from the API and displays them to the user, with an option to share on social media.

## Project Structure
CodeAlpha_Random_Quote_Generator/ ├── backend/ # Node.js API (Express) │ ├── node_modules/ # Dependencies │ ├── server.js # Main server file │ └── quotes.js # Routes for fetching quotes │ └── frontend/ # Flutter mobile app ├── lib/ # Flutter application code ├── android/ # Android-specific code ├── ios/ # iOS-specific code └── pubspec.yaml # Flutter dependencies

markdown
Copy code

## Features
- **Backend**:
  - A Node.js server with Express that serves a random quote along with its author.
  - Quotes are fetched from a MySQL database.
  
- **Frontend**:
  - A Flutter app that communicates with the Node.js API to display random quotes.
  - A button to fetch a new random quote.
  - The ability to share the displayed quote on social media using the SharePlus plugin.

## Technologies Used
- **Backend**:
  - Node.js
  - Express.js
  - MySQL

- **Frontend**:
  - Flutter
  - Dart
  - SharePlus (for sharing quotes on social media)

## Setup and Installation

### 1. Clone the Repository
Clone the repository to your local machine:
```bash
git clone https://github.com/rafia723/CodeAlpha_Random_Quote_Generator.git
2. Set Up the Backend
Install Dependencies
Navigate to the backend folder and install the necessary Node.js dependencies:

bash
Copy code
cd backend
npm install
Set Up MySQL Database
Create a MySQL database (e.g., quotes_db).
Insert some sample quotes into your database:
sql
Copy code
CREATE TABLE quotes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  quote TEXT,
  author VARCHAR(255)
);

INSERT INTO quotes (quote, author) VALUES
("The will of man is his happiness.", "Friedrich Schiller"),
("Happiness is not something ready made. It comes from your own actions.", "Dalai Lama"),
("Turn your wounds into wisdom.", "Oprah Winfrey");
Start the Backend Server
Once the database is set up, start the Node.js server:

bash
Copy code
node server.js
This will start the server at http://localhost:3001.

3. Set Up the Frontend (Flutter)
Install Flutter
Make sure you have Flutter installed. Follow the official instructions to install Flutter: Flutter Installation Guide.

Install Dependencies
Navigate to the frontend folder and install the Flutter dependencies:

bash
Copy code
cd frontend
flutter pub get
Run the Flutter App
Make sure your emulator is running or your device is connected, then run the app:

bash
Copy code
flutter run
This will launch the Flutter app that connects to the backend and displays random quotes.

Usage
The app will fetch a random quote from the Node.js API and display it along with the author's name.
You can click the "Fetch New Quote" button to load another random quote.
The app also allows sharing the quote on social media via the SharePlus plugin.
Contributing
Fork the repository.
Create a new branch (git checkout -b feature-name).
Make your changes and commit (git commit -m 'Add feature').
Push to the branch (git push origin feature-name).
Create a pull request.
License
This project is open-source and available under the MIT License.

Acknowledgments
Special thanks to the creators of the libraries and tools used in this project:
Flutter
Node.js
Express.js
MySQL
SharePlus
markdown
Copy code

### What to Adjust:
- **Database Setup**: If you use a different database or have a more complex setup, adjust the instructions accordingly.
- **API Endpoint**: If your API endpoint changes, be sure to update it in the frontend code (in the `fetchQuote()` method).
- **Features and Instructions**: Add or modify based on any specific features or usage steps unique to your project.

Let me know if you need further modifications! 😊
