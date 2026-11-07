# Experiment 9: Fetching Data from a REST API and Displaying It in Flutter UI

## Objective

Learn how to make an HTTP GET request, decode a JSON response, and handle network and HTTP errors in Flutter.

## Implementation in this folder

`bmi_api_service.dart` defines `BmiApiService.fetchDemoPost()`. It requests the sample post at `https://jsonplaceholder.typicode.com/posts/1`, applies a 15-second timeout, checks for an HTTP 200 response, and decodes the JSON body into a `Map<String, dynamic>`.

This file provides the API service layer. It does not itself build a screen, loading indicator, or error-state UI; those can be connected to a widget in a later integration step. JSONPlaceholder is a public learning/test API, not a BMI or medical-information service. The BMI calculation remains separate from this sample request.

## Dependency

The root `pubspec.yaml` includes `http: ^1.2.2`.

## Run / verify

From the Flutter project root:

```bash
flutter pub get
flutter analyze
flutter run
```
