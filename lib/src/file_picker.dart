import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:async';
import 'dart:io' ;  


class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool downloading=false;
  String ruta="No ha seleccionada un producto.";
  String nombre="sin nombre.";
  String tamano="Tamaño : 0";
  String exten="Extension : ";
  // final url="https://images.unsplash.com/photo-1618409698966-6caa2b95733a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  final url="https://www.cs.us.es/cursos/ai-2014/Ejercicios%20Excel/Ejercicio1.xls";

  @override
  Widget build(BuildContext context) {
     return Container(
      color: Colors.white,
       child: Scaffold(
         body: Center(
           child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
             children: [
              //  textoDepende(),
               SizedBox(height: 60,),
               IconButton(
                 icon: Icon(Icons.file_download), 
                 color: Colors.blueGrey,
                iconSize: 60,
                 onPressed: () {
                   _cargarArchivo();
                  // openFile();
                 }
                 ),
                SizedBox(height: 60,),
                Text(ruta,style: TextStyle(fontSize: 18, color: Colors.black),),
                SizedBox(height: 60,),
                Text(nombre,style: TextStyle(fontSize: 18, color: Colors.black),),
                SizedBox(height: 60,),
                Text(tamano,style: TextStyle(fontSize: 18, color: Colors.black),),
                SizedBox(height: 60,),
                Text(exten,style: TextStyle(fontSize: 18, color: Colors.black),),
             ],
           ),
         ),
         floatingActionButton: FloatingActionButton(
           onPressed: (){
             print("descargar");
             setState(() {
               downloading=false;
             });
           },
           child: Icon(Icons.sanitizer),
           ),
       ),
    );
  }
  // _abrirArchivo() async{

  //   FilePickerResult result = await FilePicker.platform.pickFiles();

  //     if(result != null) {
  //       File file = File(result.files.single.path);
  //     } else {
  //       // User canceled the picker
  //     }
  // }
  // https://stackoverflow.com/questions/61086708/flutter-sdk-location-not-found-define-location-with-sdk-dir-in-the-local-prope
  // https://github.com/miguelpruivo/flutter_file_picker/wiki/Troubleshooting#android

    Future<void> openFile() async {
    var filePath = r'/storage/emulated/0/update.apk';
    // final result = await FilePicker.pickFiles();
    FilePickerResult  result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf', 'xls']);
    // final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final filee = result.files.first;
      
      // filePath = file.path; 
       print("File Path Select---" + filee.path.toString());
      //  print("tamaño es ${filee.size}");
       setState(() {
         ruta = filee.path.toString();
       });
    } else {
      // User canceled the picker
    }
    // final _result = await OpenFile.open(filePath);
    // print(_result.message);

    // setState(() {
    //  var _openResult = "type=${_result.type}  message=${_result.message}";
    // });
  }

  Future<void> _cargarArchivo() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    int kbAmb = 0;
    double mb = 0.0;
    if(result != null) {
      PlatformFile file = result.files.first;
      kbAmb = file.size;
      mb = kbAmb/1024;
      setState(() {
         ruta = file.path.toString();
         nombre = file.name.toString();
        //  tamano = "$mb MB";
         tamano = file.size.toString();
         exten = file.extension.toString();
       });
      
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    } else {
      // User canceled the picker
    }
  }


  // Future archivo () async{
  //   FilePickerResult result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['png', 'cdr', 'psd'],
  //   );

  //   if(result != null) {
  //     files = File(result.files.single.path);

  //     setState(() {
  //       filePath = files.path;
  //       fileName = (filePath.split('/').last);
  //       print("File Path Select---" + files.path.toString());
  //     });
  //   } else {
  //     // User canceled the picker
  //   }
  // }

}