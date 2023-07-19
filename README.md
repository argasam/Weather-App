# Weather APP

This is the Weather App data that provide weather in Monas, Jakarta, Indonesia. You will be provided with weather data for 5 days and 3 hours step. With that number you can see up too 40 weather data. 

This Weather App will consist of 2 pages, Home and Details. Home will show up to 40 datas. Details will show the details of every data in Home Page. On the first set up, there will be loading animation for fetching the data.


# How to Run the App
This App need to fetch Data from the openweather API. The API URL need to have the **location longitude and latitude, also the API key**. Those 3 things will be **provided** in the file.

To run the app you **need to**:

1. Create your file with random name 
example: (open your terminal)

```
> cd dekstop
> mkdir weather-app
> cd weather-app
```

2. Pull this Github Repository

```
git pull https://github.com/argasam/Weather-App.git
```

3. To Run the code, Do the command from your terminal

```
flutter run --dart-define-from-file=api-keys.json
```

4. If you have multiple device, choose one by pressing number provided by the system

## Flowchart of the App

```mermaid
graph LR
A((Loading)) --> B[Home] --> C[Detail 1]
B --> D[Detail 2]
B --> E[Detail ..]