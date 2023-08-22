import 'package:flutter/material.dart';
import 'package:think_linker/api_interface.dart';
import 'package:think_linker/api_model.dart';
import 'package:think_linker/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const BottomNavigation(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<ApiModel>? products;
  String? fName;
  String? lName;
  String? image;
  @override
  void initState() {
  setState(() {
    products = ApiInterface().getUsers().then((value) {
      setState(() {
        fName = value.firstName;
        lName = value.lastName;
        image = value.image;
      });
      return ApiModel();
    }) ;
  });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
        body: Center(
          child:
          fName!=null? InkWell(
            onTap: (){

            },
            child: Container(
                    padding: const EdgeInsets.all(2),
                    height: 140,
                    child: Card(
                      elevation: 5,
                      child: Row(
                          children:[
                            SizedBox(height: 100,
                              child: Image.network(
                                image.toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                        '${fName.toString()} ${lName.toString()}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ))
                          ]),
                    )),
          ):const CircularProgressIndicator()
        ));
  }
}
