# Weather App 🌤️

A simple Flutter app that shows real-time weather data for any city using the OpenWeatherMap API. This is not very fancy UI weather app , I made this just as my first project in flutter.

## Features

- Search weather by city name
- Displays current temperature, weather condition, and humidity
- Handles loading, error, and success states

## Screenshots

> Add your screenshots here

## Getting Started

### Prerequisites

- Flutter SDK installed
- An OpenWeatherMap API key (free at [openweathermap.org](https://openweathermap.org/api))

### Installation

1. Clone the repo
   ```bash
   git clone https://github.com/riturajdroid/weather_app.git
   cd weather_app
   ```

2. Install dependencies
   ```bash
   flutter pub get
   ```

3. Create a `.env` file in the project root
   ```
   WEATHER_API_KEY=your_api_key_here
   ```

4. Run the app
   ```bash
   flutter run
   ```

## Tech Stack

- **Flutter** — UI framework
- **Dart** — programming language
- **http** package — making API requests
- **flutter_dotenv** — managing environment variables
- **OpenWeatherMap API** — weather data

## What I Learned

- Fetching data from a REST API using the `http` package
- Parsing JSON into Dart model classes using `fromJson`
- Handling asynchronous operations with `async`/`await` and `Future`
- Displaying async data using `FutureBuilder`
- Passing data between screens using `Navigator`
- Managing API keys securely with `.env`

