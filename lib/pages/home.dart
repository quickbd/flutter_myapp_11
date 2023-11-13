import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<FormState>();
  TextEditingController nameClt = TextEditingController();
  TextEditingController emailClt = TextEditingController();
  TextEditingController passwordClt = TextEditingController();

  bool secureText = true;
  final brownColor = Colors.brown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
        backgroundColor: brownColor,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.0),
          width: MediaQuery.of(context).size.width,

          child: Form(
            key:_key,
            child: Card(
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
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
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[350]
                        ),
                        child: TextFormField(
                          controller: nameClt,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your Name',
                            contentPadding: EdgeInsets.only(left: 15.0)
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Empty Field';
                            }
                          },
                        )),
                    SizedBox(height: 20.0,),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[350]
                        ),
                        child: TextFormField(
                          controller: emailClt,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your Email',
                              contentPadding: EdgeInsets.only(left: 15.0)
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Empty Field';
                            }
                          },
                        )),
                    SizedBox(height: 20.0,),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[350]
                        ),
                        child: TextFormField(
                          controller: passwordClt,
                          obscureText: secureText,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your Password',
                              contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                            suffixIcon: InkWell(
                              onTap: (){
                                setState(() {
                                  secureText =!secureText;

                                });
                              },
                                child: Icon(secureText?Icons.remove_red_eye_outlined : Icons.remove_red_eye, color: brownColor,))
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Empty Field';
                            }
                          },
                        )),

                    SizedBox(height: 30.0,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(onPressed: (){
                        if(_key.currentState!.validate()){
                          _key.currentState!.save();
                          print(nameClt.text);
                          print(emailClt.text);
                          print(passwordClt.text);
                        }

                      },

                          style: ElevatedButton.styleFrom(backgroundColor: brownColor),
                          child: Text('Registration', style: TextStyle(fontSize: 20.0),)),
                    ),
                    SizedBox(height: 30.0,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
