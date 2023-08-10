

// fluter 
this command gets all the dependencies listed in the pubspec.yaml file in the current working directory,
 as well as their transitive dependencies. :
 --> flutter pub get 

// clean flutter :--> flutter clean

  // run chrom : flutter run -d chrome

  // flutter upgrade : flutter upgrade  

// http : dart pub add http   
   version : flutter --version  
   
 // repair :flutter pub cache repair   

 // doctor :flutter doctor

  // flutter doctor -v

//--> UPGRADE DART

   choco upgrade dart-sdk

// verifica devices : flutter devices
flutter config --android-sdk android_sdk_path

//flutter config --android-sdk c:\users\lahat\appdata\local\android\sdk

//flutter emulators --launch emulator name

//flutter pub upgrade --major-versions

start your app by running flutter run. the connected device name is android sdk built for <platform>, where platform is the chip family, such as x86.

// error 
target of uri doesn't exist: 'package:flutter/material.dart'.

--> flutter packages get

// data base objectbox  per generare il file :objectbox.g.dart
import 'objectbox.g.dart'; // created by
 --> `flutter pub run build_runner build`
   flutter pub run build_runner build


 // docker install
---> docker run -d -p 80:80 docker/getting-started

//firebase 

npm install -g firebase-tools


// message "flutter run: no connected devices" 
    1. impostation : java_home = c:\program files\java\jdk1.8.0_251
    2. accepte licenses :flutter -v doctor --android-licenses
    3. flutter doctor

// accepte licenses
[!] android toolchain - develop for android devices (android sdk version 32.1.0-rc1)
    x android license status unknown.
      run `flutter doctor --android-licenses` to accept the sdk licenses.
flutter -v doctor --android-licenses


// run emulator flutter and create emulator

list of emulators :flutter --emulators    
run : flutter emulators --launch name_emulator
run : flutter emulators --launch pixel_4_xl_2_edited_api_30
cleate emulator : flutter emulators --create emulator ecobio  

// eerore :error: no pubspec.yaml file found when running flutter 
 >>>> controll path progetto :c:\lahat\projet app\ecobio\ecobio 
 >>>no:c:\lahat\projet app\ecobio

 // errore :error: unable to find git in your path.
 controllo il path percorso del progetto

 // error: unable to find git in your path.
     controllo variabile ambienti path git -->
     c:\program files\git\cmd

// repair flutter  
flutter pub cache repair
se elimini un pacchetto da librerie esterne> pacchetti dart, 
devi eseguire --> "flutter pub cache repair"
 questo reinstallerà tutte le librerie esterne e aggiornerà quelle mancanti.
 "get dependencieso" "pub get" !

 // errore cannot rub
 error: cannot run with sound null safety, because the following dependencies
don't support null safety:

using the command line : flutter run --no-sound-null-safety
or to be specific (say in chrome)

flutter run -d chrome --no-sound-null-safety

https://stackoverflow.com/questions/64917744/cannot-run-with-sound-null-safety-because-dependencies-dont-support-null-safety

// run
 {
      "name": "ecobio",
      "request": "launch",
      "type": "dart",
      "program": "lib/main.dart"
  },


  // errore version dependencies 

-->  changed 1 dependency!
24 packages have newer versions incompatible with dependency constraints.
try `flutter pub outdated` for more information.

******* ps c:\lahat\projet app\ecobio\ecobio> flutter pub  outdated

 --> 3  dependencies are constrained to versions that are older than a resolvable version.
to update these dependencies, edit pubspec.yaml, or run `flutter pub upgrade --major-versions`.

****** ps c:\lahat\projet app\ecobio\ecobio> flutter pub upgrade --major-versions

