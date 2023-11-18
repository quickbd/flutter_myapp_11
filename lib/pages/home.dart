import 'package:flutter/material.dart';
import 'package:myapp_11/pages/registration.dart';

import '../storage_utils.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: Text('Dashboard'),
        elevation: 2.0,
        backgroundColor: Colors.brown ,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Profile', style: TextStyle(fontSize: 30.0),),
            SizedBox(height: 10.0,),
            ElevatedButton(onPressed: (){
                  StorageUtils.setLoginData(true,'');
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(_)=> RegistrationPage()));
            }, child: Text('Logout', style: TextStyle(fontSize: 12.0, color: Colors.white), ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown,

            ),),
            SizedBox(height: 20.0,),
          Text("Hi ${StorageUtils.getInfo()}",style: TextStyle(fontSize: 20.0),)
          ],
        ),
      ),

    );
  }
}
