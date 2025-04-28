import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/View/animated_monn.dart';
import 'package:weather_app/controller/clipper.dart';
import 'package:weather_app/controller/weather_api.dart';
import 'package:weather_app/modal/api_states.dart';
import 'package:weather_app/modal/current.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  WeatherApiController api=Get.put(WeatherApiController());
  DateTime time=DateTime.now();
  @override
  void initState() {
    api.loadData();
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SliderDrawer(
          isDraggable: true,
          animationDuration: 100,
          slider: ListView(
            children: [
              Text("Other Locations",
              style:GoogleFonts.yuseiMagic(fontSize: 30,)
              ),
              SizedBox(height: 20,),
              ListTile(
                selected: true,
                selectedColor: Colors.blueAccent,
                leading: Text("Liaquatpur",
                style:GoogleFonts.yuseiMagic(fontSize:20)
                ),
                onTap: () {
                  api.changeCity("Liaquatpur");
                  api.loadData();
                },
              ),
              ListTile(
                leading: Text("Lahore",
                style:GoogleFonts.yuseiMagic(fontSize:20)
                ),
                onTap: () {
                  api.changeCity("Lahore");
                  api.loadData();
                },
              ),
              ListTile(
                leading: Text("Multan",
                style:GoogleFonts.yuseiMagic(fontSize:20)
                ),
                onTap: () {
                  api.changeCity("Multan");
                  api.loadData();
                },
              ),
              ListTile(
                leading: Text("Karachi",
                style:GoogleFonts.yuseiMagic(fontSize:20)
                ),
                onTap: () {
                  api.changeCity("Karachi");
                  api.loadData();
                },
              ),
              ListTile(
                leading: Text("Islamabad",
                style:GoogleFonts.yuseiMagic(fontSize:20)
                ),
                onTap: () {
                  api.changeCity("Islamabad");
                  api.loadData();
                },
              ),
              ListTile(
                leading: Text("Peshawar",
                style:GoogleFonts.yuseiMagic(fontSize:20)
                ),
                onTap: () {
                  api.changeCity("Peshawar");
                  api.loadData();
                },
              )

            ],
          ),
          child: api.obx((state){
            return ListView(
              children: [
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      width: size.width,
                      height: size.height,
                      child: Column(
                        spacing: 20,
                        children: [
                            Expanded(flex:3,child: Container(
                              decoration: BoxDecoration(
                                color: (state as ApiDataLoadedStates).is_day==0?Colors.black:Colors.black26,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Positioned(top: 60,left: 250,child:Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(state.is_day==0?"folder/assets/moon.png":"folder/assets/sun2.png"))
                                    ),
                                  ) ,),
                                  Positioned(top: 20,left:10,child: Text("${state.current}°",
                                  style: GoogleFonts.yuseiMagic(fontSize: 85,color: state.is_day==1?Colors.black:Colors.white)
                                  )
                                  ),
                                  Positioned(top: 150,left: 20,child: Text(state.condition,
                                  style: GoogleFonts.yuseiMagic(fontSize: 20,color: state.is_day==1?Colors.black:Colors.white)
                                  )
                                  ),
                                  Positioned(top: 240,left: 20,child: Text("${state.location}⟟",
                                  style: GoogleFonts.yuseiMagic(fontSize: 20,color: state.is_day==1?Colors.black:Colors.white)
                                  )
                                  ),
                                ],
                              ),
                            )
                            ),
                            Expanded(flex:1,child: Container(
                              child: ListView.builder(itemBuilder: (context, index) {
                                return Padding(
                                  padding:EdgeInsets.all(5),
                                  child: Container(
                                    width: 100,
                                    height: 50,
                                     decoration: BoxDecoration(
                                      color: Colors.black26,
                                  borderRadius: BorderRadius.circular(30),
                                                        ),  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(flex: 1,child: SizedBox()),
                                    Expanded(flex: 3,child: Text("${time.hour+index}:00",
                                    style: GoogleFonts.yuseiMagic(fontSize: 14,)
                                    )),
                                    Expanded(flex: 3,child: Image(image: AssetImage(state.isDay[index]==0?"folder/assets/moon.png":"folder/assets/sun2.png"),)),
                                    Expanded(flex: 2,child: SizedBox()),
                                    Expanded(flex: 3,child: Text("${state.feelLike[index]}°C",
                                    style: GoogleFonts.yuseiMagic(fontSize: 14,)
                                    )),
                                  ],
                                                        ),
                                  ),
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: state.feelLike.length,
                              ),
                            )),
                            Expanded(flex:3,child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(40),
                                
                              ),
                              child: Column(
                                children: [
                                  Expanded(flex: 3,child: Row(
                                    children: [
                                      Padding(padding: EdgeInsets.all(5)),
                                      Expanded(flex: 2,child: SizedBox(child:Text(DateFormat.EEEE().format(DateFormat("yyyy-MM-dd").parse(state.dateOfDay[0]))
                                      ,style: GoogleFonts.yuseiMagic(fontSize: 20,)
                                      ) ,) ),
                                      Expanded(flex: 1,child: SizedBox(child: Image(image: AssetImage("folder/assets/moon.png",) ,))),
                                      Expanded(flex: 1,child: SizedBox(child: Image(image: AssetImage("folder/assets/sun2.png",) ,))),
                                      Expanded(flex: 1,child:SizedBox()),
                                      Expanded(flex: 1,child: Text("${state.avg[0]}",
                                      style: GoogleFonts.yuseiMagic(fontSize: 20,)
                                      ))
                                    ],
                                  )),
                                  Expanded(flex: 3,child: Row(
                                    children: [
                                      Padding(padding: EdgeInsets.all(5)),
                                      Expanded(flex: 2,child: SizedBox(child:Text(DateFormat.EEEE().format(DateFormat("yyyy-MM-dd").parse(state.dateOfDay[1])),
                                      style: GoogleFonts.yuseiMagic(fontSize: 20,)
                                      ) ,) ),
                                      Expanded(flex: 1,child: SizedBox(child: Image(image: AssetImage("folder/assets/moon.png",) ,))),
                                      Expanded(flex: 1,child: SizedBox(child: Image(image: AssetImage("folder/assets/sun2.png",) ,))),
                                      Expanded(flex: 1,child:SizedBox()),
                                      Expanded(flex: 1,child: Text("${state.avg[1]}",
                                      style: GoogleFonts.yuseiMagic(fontSize: 20,)
                                      ))
                                    ],
                                  )),
                                  Expanded(flex: 3,child: Row(
                                    children: [
                                      Padding(padding: EdgeInsets.all(5)),
                                      Expanded(flex: 2,child: SizedBox(child:Text(DateFormat.EEEE().format(DateFormat("yyyy-MM-dd").parse(state.dateOfDay[2])),
                                      style: GoogleFonts.yuseiMagic(fontSize: 20,)
                                      ) ,) ),
                                      Expanded(flex: 1,child: SizedBox(child: Image(image: AssetImage("folder/assets/moon.png",) ,))),
                                      Expanded(flex: 1,child: SizedBox(child: Image(image: AssetImage("folder/assets/sun2.png",) ,))),
                                      Expanded(flex: 1,child:SizedBox()),
                                      Expanded(flex: 1,child: Text("${state.avg[2]}",
                                      style: GoogleFonts.yuseiMagic(fontSize: 20,)
                                      ))
                                    ],
                                  )),
                                  // Expanded(flex: 2,child: Row(
                                  //   children: [
                                  //     Padding(padding: EdgeInsets.all(5)),
                                  //     Expanded(flex: 2,child: SizedBox(child:Text("${DateFormat.EEEE().format(new DateFormat("yyyy-MM-dd").parse(state.dateOfDay[2]))}",
                                  //     style: GoogleFonts.yuseiMagic(fontSize: 20,)
                                  //     ) ,) ),
                                  //     Expanded(flex: 1,child: SizedBox(child: Image(image: AssetImage("folder/assets/moon.png",) ,))),
                                  //     Expanded(flex: 1,child: SizedBox(child: Image(image: AssetImage("folder/assets/sun2.png",) ,))),
                                  //     Expanded(flex: 1,child:SizedBox()),
                                  //     Expanded(flex: 1,child: Text("${state.avg[2]}",
                                  //     style: GoogleFonts.yuseiMagic(fontSize: 20,)
                                  //     ))
                                  //   ],
                                  // )),
                                  // Expanded(flex: 2,child: Row(
                                  //   children: [
                                  //     Padding(padding: EdgeInsets.all(5)),
                                  //     Expanded(flex: 2,child: SizedBox(child:Text("${DateFormat.EEEE().format(new DateFormat("yyyy-MM-dd").parse(state.dateOfDay[2]))}",
                                  //     style: GoogleFonts.yuseiMagic(fontSize: 20,)
                                  //     ) ,) ),
                                  //     Expanded(flex: 1,child: SizedBox(child: Image(image: AssetImage("folder/assets/moon.png",) ,))),
                                  //     Expanded(flex: 1,child: SizedBox(child: Image(image: AssetImage("folder/assets/sun2.png",) ,))),
                                  //     Expanded(flex: 1,child:SizedBox()),
                                  //     Expanded(flex: 1,child: Text("${state.avg[2]}",
                                  //     style: GoogleFonts.yuseiMagic(fontSize: 20,)
                                  //     ))
                                  //   ],
                                  // )),
                                ],
                              )
                            )
                            ),
                        ],
                      ),
                    ),
                ),
                Padding(padding: EdgeInsets.all(15),
                child: SizedBox(
                  height: 150,
                  width:size.width,
                  child: Row(
                    children: [
                      Expanded(flex:5,child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Column(
                          children: [
                            Expanded(child: Image(image: AssetImage("folder/assets/sunset.png"))),
                            Expanded(child: Text("SunSet",
                            style: GoogleFonts.yuseiMagic(fontSize: 20,)
                            )),
                            Expanded(child: Text(state.sunset,style: GoogleFonts.yuseiMagic(fontSize: 20,)))
                          ],
                        ),
                      )),
                      Padding(padding: EdgeInsets.all(10)),
                      Expanded(flex:5,child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Column(
                          children: [
                            Expanded(child: Image(image: AssetImage("folder/assets/uv.png"))),
                            Expanded(child: Text("UV",
                            style: GoogleFonts.yuseiMagic(fontSize: 20,)
                            )),
                            Expanded(child: Text(state.uv,
                            style: GoogleFonts.yuseiMagic(fontSize: 20)
                            ))
                          ],
                        ),
                      ))
                    ],
                  ),

                ),),
                Padding(padding: EdgeInsets.all(15),
                child: SizedBox(
                  height: 150,
                  width:size.width,
                  child: Row(
                    children: [
                      Expanded(flex:5,child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Column(
                          children: [
                            Expanded(child: Image(image: AssetImage("folder/assets/humidity.png"))),
                            Expanded(child: Text("Humidity",
                            style: GoogleFonts.yuseiMagic(fontSize: 20,)
                            )),
                            Expanded(child: Text("${state.humidity}%",
                            style: GoogleFonts.yuseiMagic(fontSize: 20)
                            ))
                          ],
                        ),
                      )),
                      Padding(padding: EdgeInsets.all(10)),
                      Expanded(flex:5,child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Column(
                          children: [
                            Expanded(child: Image(image: AssetImage("folder/assets/wind.png"))),
                            Expanded(child: Text("Wind",
                            style: GoogleFonts.yuseiMagic(fontSize: 20,)
                            )),
                            Expanded(child: Text("${state.wind}km/h",
                            style: GoogleFonts.yuseiMagic(fontSize: 20)
                            ))
                          ],
                        ),
                      ))
                    ],
                  ),

                ),)
              ],
            );
          },
          onError: (error) => Text("$error"),
          onLoading: const Center(child: CircularProgressIndicator()),
          onEmpty: const Text("initial State")),
        ),
      ),
    );
  }
}
