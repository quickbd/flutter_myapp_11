import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Color myColor;
  late Size mediaSize;
  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return  Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg2.jpg"),
            fit:BoxFit.cover,
          )
      ),
        child:  Scaffold(
          backgroundColor: Colors.transparent,
          body:Stack(
            children: [
              Positioned(top:80, child: _buildTop()),
              Positioned(bottom:0, child: _buildBody()),
            ],
          ) ,
        )
    );
  }


  Widget _buildTop(){
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on_sharp, size: 100, color: Colors.white,),
          Text("Login",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
              letterSpacing: 2,
            ),)
        ],
      ),

    );
  }



  Widget _buildBody(){
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        // margin: EdgeInsets.all(15.0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft:Radius.circular(25),
                topRight: Radius.circular(25)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildTab(),
        ),
      ),
    );
  }

  Widget _buildTab(){
    return SizedBox(
         child: Container(
           child: TabBar(
             unselectedLabelColor: Colors.grey,
             indicatorSize: TabBarIndicatorSize.tab,
             tabs: [
               Tab(
                 child: Container(

                   child: Text('1,500', style:TextStyle(fontSize: 20.0),),
                ),
                 icon: Image.asset("assets/images/facebook.png"),
               ),

               Tab(
                 child: Container(

                   child: Text('24 Mei', style:TextStyle(fontSize: 20.0),),
                 ),
                 icon: Image.asset("assets/images/facebook.png"),
               ),
             ],

           ),
         ),


    );
  }

  Widget _buildTabView(){
return Column();
  }

}
