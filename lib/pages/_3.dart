import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final _key = GlobalKey<FormState>();
  TextEditingController emailClt = TextEditingController();
  TextEditingController passwordClt = TextEditingController();
  bool rememberUser =false;

  bool secureText = true;
  final brownColor = Colors.brown;
  late Color myColor;
  late Size mediaSize;
  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    myColor = Theme.of(context).primaryColor;
    return Scaffold(
      body: Column(
          children:[
        Expanded(
          flex: 1,
           child: ClipPath(
             clipper:HeadContainerClipper() ,

             child: Container(

               decoration: BoxDecoration(
                 color: myColor,
                   image: DecorationImage(
                     image: AssetImage("assets/images/bg.jpg"),
                     fit:BoxFit.cover,
                     colorFilter: ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop)
                   ),
           ),

           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               SizedBox(height: 20.0,),
               CircleAvatar(
                 radius: 40.0,
                 backgroundColor: brownColor,
                 child: Icon(Icons.person, size: 40.0,),
               ),
               SizedBox(height: 20.0,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   mainAxisSize: MainAxisSize.min,

                   children: [
                       Expanded(
                         child: Text("Order and Get \nto door step", style: TextStyle(
                           fontSize: 28,color: Colors.white, fontWeight: FontWeight.bold,
                         ),),
                       )
                   ],
                 ),
               ),
             ],
           ),
             ),
           ) ,
        ),
            Expanded(
              flex: 2,
              child: Container(

               child: _buildBottom(),
              ) ,
            ),

      ]
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


  Widget _buildBottom(){
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
              child: _loginForm(),
            ),
          ),
        );
  }

  Widget _loginForm(){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
           child: Card(
             elevation:10,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))) ,
             child: Padding(
               padding: const EdgeInsets.all(12.0),
               child: Column(
                 children:[
               Text('Login', style: TextStyle(fontSize: 30.0, color:myColor),),

          SizedBox(height: 30,),
          _buildGreyText("Username"),
          _buildInputField(emailClt),
          SizedBox(height: 30,),
          _buildGreyText("Password"),
          _buildInputField(passwordClt, isPassword: true),
          SizedBox(height: 20),
          _buildRememberMe(),
          SizedBox(height: 20,),
                   ]
          ),
             ),
           ),
          ),
          SizedBox(height: 20),
          _buildButton('Login'),

          SizedBox(height: 20,),
          _buildOtherLogin(),
          ],
       ),



    );
  }

  Widget _buildGreyText(String text){
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController controller,{isPassword = false}){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye): Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildRememberMe(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: rememberUser, onChanged: (value){
              setState(() {
                rememberUser = value!;
              });
            }),
            _buildGreyText('Remember Me')
          ],
        ),
        TextButton(onPressed: (){}, child: _buildGreyText('I forgot my Password'))
      ],
    );
  }

  Widget _buildButton(String text){
    return ElevatedButton(onPressed:(){
           debugPrint("Email : ${emailClt.text}");
           debugPrint("password : ${passwordClt.text}");
    },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          elevation: 10,
          shadowColor: myColor,
          minimumSize: Size.fromHeight(60)
        ),
        child: Text(text));
  }

  Widget _buildOtherLogin(){
    return  Center(
      child: Column(
        children: [
          _buildGreyText("Or Login with"),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tab(  icon: Image.asset("assets/images/facebook.png"),  ),
              Tab(  icon: Image.asset("assets/images/twitter.png"),  ),
              Tab(  icon: Image.asset("assets/images/gmail.png"),  ),

            ],
          )
        ],
      ),
    );
  }
}




class HeadContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size){
    double w=size.width;
    double h=size.height;
    final path = Path();
    //  path.moveTo(0, 30);
   path.lineTo(0,h-50);
    path.quadraticBezierTo(
      w * 0.5,
       h+50,
      w ,
      h-50 ,
    );

     path.lineTo(w,0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>false;
}


