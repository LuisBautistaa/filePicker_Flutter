import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final url="https://images.unsplash.com/photo-1618409698966-6caa2b95733a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  bool downloading= false;
  String progress="";
  var dir;

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
               textoDepende(),
               SizedBox(height: 60,),
               IconButton(
                 icon: Icon(Icons.download_rounded), 
                 color: Colors.blueGrey,
                iconSize: 60,
                 onPressed: (){
                   dowloadFile();
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

  Widget textoDepende(){
    if(downloading == true){
      return Container(
        height: 120,
        width: 200,
        child: Card(
          color: Colors.blue,
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(backgroundColor: Colors.red,),
              SizedBox(
                height:20
              ),
              Text("Descargando archivo $progress")
            ],
          ),
        ),
      );
    }else{
      return Text("Clic en el Boton para descargar archivo");
    }   
  }

  Future<void> dowloadFile() async{
    Dio dio = Dio();

    try {
      dir = await getApplicationDocumentsDirectory();

      await dio.download(url, "${dir.path}/Formato_Importar_producto.jpg", 
      onReceiveProgress:(rec, total){
        print("Rec $rec Total $total");
        setState(() {
          downloading= true;
          progress =((rec/total)*100).toStringAsFixed(0)+"%";
        });
      } );
    } catch (e) {
      print("error $e");
    }
    setState(() {
      downloading=false;
      progress= "descarga completa";
      print(dir.listSync());
    });
  }
}