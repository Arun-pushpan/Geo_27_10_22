import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'rout_page.dart'as route;
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey=GlobalKey<FormState>();
  var size,width,height;
  @override
  bool _isObscure=true;
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    return Form(
        key: _formKey,
        child: Scaffold(
          body: ListView(

              children:[
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    width: 200,
                    height: 1000,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: new Alignment(2, 2),
                          end: new Alignment(0.5, 0.5),
                          colors: [
                            Colors.teal.shade500,
                            Colors.black,

                          ],
                          tileMode: TileMode.mirror),
                    ),
                    child: Center(
                      child: Padding(padding:EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                        child: Center(
                          child: Column(
                            children:  [SizedBox(height:60),
                              Text("GEOGRAF",style: TextStyle(fontSize:30,
                                  fontWeight:FontWeight.w900,
                                  color:Colors.white),
                              )
                              ,SizedBox(height: 20,),
                              TextFormField(
                                  style:  TextStyle(color: Colors.white,fontSize:20),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText:"Enter Email ",
                                    hintStyle:TextStyle(color: Colors.white,fontSize:15,),
                                    label: Text("Email",style: TextStyle(color: Colors.white,fontSize:22),),
                                    icon: Icon(Icons.email,color: Colors.white,),
                                  ),
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Please enter your email';
                                    }
                                    if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$").hasMatch(value)){
                                      return "please enter valid email";
                                    }

                                    return null;
                                  }
                              ),

                              SizedBox(height:20),
                              TextFormField(
                                style:  TextStyle(color: Colors.white,fontSize:20),
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText:"Enter Password",
                                  hintStyle:TextStyle(color: Colors.white,fontSize:15,),
                                  label:Text ("Password",style: TextStyle(color: Colors.white,fontSize:22),),
                                  icon: Icon(Icons.lock,color: Colors.white,),
                                  suffixIcon: IconButton(

                                    icon: Icon(
                                      _isObscure ? Icons.visibility : Icons.visibility_off,

                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Please enter your password';
                                  }
                                  if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                                    return 'Please enter alphabets must be upper and lower\n,number,special character';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height:20),

                              TextButton(onPressed: (){},

                                  child: Text(


                                    "Recall Password?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                                  )
                              ),

                              SizedBox(height:10,),

                              Padding(
                                padding: const EdgeInsets.only(left: 50,top: 20,right: 10,bottom: 20),
                                child: Container(
                                  width: 300,
                                  height: 40,
                                  child: ElevatedButton.icon(onPressed: (){
                                    if(_formKey.currentState!.validate()) {
                                      Navigator.pushNamed(
                                          context, route.homePage);
                                    };
                                  },
                                      icon: Icon(Icons.login),
                                      label: Text("Login",style: TextStyle(fontSize:25,fontWeight:FontWeight.w700),)
                                  ),
                                ),
                              ),
                              SizedBox(height:10),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                          text: 'Need an account?',
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 20),
                                          children: <TextSpan>[
                                            TextSpan(text: ' Sign up',
                                                style: TextStyle(
                                                    color: Colors.blueAccent, fontSize: 20),
                                                recognizer: TapGestureRecognizer()
                                                  ..onTap = () {
                                                      Navigator.pushNamed(context, route.registerPage);
                                                    // navigate to desired screen
                                                  }
                                            )
                                          ]
                                      ),
                                    ),
                                  )
                              )
                            ],
                          ),
                        ),

                      ),
                    ),
                  ),
                ),
              ]
          ),
        )
    );

  }
}
class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10 ,top: 60,right: 10,bottom: 10),
      child: SplashScreen(
        seconds: 10,
        navigateAfterSeconds:  Login(),
        backgroundColor: Colors.black,
        title: const Text('Explore  World'
          ,textScaleFactor: 2,
         style: TextStyle(fontWeight: FontWeight.w900,color: Colors.cyan,
         fontSize:25),),

        image:  Image.asset('assets/img17.jpg'),

        loadingText: Text("Loading",
          style: TextStyle(color: Colors.cyanAccent,fontWeight: FontWeight.w700,fontSize: 25),),
        photoSize: 150.0,
        loaderColor: Colors.red,
      ),
    );
  }
}
