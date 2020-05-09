// debug/breakpoint not working:
  //solution: flutter run --start-paused and then debug button will appear beside run button and hit debug from there
  // this will disable run button. to enable it use flutter run command

// flutter pub run build_runner build: running errors
  //solution 1: first try with flutter pub run build_runner build --delete-conflicting-outputs
  // solution 2: delete .dart_tool directory at the top of the project and go to pubspec.yaml and click pub get