// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
class GridModel {
  final String title;
  final String description;
  final String nDevices;
  bool isToggled;

  GridModel(this.title,this.description,this.nDevices, this.isToggled);
}


class GridToggleScreen extends StatefulWidget {
  const GridToggleScreen({super.key});

  @override
  _GridToggleScreenState createState() => _GridToggleScreenState();
}

class _GridToggleScreenState extends State<GridToggleScreen> {
  List<GridModel> list = [
    GridModel('Living Room','3 family members can access','4 Devices', false),
    GridModel('Bed Room','3 family members can access','5 Devices', false),
    GridModel('Guest Room','2 family members can access','3 Devices', false),
    GridModel('Kitchen','2 family members can access','4 Devices', false),
    GridModel('Kids Room','1 family members can access','4 Devices', false),
    GridModel('Balcony','4 family members can access','2 Devices', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images.jpg"),
              ),
              const SizedBox(height: 30,),
              const Text("Hi Samuel",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              const Text("Welcome to Home",style: TextStyle(color: Colors.white,fontSize: 16),),
              const SizedBox(height: 30,),
              GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 9/11,
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2
                ),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    child: GridTile(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(list[index].title,style: const TextStyle(fontWeight: FontWeight.bold),),
                            const SizedBox(height: 20,),
                            Text(list[index].description,style: const TextStyle(color: Colors.grey),),
                            const SizedBox(height: 20,),
                            Text(list[index].nDevices,style: const TextStyle(color: Colors.orange),),
                            const SizedBox(height: 20,),
                            Switch(
                              activeColor: Colors.orange,
                              activeTrackColor: Colors.orangeAccent,
                              value: list[index].isToggled,
                              onChanged: (value) {
                                setState(() {
                                  list[index].isToggled = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
