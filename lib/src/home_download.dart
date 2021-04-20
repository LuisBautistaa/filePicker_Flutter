import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


class HomeDownloag extends StatefulWidget {
  HomeDownloag({Key key}) : super(key: key);

  @override
  _HomeDownloagState createState() => _HomeDownloagState();
}

class _HomeDownloagState extends State<HomeDownloag> {
  bool downloading=false;
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
                 icon: Icon(Icons.download_rounded), 
                 color: Colors.blueGrey,
                iconSize: 60,
                 onPressed: () async{
                  final status=  await Permission.storage.request();
                  if(status.isGranted){ 
                    
                    final directorio = await getExternalStorageDirectory();

                    final id  = await FlutterDownloader.enqueue(url: url, 
                    savedDir: directorio.path,
                    fileName: "Formato_Importar_producto",
                    openFileFromNotification: true,
                    showNotification: true);

                  }else{
                    print("permisos denegados");
                    final directorio = await getExternalStorageDirectory();

                    final id  = await FlutterDownloader.enqueue(url: url, 
                    savedDir: directorio.path,
                    fileName: "Formato_Importar_producto.jpg",
                    openFileFromNotification: true,
                    showNotification: true);
                  }
                   setState(() {
                    //  downloading=true;
                   });

                 })
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
}