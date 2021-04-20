import 'package:app_download/src/file_picker.dart';
import 'package:app_download/src/home_download.dart';
import 'package:app_download/src/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart'; 

void main() async{ 
  
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
    debug: true // optional: set false to disable printing logs to console
  );

  runApp(MyApp());
  
  }
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Material App",
      initialRoute: 'home3',
      routes: {
        'home'   : (BuildContext contex) => HomePage(),
        'home2'   : (BuildContext contex) => HomeDownloag(),
        'home3'   : (BuildContext contex) =>  App() 
      },
    );
  }
}