// add version not prensent in the dependencies
    $ flutter pub add sa_multi_tween

    //errore:
    /c:/users/lahat/appdata/local/pub/cache/hosted/pub.dartlang.org/another_flushbar-1.10.29/lib/flushbar.dart:350:31: error: method 'addpostframecallback' cannot be called
      on 'schedulerbinding?' because it is potentially null.
      - 'schedulerbinding' is from 'package:flutter/src/scheduler/binding.dart' ('/c:/src/flutter/packages/flutter/lib/src/scheduler/binding.dart').
      try calling using ?. instead.
          schedulerbinding.instance.addpostframecallback(

      solution searche :   widgetsbinding.instance!.addpostframecallback((_) => yourfunction(context));
      replace  : widgetsbinding.instance?.addpostframecallback((_) => yourfunction(context));

      // update flutter sdk version 

     1.  flutter pub upgrade

    2.  # cd flutter_path/
    --> cd c:\src\flutter
      git add -a
      git reset --hard
      flutter upgrade --force
      
      ///>>>>>>  error intellij does not launch flutter app with chrome as expected
            flutter doctor --verbose


// path linbreia:c:\users\lahat\appdata\local\pub\cache\hosted\pub.dev

// c:\users\lahat\appdata\local\pub\cache\hosted\pub.dev\sharer-1.0.1

 // path .idea :c:\users\lahat\appdata\local\pub\cache\hosted\pub.dev\sharer-1.0.1\android
// path .gradle :c:\users\lahat\appdata\local\pub\cache\hosted\pub.dev\sharer-1.0.1\android

//error :

visual studio code - target of uri doesn't exist 'package:flutter/material.dart'

flutter clean

flutter packages get

flutter packages upgrade ( optional - use if you want to upgrade packages )

restart android studio or visual studio

// error :packages have newer versions incompatible with dependency constraints.try `flutter pub outdated` for more information.

solution of error: 1.flutter pub outdated
                   2.flutter pub upgrade --major-versions
                   3.flutter clean
                   4.flutter pub get


for upgrading from very old versions to null safety versions:

//upgrading flutter sdk
flutter upgrade
//upgrading dart code
dart migrate
// upgrading all pubspec.yaml package versions
flutter pub outdated --mode=null-safety

// download all new versions of the packages
dart pub get

dev_dependencies: all support null safety.
no resolution was found. try running `flutter pub upgrade --null-safety --dry-run` to explore why.

--------------------------------

Root cause

You are update or installing only a subset of the Firebase plugins (firebase_core, firebase_analytics,...)

Solution

Solution 1: (preferred) Updating to the latest version with flutterfire update check the docs here. But it is not easily because your project will have a lot of packages dependencies to each other like flutter version 2 or 3, so on. Anyway, it is long term solution.

Solution 2: (Fix to run) You can add to your pubspec.yaml

dependency_overrides:
firebase_core_platform_interface: 4.5.1
Solution 3: (Fix to run) Update dependencies with this below command line:

flutter pub upgrade --major-versions
Finally, Run the project again by following stuffs:

flutter clean
flutter pub get
cd ios && rm -f Podfile.lock
cd ios && pod install --repo-update
flutter run
*********************************PATH UTILITIES*******************
setting dart :C:\src\flutter\bin\cache\dart-sdk
flutter :C:\src\flutter

Dart entrypoint : path main project
Dart entrypoint:E:\Lahat\Projet App\AppBio\ecobio\workspace_ecobio\ecobio\lib\main.dart

cache\dart-sdk
C:\Users\lahat\AppData\Local\Pub

Error: No pubspec.yaml file found.
*****************************CLEAN CACHE REPAIR*****************************
To clear the global PUB_CACHE, run:

-->  dart pub cache clean
or
--> flutter pub cache clean

Just go to the terminal and type the command
-- flutter pub remove package_name
-- flutter pub remove flutter_riverpod

flutter pub remove web_socket_channel-2.3.0


flutter pub cache repair

********************************************************
ERRORE : Could not launch engine with configuration.

error: import of dartddd:mirrorsd is not supported in the current Dart runtime

https://stackoverflow.com/questions/73320160/e-flutter-24350-errorflutter-shell-common-shell-cc93-dart-error-error

I had same problem when I was back to stable channel that used an old engine respect to master channel.

Try to use master channel:

flutter channel master
flutter upgrade

****************************************************

# upgrade flutter in channel stable
flutter channel stable
flutter upgrade

# upgrade flutter pub packages
flutter pub outdated
flutter pub upgrade
----------------------------------

Running "flutter pub get" in ecobioweb...
Because every version of flutter_test from sdk depends on path 1.8.1 and ecobioweb depends on path ^1.8.2, flutter_test from sdk is forbidden.
So, because ecobioweb depends on flutter_test from sdk, version solving failed.
pub get failed (1; So, because ecobioweb depends on flutter_test from sdk, version solving failed.)

I solved for me. Run this command:

dart pub upgrade --null-safety
This command upgrade all libraries to null-safety versions. After optimize your codes for null-safety. You can see only upgradable libraries when this command run:

dart pub upgrade --null-safety --dry-run

---------------------------------
- flutter pub add flutter_localizations --sdk=flutter
  flutter pub add intl:any