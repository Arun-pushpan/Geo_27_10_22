import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:profile/profile.dart';
class Userprofile extends StatefulWidget {
  const Userprofile({Key? key,required String this.title}) : super(key: key);
  final String title;

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {

  @override
  void initState(){
    super.initState();


  }
  bool isLoading=true;
  List<String> namelist = [];
  List<String> emaillist = [];
  List<String> phonenolist = [];
   Future<void>readData()async{
    var url="https://culture-b1783-default-rtdb.firebaseio.com/"+"register.json";
    try{
      final response =await http.get(Uri.parse(url));
      final extractedData= json.decode(response.body) as Map< String ,dynamic>;
      if(extractedData==null){
        return ;
      }extractedData.forEach((id,name){
        namelist.add(name["Name"]);
        emaillist.add(name["Email"]);
        phonenolist.add(name["PhoneNo"]);
           });
 setState(() {
   isLoading=false;
 });

    }catch(error){
      throw error;
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: <Color>[Colors.teal.shade900, Colors.black])),
        ),
        title: Text(
          widget.title ,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
     body: Container(

        padding: EdgeInsets.only(left: 30,right: 30,bottom: 50,top: 40),
        child: ListView(
            children: [

        Column(
        children: [
          SizedBox.fromSize(
            size: Size(70, 70),
            child: ClipOval(
              child: Material(
                color: Colors.greenAccent,
                child: InkWell(
                  splashColor: Colors.black,
                  onTap: () {
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.account_circle),
// text
                    ],
                  ),
                ),
              ),
            ),
          ),SizedBox(height: 20),
          Padding(padding: EdgeInsets.only(left: 10,right: 20,bottom: 10,top: 0),
              child:Text("User Profile",
                style: TextStyle(fontSize:30,fontWeight: FontWeight.w800,color: Colors.white),)


          ),
           Text("$namelist" ),
          Text("$emaillist"),
          Text("$phonenolist"),
                  //SizedBox(height: 40,)),)
          Text("Posts 0            Rating *",
            style: TextStyle(fontSize:25,
          fontWeight: FontWeight.w400,color: Colors.white),),
       //  GridView(
       //    shrinkWrap: true,
       //
       //    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
       //                  crossAxisCount: 3,
       //                  mainAxisSpacing: 2,
       //                  crossAxisSpacing: 2,
       //                ),
       //
       // )

      ]

        )
    ]
    ),
    )

        // body: Center(
        //   child: Profile(
        //     imageUrl: "https://images.unsplash.com/photo-1598618356794-eb1720430eb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
        //     name: "Shamim Miah",
        //     website: "shamimmiah.com",
        //     designation: "Project Manager | Flutter & Blockchain Developer",
        //     email: "cse.shamimosmanpailot@gmail.com",
        //     phone_number: "01757736053",
        //   ),
        // )
    );
  }
}
