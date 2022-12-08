import 'package:flutter/material.dart';
import 'dart:async';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';

class GroundInfo extends StatefulWidget {
  const GroundInfo({super.key});

  @override
  State<GroundInfo> createState() => _GroundInfoState();
}

class _GroundInfoState extends State<GroundInfo> {
  final Completer<GoogleMapController> _controller = Completer();
  static LatLng _center = LatLng(33.63237610613854, 73.07100930207619);
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    List icons = [
      Icon(Icons.image),
      Icon(Icons.sports_soccer_outlined),
      Icon(Icons.sports_hockey),
      Icon(Icons.sports_tennis),
      Icon(Icons.sports_hockey),
      Icon(Icons.sports_bar),
      Icon(Icons.image),
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                SizedBox(
                  height: 20,
                ),
                Positioned(
                  left: 20,
                  child: Container(
                    width: width * .90,
                    height: height * .09,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * .12,
                          height: height * .06,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 4,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ), //BorderRadius.all
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        Container(
                          width: width * .12,
                          height: height * .06,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ), //BorderRadius.all
                          ),
                          child: Icon(
                            FontAwesomeIcons.heart,
                            color: Colors.purple,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                GoogleMap(
                  onMapCreated: _onMapCreated,
                  zoomControlsEnabled: false,
                
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 16.0,
                  ),
                ),
                // Center(
                //   child: ElevatedButton(
                //       onPressed: () {
                //         showModalBottomSheet(
                //             context: context,
                //             backgroundColor: Colors.transparent,
                //             isScrollControlled: false,
                //             builder: (BuildContext context) {
                //               return SingleChildScrollView(
                //                 child: Container(
                //                   width: width * .90,
                //                   height: height,
                //                   decoration: BoxDecoration(
                //                       color: Colors.white,
                //                       borderRadius: BorderRadius.only(
                //                         topLeft: Radius.circular(25),
                //                         topRight: Radius.circular(25),
                //                       )),
                //                   child: Column(
                //                     children: [
                //                       SizedBox(
                //                         height: 30,
                //                       ),
                //                       Container(
                //                         width: width * .90,
                //                         child: Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Text(
                //                               'Pindi Cricket Stadium,',
                //                               style: GoogleFonts.syne(
                //                                   fontSize: 18,
                //                                   color: Color.fromARGB(
                //                                       255, 156, 23, 101),
                //                                   fontWeight: FontWeight.w700),
                //                             ),
                //                             Padding(
                //                               padding: const EdgeInsets.only(
                //                                   right: 10),
                //                               child: Icon(
                //                                 FontAwesomeIcons.link,
                //                                 color: Color.fromARGB(
                //                                     255, 67, 12, 77),
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                       SizedBox(
                //                         height: 10,
                //                       ),
                //                       Container(
                //                         width: width * .85,
                //                         height: height * .09,
                //                         child: ListView.builder(
                //                           scrollDirection: Axis.horizontal,
                //                           itemCount: 7,
                //                           itemBuilder: (context, index) =>
                //                               Container(
                //                             width: width * .15,
                //                             height: height * .09,
                //                             decoration: BoxDecoration(
                //                               color: Color.fromARGB(
                //                                   255, 156, 23, 101),
                //                               borderRadius:
                //                                   BorderRadius.circular(10),
                //                             ),
                //                             margin: EdgeInsets.all(10),
                //                             child: Center(
                //                               child: icons[index],
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                       SizedBox(
                //                         height: 20,
                //                       ),
                //                       Container(
                //                         width: width * .80,
                //                         height: height * .09,
                //                         child: Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Row(
                //                               children: [
                //                                 Icon(
                //                                   FontAwesomeIcons.locationPin,
                //                                   color: Color.fromARGB(
                //                                       255, 156, 23, 101),
                //                                   size: 20,
                //                                 ),
                //                                 SizedBox(
                //                                   width: 15,
                //                                 ),
                //                                 Column(
                //                                   crossAxisAlignment:
                //                                       CrossAxisAlignment.start,
                //                                   mainAxisAlignment:
                //                                       MainAxisAlignment.center,
                //                                   children: [
                //                                     Text(
                //                                       'Address',
                //                                       style: GoogleFonts.syne(
                //                                           color: Colors.black,
                //                                           fontWeight:
                //                                               FontWeight.w500,
                //                                           fontSize: 16),
                //                                     ),
                //                                     SizedBox(
                //                                       height: 5,
                //                                     ),
                //                                     Text(
                //                                       'Islamabad, G-11',
                //                                       style: GoogleFonts.syne(
                //                                           color: Color.fromARGB(
                //                                               255,
                //                                               156,
                //                                               23,
                //                                               101),
                //                                           fontWeight:
                //                                               FontWeight.w500,
                //                                           fontSize: 16),
                //                                     )
                //                                   ],
                //                                 ),
                //                               ],
                //                             ),
                //                             Container(
                //                               width: width * .15,
                //                               height: height * .07,
                //                               decoration: BoxDecoration(
                //                                 color: Color.fromARGB(
                //                                     255, 156, 23, 101),
                //                                 borderRadius:
                //                                     BorderRadius.circular(10),
                //                               ),
                //                               child: Column(
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.center,
                //                                 children: [
                //                                   Icon(
                //                                     FontAwesomeIcons.map,
                //                                     color: Colors.white,
                //                                     size: 15,
                //                                   ),
                //                                   SizedBox(
                //                                     height: 5,
                //                                   ),
                //                                   Text(
                //                                     'Map',
                //                                     style: GoogleFonts.syne(
                //                                         color: Colors.white,
                //                                         fontSize: 12,
                //                                         fontWeight:
                //                                             FontWeight.w500),
                //                                   )
                //                                 ],
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                       SizedBox(
                //                         height: 20,
                //                       ),
                //                       Container(
                //                         width: width * .80,
                //                         height: height * .09,
                //                         child: Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Row(
                //                               children: [
                //                                 Icon(
                //                                   FontAwesomeIcons.clock,
                //                                   color: Color.fromARGB(
                //                                       255, 156, 23, 101),
                //                                   size: 20,
                //                                 ),
                //                                 SizedBox(
                //                                   width: 15,
                //                                 ),
                //                                 Column(
                //                                   crossAxisAlignment:
                //                                       CrossAxisAlignment.start,
                //                                   mainAxisAlignment:
                //                                       MainAxisAlignment.center,
                //                                   children: [
                //                                     Text(
                //                                       'Timings',
                //                                       style: GoogleFonts.syne(
                //                                           color: Colors.black,
                //                                           fontWeight:
                //                                               FontWeight.w500,
                //                                           fontSize: 16),
                //                                     ),
                //                                     SizedBox(
                //                                       height: 5,
                //                                     ),
                //                                     Text(
                //                                       '8-am-6pm',
                //                                       style: GoogleFonts.syne(
                //                                           color: Color.fromARGB(
                //                                               255,
                //                                               156,
                //                                               23,
                //                                               101),
                //                                           fontWeight:
                //                                               FontWeight.w500,
                //                                           fontSize: 16),
                //                                     )
                //                                   ],
                //                                 ),
                //                               ],
                //                             ),
                //                             Container(
                //                               width: width * .30,
                //                               height: height * .07,
                //                               decoration: BoxDecoration(
                //                                 color: Color.fromARGB(
                //                                     255, 156, 23, 101),
                //                                 borderRadius:
                //                                     BorderRadius.circular(10),
                //                               ),
                //                               child: Row(
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.center,
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.center,
                //                                 children: [
                //                                   Text(
                //                                     'SAT',
                //                                     style: GoogleFonts.syne(
                //                                         color: Colors.white,
                //                                         fontSize: 18,
                //                                         fontWeight:
                //                                             FontWeight.w600),
                //                                   ),
                //                                   SizedBox(
                //                                     width: 5,
                //                                   ),
                //                                   Icon(
                //                                     Icons
                //                                         .keyboard_arrow_up_outlined,
                //                                     color: Colors.white,
                //                                     size: 30,
                //                                   ),
                //                                 ],
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                       SizedBox(
                //                         height: 20,
                //                       ),
                //                       Container(
                //                         width: width * .80,
                //                         child: Row(
                //                           children: [
                //                             Icon(
                //                               FontAwesomeIcons.dotCircle,
                //                               color: Colors.green,
                //                               size: 20,
                //                             ),
                //                             SizedBox(
                //                               width: 15,
                //                             ),
                //                             Column(
                //                               crossAxisAlignment:
                //                                   CrossAxisAlignment.start,
                //                               mainAxisAlignment:
                //                                   MainAxisAlignment.center,
                //                               children: [
                //                                 Text(
                //                                   'Opened',
                //                                   style: GoogleFonts.syne(
                //                                       color: Colors.black,
                //                                       fontWeight:
                //                                           FontWeight.w500,
                //                                       fontSize: 16),
                //                                 ),
                //                                 SizedBox(
                //                                   height: 5,
                //                                 ),
                //                                 Text(
                //                                   'Next open at 8pm sat',
                //                                   style: GoogleFonts.syne(
                //                                       color: Color.fromARGB(
                //                                           255, 156, 23, 101),
                //                                       fontWeight:
                //                                           FontWeight.w500,
                //                                       fontSize: 16),
                //                                 )
                //                               ],
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                       SizedBox(
                //                         height: 60,
                //                       ),
                //                       Container(
                //                         width: width * .80,
                //                         child: Row(
                //                           children: [
                //                             Text(
                //                               'Contact info',
                //                               style: GoogleFonts.syne(
                //                                   color: Colors.grey,
                //                                   fontSize: 15,
                //                                   fontWeight: FontWeight.w500),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                       SizedBox(
                //                         height: 15,
                //                       ),
                //                       Container(
                //                         width: width * .80,
                //                         height: height * .09,
                //                         child: Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Row(
                //                               children: [
                //                                 CircleAvatar(
                //                                   backgroundColor:
                //                                       Colors.purple,
                //                                   child: Icon(
                //                                     FontAwesomeIcons.user,
                //                                     color: Colors.white,
                //                                   ),
                //                                   radius: 35,
                //                                 ),
                //                                 SizedBox(
                //                                   width: 15,
                //                                 ),
                //                                 Column(
                //                                   crossAxisAlignment:
                //                                       CrossAxisAlignment.start,
                //                                   mainAxisAlignment:
                //                                       MainAxisAlignment.center,
                //                                   children: [
                //                                     Text(
                //                                       'Yasir Majeed',
                //                                       style: GoogleFonts.syne(
                //                                           color: Colors.purple,
                //                                           fontWeight:
                //                                               FontWeight.w500,
                //                                           fontSize: 18),
                //                                     ),
                //                                     SizedBox(
                //                                       height: 5,
                //                                     ),
                //                                     Text(
                //                                       '0331-6969696',
                //                                       style: GoogleFonts.syne(
                //                                           color: Colors.grey,
                //                                           fontWeight:
                //                                               FontWeight.w500,
                //                                           fontSize: 16),
                //                                     )
                //                                   ],
                //                                 ),
                //                               ],
                //                             ),
                //                             Container(
                //                               width: width * .14,
                //                               height: height * .07,
                //                               decoration: BoxDecoration(
                //                                 color: Color.fromARGB(
                //                                     255, 156, 23, 101),
                //                                 borderRadius:
                //                                     BorderRadius.circular(80),
                //                               ),
                //                               child: Column(
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.center,
                //                                 children: [
                //                                   Icon(
                //                                     FontAwesomeIcons.phone,
                //                                     color: Colors.green,
                //                                     size: 20,
                //                                   ),
                //                                 ],
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                       SizedBox(
                //                         height: 15,
                //                       ),
                //                       Container(
                //                         width: width * .75,
                //                         height: height * .07,
                //                         child: Text(
                //                           'Typically accpets 50% as an advanced payment. Pay remaining reaching the venue.',
                //                           textAlign: TextAlign.center,
                //                           style: GoogleFonts.syne(
                //                             color: Colors.grey,
                //                             fontSize: 14,
                //                             fontWeight: FontWeight.w500,
                //                           ),
                //                         ),
                //                       ),
                //                       Container(
                //                         width: width * .80,
                //                         height: height * .09,
                //                         child: Row(
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.center,
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Row(
                //                               children: [
                //                                 Text(
                //                                   '8000',
                //                                   style: GoogleFonts.syne(
                //                                       color: Colors.purple,
                //                                       fontSize: 28,
                //                                       fontWeight:
                //                                           FontWeight.w700),
                //                                 ),
                //                                 SizedBox(
                //                                   width: 5,
                //                                 ),
                //                                 Text(
                //                                   'RS',
                //                                   style: GoogleFonts.syne(
                //                                       color: Colors.purple,
                //                                       fontSize: 14,
                //                                       fontWeight:
                //                                           FontWeight.w700),
                //                                 ),
                //                               ],
                //                             ),
                //                             Container(
                //                               width: width * .45,
                //                               height: height * .07,
                //                               decoration: BoxDecoration(
                //                                 color: Color.fromARGB(
                //                                     255, 156, 23, 101),
                //                                 borderRadius:
                //                                     BorderRadius.circular(10),
                //                               ),
                //                               child: Row(
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.center,
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.center,
                //                                 children: [
                //                                   Text(
                //                                     'Pay 8000 to Book',
                //                                     style: GoogleFonts.syne(
                //                                         color: Colors.white,
                //                                         fontSize: 14,
                //                                         fontWeight:
                //                                             FontWeight.w600),
                //                                   ),
                //                                   SizedBox(
                //                                     width: 5,
                //                                   ),
                //                                   Icon(
                //                                     Icons.arrow_right_alt,
                //                                     color: Colors.white,
                //                                     size: 30,
                //                                   ),
                //                                 ],
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               );
                //             });
                //       },
                //       child: Text('Click')),

                //   // child: Container(
                //   //   width: width * .25,
                //   //   height: height * .07,
                //   //   decoration: BoxDecoration(
                //   //     color: Colors.pink,
                //   //     borderRadius: BorderRadius.all(
                //   //       Radius.circular(18),
                //   //     ),
                //   //   ),
                //   //   child: Center(
                //   //     child: Text(
                //   //       'PlayPal',
                //   //       style: TextStyle(color: Colors.white, fontSize: 16),
                //   //     ),
                //   //   ),
                //   // ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
