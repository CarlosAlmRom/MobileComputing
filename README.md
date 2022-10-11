·Open VSCode and tab Ctrol + Shift + P and write Flutter: New Project

·Press Enter and call the project:

	project_application
  
·Replace all the lib folder with lib folder from GitHub

·Replace the pubspec.yaml file with the one that from GitHub

·Copy the assets folder into the main folder of the project.


·In VSCode terminal: 

	flutter pub add flutter_countdown_timer
  
	flutter pub add numberpicker
  
	flutter pub add flutter_spinkit
  

·Once all the packages are installed, go to the following directory:

	C:\dev\flutter\.pub-cache\hosted\pub.dartlang.org\flutter_countdown_timer-4.1.0\lib
  
·Open the countdown.dart file

·Replace the return Text of the line 8 with the following code and save:

	return Text('${currentRemainingTime.inSeconds}',
      		style: TextStyle(
          	fontFamily: 'Silkscreen', fontSize: 55, color: Colors.black));
	}
  
·Now the application should run perfectly
