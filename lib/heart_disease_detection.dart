//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:health_dash/loader.dart';
// import 'dart:convert';
// import 'package:image_picker/image_picker.dart';
// import 'package:tflite/tflite.dart';
//
// class HeartDiagnosis extends StatefulWidget {
//   @override
//   _HeartDiagnosisState createState() => _HeartDiagnosisState();
// }
//
// class _HeartDiagnosisState extends State<HeartDiagnosis> {
//   List _outputs;
//   File _image;
//   @override
//   void initState() {
//     super.initState();
//     loadModel().then((value) {setState((){});});
//
//   }
//   bool _loading=false;
//   List list=[63,1,3,145,233,150,0,0] ;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xffe4ebfe),
//         appBar: AppBar(
//           backgroundColor: Color(0xff7380f2),
//           elevation: 0,
//           centerTitle: true,
//           title: const Text(
//             "Covid-19 detection from Chest X-Ray",
//             style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
//           ),
//           leading: new IconButton(
//             icon: new Icon(
//               Icons.arrow_back_ios,
//               size: 26.0,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: ListView(
//           shrinkWrap: true,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset("assets/covid.png"),
//                 Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: Text(
//                     "1. Click on predict.\n \n2. Pick an X-Ray image from gallery.\n\n3. After few seconds the result will be there.",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),
//                   ),
//                 ),
//                 SizedBox(height: 20,),
//                 Center(
//                   child: SizedBox(
//                     width: 140,
//                     height: 60,
//                     child: RaisedButton(
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//                       onPressed: (){
//                         classifyImage(list.toString());
//                         setState(() {
//                           _loading=true;
//                         });
//
//                       },
//                       color: Color(0xff7380f2),
//                       splashColor: Color(0xfffe7940),
//                       child: Text("predict", style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20,),
//                 _outputs!=null&&_loading==false?Card(
//                     elevation: 10,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                     color: Color(0xffffffff),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text("${_outputs[0]["label"]} with ${double.parse(_outputs[0]["confidence"].toStringAsFixed(3))} confidence", style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
//                     )):SpinKitCircle(
//                   color: Colors.black,
//                   size: 100,
//                 ),
//
//               ],
//             ),
//           ],
//         )
//     );
//   }
//   // pickImage() async {
//   //   File image = (await ImagePicker.pickImage(source: ImageSource.gallery)) ;
//   //   if (image == null) return null;
//   //   setState(() {
//   //     _image = image ;
//   //   });
//   //   classifyImage(image);
//   // }
//
//   classifyImage(String list) async {
//     var output = await Tflite.r(
//       binary: utf8.encode("10"),
//     );
//     print("predict = "+output.toString());
//     setState(() {
//       _outputs = output;
//     });
//     print("output${_outputs[0]}");
//     print(_outputs[0]);
//     setState(() {
//       _loading=false;
//     });
//
//
//   }
//   loadModel() async {
//     await Tflite.loadModel(
//       model: "assets/heart_disease_model.tflite",
//       //labels: "assets/labels.txt",
//     );
//   }
//   @override
//   void dispose() {
//     Tflite.close();
//     super.dispose();
//   }
// }