import 'dart:convert';

import 'package:flutter/material.dart';
import 'rout_page.dart'as route;
import 'package:http/http.dart'as http;
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey=GlobalKey<FormState>();
  String? _name,_email,_phoneNo,_password;
  void writeData()async{
  _formKey.currentState?.save();
  var url="https://culture-b1783-default-rtdb.firebaseio.com/"+"register.json";
  try{
    final response=await http.post(
      Uri.parse(url),
      body: json.encode({"Name":_name,"Email":_email,"PhoneNo":_phoneNo,"Password":_password}),
    );
  }catch(error){
    throw error;
  }
  }

  @override
  bool _isObscure=true;
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: new Alignment(2, 2),
              end: new Alignment(0.5, 0.5),
              colors: [
                Colors.teal,
                Colors.black,

              ],
              tileMode: TileMode.mirror),
        ),
        padding: EdgeInsets.only(left: 10,right: 70,bottom: 50,top: 50),
        child: Center(
          child: ListView(
            children: [

              Center(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 70,right: 10,bottom: 10,top: 10),
                      child: Text("GEOGRAF",
                        style: TextStyle(fontSize:30,fontWeight:FontWeight.w900,
                          color:Colors.white,),),
                    ),

                    Padding(padding: EdgeInsets.only(left: 30,right: 20,bottom: 10,top: 20),
                      child: TextFormField(
                          style:  TextStyle(color: Colors.white,fontSize:20),
                        decoration: InputDecoration(
                            border:OutlineInputBorder(),
                            hintText: "Enter Name",
                            hintStyle:TextStyle(color: Colors.white,
                                fontWeight:FontWeight.w700,fontSize:15),
                            label: Text("Full Name",
                              style: TextStyle(color:Colors.white,fontSize:22),),
                            icon:Icon(Icons.account_circle_rounded,color: Colors.white,)
                        ),onSaved: (value){
                            _name=value!;
                      },
                        validator: (value){
                        if(value!.isEmpty){
                         return 'Please enter your name';
                         }
                        if(!RegExp(r"^[a-zA-Z]+ [a-zA-Z]+$").hasMatch(value)){
                        return "please enter valid name";
                        }
                        return null;
                        }
                          ),
                          ),

                          Padding(padding: EdgeInsets.only(left: 30,right: 20,bottom: 10,top: 20),
                          child: TextFormField(
                              style:  TextStyle(color: Colors.white,fontSize:20),
                          decoration: InputDecoration(
                          border:OutlineInputBorder(),
                          hintText: " Enter  Email",
                          hintStyle:TextStyle(color: Colors.white,
                                fontWeight:FontWeight.w700,fontSize:15),
                            label: Text("Email",
                              style: TextStyle(color:Colors.white,fontSize:22),),
                            icon:Icon(Icons.email,color: Colors.white,)
                        ),
                              onSaved: (value){
                                _email=value!;
                              },
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
                    ),
                    Padding(padding: EdgeInsets.only(left: 30,right: 20,bottom: 10,top: 20),
                      child: TextFormField(
                          style:  TextStyle(color: Colors.white,fontSize:20),
                        decoration: InputDecoration(
                            border:OutlineInputBorder(),
                            hintText: " Enter Phone Number",
                            hintStyle:TextStyle(color: Colors.white,
                                fontWeight:FontWeight.w700,fontSize:15),
                            label: Text("Phone Number",
                              style: TextStyle(color:Colors.white,fontSize:22),),
                            icon:Icon(Icons.phone,color: Colors.white,)
                        ),
                          onSaved: (value){
                            _phoneNo=value!;
                          },
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please enter your phone number';
                            }
                            if(!RegExp(r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$").hasMatch(value)){
                              return "please enter valid phone number";
                            }
                            return null;
                          }
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 30,right: 20,bottom: 10,top: 20),
                      child: TextFormField(
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
                          onSaved: (value){
                            _password=value;
                          },
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please enter your password';
                            }
                            if(!RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$").hasMatch(value)){
                              return "please enter valid password";
                            }
                            return null;
                          }
                      ),
                    ),

      Container(
        width: 240,
        height: 80,
        child: Padding(padding: EdgeInsets.only(left: 50,right: 0,bottom: 10,top: 20),
            child:ElevatedButton(
              onPressed:() {
                if (_formKey.currentState!.validate()) {
                  writeData();
                  Navigator.pushNamed(context, route.homePage);
                }
              }, child: Text("Register",
              style:TextStyle(fontWeight:FontWeight.w700,
                    fontSize:30),),

            )

               ),
      ),
                  ]
                ),
              )

            ],
          ),
        ),
      ),
    ),
    );
  }
}



