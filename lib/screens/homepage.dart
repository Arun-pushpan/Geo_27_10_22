import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';
import 'rout_page.dart'as route;

class Homepage extends StatefulWidget {
  const Homepage({Key? key,required String this.title}) : super(key: key);
  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: <Color>[Colors.teal.shade900,Colors.black]
            )
          ),
        ),
              title: Text(widget.title, style:TextStyle(fontWeight:FontWeight.w900,
          fontSize:25),),
        ),

      endDrawer: GFDrawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[

        const UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                 begin: Alignment(2, 2),
                 end: Alignment(0.5, 0.5),
                 colors: [
                   Colors.teal,
                   Colors.black,

                 ],
                 tileMode: TileMode.mirror),
          ),

                accountName: Text("Amal S",),
                accountEmail: Text('amals2212@gmail.com'),
              currentAccountPicture:(CircleAvatar(
                backgroundImage:AssetImage('assets/img16.jpg'),
              )),
            ),
            Divider(height:20,thickness: 2,color: Colors.black,),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, route.appSettings);
              },
              title: const Text("Settings",style:TextStyle(fontWeight:FontWeight.w900,
               fontSize:25)),
              leading:const Icon(Icons.settings,color: Colors.black,size: 35,),

            ),
              ListTile(
               onTap: (){
                 Navigator.pushNamed(context, route.userProfile);
               },
              title: Text("Profile",style:TextStyle(fontWeight:FontWeight.w900,
                  fontSize:25)),
              leading:Icon(Icons.account_circle,color: Colors.black,size: 35),

            ),
            const ListTile(
              title: Text("Favourite",style:TextStyle(fontWeight:FontWeight.w900,
                  fontSize:25)),
              leading:Icon(Icons.favorite,color: Colors.black,size: 35),

            ),
            const ListTile(
              title: Text("Language",style:TextStyle(fontWeight:FontWeight.w900,
                  fontSize:25)),
              leading:Icon(Icons.language,color: Colors.black,size: 35),

            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, route.notifications);
              },
              title: const Text("Notifications",
                  style:TextStyle(fontWeight:FontWeight.w900,
                  fontSize:25)),
              leading:const Icon(Icons.circle_notifications,color: Colors.teal,size: 35),

            ),

         ListTile(
           onTap: (){
             Navigator.pushNamed(context, route.loginPage);
           },
            title: const Text("Logout",style:TextStyle(fontWeight:FontWeight.w900,
             fontSize:25)),
             leading:const Icon(Icons.logout,color: Colors.black,size: 35),
         ),
          ],

        ),

      ),

      body: ListView(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, route.festivals);
            },

            child: CarouselSlider(

                items: [

                  //1st Image of Slider
                  Container(
                    child: Image.asset('assets/img1.jpg'),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),

                    ),
                  ),

                  //2nd Image of Slider
                  Container(
                    child:  Image.asset('assets/img2.jpg'),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),

                  //3rd Image of Slider
                  Container(
                    child:  Image.asset('assets/img3.jpg'),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),

                  //4th Image of Slider
                  Container(
                    child:  Image.asset('assets/img4.jpg'),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),

                  //5th Image of Slider
                  Container(
                    child:  Image.asset('assets/img5.jpg'),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
                //Slider Container properties
                options: CarouselOptions(
                  height: 230.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.easeInOutCubicEmphasized,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  viewportFraction: 0.8,
                )
            ),
          ),


          GestureDetector(
          onTap: (){
          Navigator.pushNamed(context, route.foods);
          },
            child: CarouselSlider(

                items: [

                  //1st Image of Slider
                  Container(
                    child: Image.asset('assets/img6.jpg'),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),

                    ),
                  ),

                  //2nd Image of Slider
                  Container(
                    child:  Image.asset('assets/img7.jpg'),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),

                  //3rd Image of Slider
                  Container(
                    child:  Image.asset('assets/img8.jpg'),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),

                  //4th Image of Slider
                  Container(
                    child:  Image.asset('assets/img9.jpg'),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),

                  //5th Image of Slider
                  Container(
                    child: Image.asset('assets/img10.jpg'),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
                //Slider Container properties
                options: CarouselOptions(
                  height: 230.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.easeInOutCubicEmphasized,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  viewportFraction: 0.8,
                )
            ),
          ),


          GestureDetector(
                onTap: (){
                Navigator.pushNamed(context, route.places);
                },
            child: CarouselSlider(

                items: [

                  //1st Image of Slider

                  Container(
                    child:  Image.asset('assets/img11.jpg'),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),

                    ),
                  ),

                  //2nd Image of Slider
                  Container(
                    child:  Image.asset('assets/img12.jpg'),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),

                  //3rd Image of Slider
                  Container(
                    child:  Image.asset('assets/img13.jpg'),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),

                  //4th Image of Slider
                  Container(
                    child:  Image.asset('assets/img14.jpg'),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),

                  //5th Image of Slider
                  Container(
                    child: Image.asset('assets/img15.jpg'),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
                //Slider Container properties
                options: CarouselOptions(

                  height: 230.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.easeInOutCubicEmphasized,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  viewportFraction: 0.8,
                )
            ),
          ),

        ],
      ),




        );

  }
}

