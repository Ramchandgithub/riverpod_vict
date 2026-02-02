
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:victous/widgets/sub_header.dart';

import '../Utils/constants.dart';
import '../Utils/logger.dart';
import '../Utils/network_call.dart';
import '../Utils/statemodel.dart';
import '../Utils/validator.dart';
import '../widgets/leading_icon.dart';




class ContactUs extends StatefulWidget {
  static const String routeName = '/ContactUs';

  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  ScrollController scrollController = ScrollController();
  final _formkey = GlobalKey<FormState>();
  TextEditingController nameCntrl = TextEditingController();
  TextEditingController mobileCntrl = TextEditingController();
  TextEditingController emailCntrl = TextEditingController();
  TextEditingController pinCntrl = TextEditingController();
  List<StateModel> statesList = [], districtList = [], citiesList = [], state = [], city = [], district = [];
  int stateInd = 0, districtInd = 0, citiesInd = 0;
  List pincodesList = [], districtsList = [];
  int stateindex = 0,
  cityindex = 0,
  relationindex = 0,
  districtindex = 0;
  bool isLoading = true;

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 0)).then((value){
      districtindex = 0;
      stateindex = 0;
      cityindex = 0;
      city.add(StateModel(Text: '0', Value: 'Select City'));
      state.add(StateModel(Text: '0', Value: 'Select State'));
      district.add(StateModel(Text: '0', Value: 'Select District'));
      setState(() {
        isLoading = false;
      });
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: LeadingIcon(),
          title: const Text(
            'Contact Us',
            style: TextStyle(color: Colors.white),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              // IconButton(
              //   icon: Image.asset('${Constants.ImagePath}instagram.png'),
              //   onPressed: () {},
              //
              // ),
              // IconButton(
              //     icon: Image.asset('${Constants.ImagePath}whatsapp.png'),
              //     onPressed: () {
              //       //Constants.launchurl(Constants.whatsapp_link);
              //     }
              // ),
              // IconButton(
              //     icon: Image.asset('${Constants.ImagePath}youtubeicon.png'),
              //     onPressed: () {
              //       //Constants.launchurl(Constants.youtube_link);
              //     }
              // ),
              // IconButton(
              //   icon: Image.asset('${Constants.ImagePath}telegram.png',color:Colors.black),
              //   onPressed: () {
              //     // Constants.launchurl(Constants.telegram_link);
              //     },
              //
              // ),

            ],
          ),
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Center(
            child: Column(
                children: [
                  const SizedBox(height: 20),
                  Card(
                      elevation: 3,
                      shadowColor: Colors.green[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [

                          Center(
                            child: ClipRRect(
                              child: Text(
                                'Registered Office ',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: Column(

                                children: [

                                  InkWell(
                                      onTap: () {
                                        launchMap(
                                            'https://www.google.com/maps/place/VICTOUS+LIFESCIENCES/@16.4832128,80.6155023,17z/data=!3m1!4b1!4m6!3m5!1s0x3a35f16f51a16afb:0xe3147cb674d4dd57!8m2!3d16.4832077!4d80.6180772!16s%2Fg%2F11x0zjw88n?entry=ttu&g_ep=EgoyMDI1MDYxMS4wIKXMDSoASAFQAw%3D%3D');
                                      },
                                      child: Image.asset(
                                        Constants.ImagePath + 'location.png',
                                        width: 120, height: 60,)),
                                  const SizedBox(height: 10,),
                                  Text("Vijayawada", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 16),),
                                  InkWell(
                                    onTap: () {
                                      launchMap(
                                          'https://www.google.com/maps/place/VICTOUS+LIFESCIENCES/@16.4832128,80.6155023,17z/data=!3m1!4b1!4m6!3m5!1s0x3a35f16f51a16afb:0xe3147cb674d4dd57!8m2!3d16.4832077!4d80.6180772!16s%2Fg%2F11x0zjw88n?entry=ttu&g_ep=EgoyMDI1MDYxMS4wIKXMDSoASAFQAw%3D%3D');
                                    },
                                    child: const Text(
                                      '''12-460/2/GF4, 1ST FLOOR, SPS RIVER VIEW,BYPASS ROAD, REVENUE WARD12, TADEPALLE, GUNTUR, ANDHRA PRADESH, INDIA, 522501''',
                                      maxLines: 8,
                                      //overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Column(
                                    children: [
                                      Text(
                                        'Landline No',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w600
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 10,),
                                      Row(
                                          children: [

                                            Image.asset(
                                              '${Constants.ImagePath}call.png',
                                              color: Colors.green[900],
                                              height: 20,
                                              width: 30,),
                                            InkWell(
                                              onTap: () {
                                                Constants.launchurl(
                                                    "tel: 08069975555");
                                              },
                                              child: Text(
                                                '080 - 69975555',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "Montserrat",
                                                    fontWeight: FontWeight.w600
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            // Expanded(child: Center()),
                                          ]
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Column(
                                    children: [
                                      Text(
                                        'Toll-free No',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w600
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 10,),
                                      Row(
                                          children: [
                                            // const Expanded(child: Center()),
                                            Image.asset(
                                              '${Constants.ImagePath}call.png',
                                              color: Colors.green[900],
                                              height: 20,
                                              width: 30,),
                                            InkWell(
                                              onTap: () {
                                                Constants.launchurl(
                                                    "tel: 18002965566");
                                              },
                                              child: Text(
                                                '18002965566',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "Montserrat",
                                                    fontWeight: FontWeight.w600
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            // const Expanded(child: Center()),
                                          ]
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),

                                  Row(
                                      children: [
                                        // const  Expanded(child: Center()),
                                        Image.asset(
                                          '${Constants.ImagePath}web.png',
                                          color: Colors.green[900],
                                          height: 20,
                                          width: 30,),
                                        InkWell(
                                          onTap: () {
                                            Constants.launchurl(
                                                'https://victouslife.com');
                                          },
                                          child: Text(
                                            ' www.victouslife.com',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w500
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        // const Expanded(child: Center()),
                                      ]
                                  ),

                                  const SizedBox(height: 18),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                        const Icon(Icons.email),
                                        InkWell(
                                            onTap: () {
                                              Constants.launchurl(
                                                  'mailto:${"info@victouslife.com"}');
                                            },
                                            child: Text(' info@victouslife.com')
                                        ),
                                        // const Expanded(child: Center()),
                                      ]
                                  ),
                                ]

                            ),
                          )
                        ],
                      )),


                  const SizedBox(height: 20,),
                  Center(
                      child: Text('Head Office', style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),)
                  ),
                  Card(
                      elevation: 3,
                      shadowColor: Colors.green[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              Constants.ImagePath + 'location.png',
                              width: 120, height: 60,),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Bangaluru ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat",
                                color: Theme.of(context).primaryColor),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: InkWell(
                              child: Column(
                                  children: [
                                    const Text(
                                      '''''',
                                      //overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),
                                    const
                                    Text(
                                      '''NO.3, BELLARY ROAD, YADUNANDANA BUILDING, 2ND FLOOR, OPPOSITE TO VETERINARY COLLEGE, BENGALURU - 560024 ''',
                                      maxLines: 8,
                                      //overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),
                                    const SizedBox(height: 20,),
                                    // Row(
                                    //     children: [
                                    //       Image.asset(
                                    //         '${Constants.ImagePath}call.png',
                                    //         color: Theme.of(context).primaryColor,
                                    //         height: 20,
                                    //         width: 30,),
                                    //       InkWell(
                                    //         onTap: () {
                                    //           Constants.launchurl(
                                    //               "tel: 9877733798");
                                    //         },
                                    //         child: Text(
                                    //           ' 9877733798',
                                    //           style: TextStyle(
                                    //               fontSize: 14,
                                    //               fontFamily: "Montserrat",
                                    //               fontWeight: FontWeight.w500
                                    //           ),
                                    //           textAlign: TextAlign.start,
                                    //         ),
                                    //       ),
                                    //     ]
                                    // ),
                                    // const SizedBox(height: 20,),
                                    // Row(
                                    //     children: [
                                    //       Image.asset(
                                    //         '${Constants.ImagePath}web.png',
                                    //         color: Theme.of(context).primaryColor,
                                    //         height: 20,
                                    //         width: 30,),
                                    //       InkWell(
                                    //         onTap: () {
                                    //           Constants.launchurl(
                                    //               'https://www.victouslife.com');
                                    //         },
                                    //         child: Text(
                                    //           ' www.victouslife.com',
                                    //           style: TextStyle(
                                    //               fontSize: 14,
                                    //               fontFamily: "Montserrat",
                                    //               fontWeight: FontWeight.w500
                                    //           ),
                                    //           textAlign: TextAlign.start,
                                    //         ),
                                    //       ),
                                    //     ]
                                    // ),

                                  ]

                              ),
                              onTap: () {
                                // Constants.launchurl(
                                //     'https://www.google.com/maps/place/The+Imperial+Heights/@22.2814244,70.7739335,17z/data=!4m9!1m2!2m1!1sB-304+Imperial+Heights,+150Ft+Ring+Road,+Rajkot-360005,+Gujarat.+India!3m5!1s0x3959ca37607d1f4d:0x2a4898386716f588!8m2!3d22.2814202!4d70.7761948!15sCkZCLTMwNCBJbXBlcmlhbCBIZWlnaHRzLCAxNTBGdCBSaW5nIFJvYWQsIFJhamtvdC0zNjAwMDUsIEd1amFyYXQuIEluZGlhkgENYnVzaW5lc3NfcGFyaw');
                              },
                            ),
                          )
                        ],
                      )),


                  const SizedBox(height: 20,),
                  Center(
                      child: Text('Branch Office', style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),)
                  ),
                  Card(
                      elevation: 3,
                      shadowColor: Colors.green[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [

                          Center(
                            child: ClipRRect(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                    children: [
                                      Image.asset(
                                        '${Constants.ImagePath}maps.png',
                                        color: Theme.of(context).primaryColor,
                                        height: 20,
                                        width: 30,),
                                      Text(
                                        'AIZWAL ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Montserrat",
                                            color: Theme.of(context).primaryColor),
                                        textAlign: TextAlign.start,
                                      ),
                                    ]

                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: InkWell(
                              child: Column(
                                  children: [
                                    const Text(
                                      '''''',
                                      //overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),
                                    const
                                    Text(
                                      '''HOUSE NO S/39, CANTEEN KUAL DAWRPUI, AIZWAL, MIZORAM PINCODE: 796001''',
                                      maxLines: 8,
                                      //overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),
                                    // const SizedBox(height: 20,),
                                    // Row(
                                    //     children: [
                                    //       Image.asset(
                                    //         '${Constants.ImagePath}call.png',
                                    //         color: Theme.of(context).primaryColor,
                                    //         height: 20,
                                    //         width: 30,),
                                    //       InkWell(
                                    //         onTap: () {
                                    //           Constants.launchurl(
                                    //               "tel: 080 - 69975555");
                                    //         },
                                    //         child: Text(
                                    //           ' 080 - 69975555',
                                    //           style: TextStyle(
                                    //               fontSize: 14,
                                    //               fontFamily: "Montserrat",
                                    //               fontWeight: FontWeight.w500
                                    //           ),
                                    //           textAlign: TextAlign.start,
                                    //         ),
                                    //       ),
                                    //     ]
                                    // ),
                                    const SizedBox(height: 20,),


                                  ]

                              ),
                              onTap: () {
                                Constants.launchurl(
                                    'https://www.google.com/maps/place/Canteen+Kual,+Dawrpui,+Aizawl,+Mizoram+796001/@23.7282049,92.7151944,17z/data=!3m1!4b1!4m6!3m5!1s0x374d94b7fbb27ecd:0xdced1cd534910cc8!8m2!3d23.7282!4d92.7177693!16s%2Fg%2F11g_gp40k?entry=ttu&g_ep=EgoyMDI1MDYxMS4wIKXMDSoASAFQAw%3D%3D');
                              },
                            ),
                          )
                        ],
                      )),

                  const SizedBox(height: 20,),
                  Center(
                      child: Text('Branch Office', style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),)
                  ),
                  Card(
                      elevation: 3,
                      shadowColor: Colors.green[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [

                          Center(
                            child: ClipRRect(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                    children: [
                                      Image.asset(
                                        '${Constants.ImagePath}maps.png',
                                        color: Theme.of(context).primaryColor,
                                        height: 20,
                                        width: 30,),
                                      Text(
                                        'Pathankot ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Montserrat",
                                            color: Theme.of(context).primaryColor),
                                        textAlign: TextAlign.start,
                                      ),
                                    ]

                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: InkWell(
                              child: Column(
                                  children: [
                                    const Text(
                                      '''''',
                                      //overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),
                                    const
                                    Text(
                                      '''HAZURA SINGH VILLAGE, GOSAINPUR NEAR MUSCLEHEDS UNISEX GYM PATHANKOT, PUNJAB, PINCODE 145001''',
                                      maxLines: 8,
                                      //overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),
                                    const SizedBox(height: 20,),
                                    // Row(
                                    //     children: [
                                    //       Image.asset(
                                    //         '${Constants.ImagePath}call.png',
                                    //         color: Theme.of(context).primaryColor,
                                    //         height: 20,
                                    //         width: 30,),
                                    //       InkWell(
                                    //         onTap: () {
                                    //           Constants.launchurl(
                                    //               "tel: 9877733798");
                                    //         },
                                    //         child: Text(
                                    //           ' 9877733798',
                                    //           style: TextStyle(
                                    //               fontSize: 14,
                                    //               fontFamily: "Montserrat",
                                    //               fontWeight: FontWeight.w500
                                    //           ),
                                    //           textAlign: TextAlign.start,
                                    //         ),
                                    //       ),
                                    //     ]
                                    // ),
                                    // const SizedBox(height: 20,),
                                    // Row(
                                    //     children: [
                                    //       Image.asset(
                                    //         '${Constants.ImagePath}web.png',
                                    //         color: Theme.of(context).primaryColor,
                                    //         height: 20,
                                    //         width: 30,),
                                    //       InkWell(
                                    //         onTap: () {
                                    //           Constants.launchurl(
                                    //               'https://www.victouslife.com');
                                    //         },
                                    //         child: Text(
                                    //           ' www.victouslife.com',
                                    //           style: TextStyle(
                                    //               fontSize: 14,
                                    //               fontFamily: "Montserrat",
                                    //               fontWeight: FontWeight.w500
                                    //           ),
                                    //           textAlign: TextAlign.start,
                                    //         ),
                                    //       ),
                                    //     ]
                                    // ),

                                  ]

                              ),
                              onTap: () {
                                // Constants.launchurl(
                                //     'https://www.google.com/maps/place/The+Imperial+Heights/@22.2814244,70.7739335,17z/data=!4m9!1m2!2m1!1sB-304+Imperial+Heights,+150Ft+Ring+Road,+Rajkot-360005,+Gujarat.+India!3m5!1s0x3959ca37607d1f4d:0x2a4898386716f588!8m2!3d22.2814202!4d70.7761948!15sCkZCLTMwNCBJbXBlcmlhbCBIZWlnaHRzLCAxNTBGdCBSaW5nIFJvYWQsIFJhamtvdC0zNjAwMDUsIEd1amFyYXQuIEluZGlhkgENYnVzaW5lc3NfcGFyaw');
                              },
                            ),
                          )
                        ],
                      )),

                  const SizedBox(height: 20,),
                  Center(
                      child: Text('Branch Office', style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),)
                  ),
                  Card(
                      elevation: 3,
                      shadowColor: Colors.green[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [

                          Center(
                            child: ClipRRect(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                    children: [
                                      Image.asset(
                                        '${Constants.ImagePath}maps.png',
                                        color: Theme.of(context).primaryColor,
                                        height: 20,
                                        width: 30,),
                                      Text(
                                        'Dimapur ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Montserrat",
                                            color: Theme.of(context).primaryColor),
                                        textAlign: TextAlign.start,
                                      ),
                                    ]

                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: InkWell(
                              child: Column(
                                  children: [
                                    const Text(
                                      '''HOUSE NO. 339, ROOM NO. 6/1, DUNCAN BASTI, DIMAPUR, NAGALAND''',
                                      //overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),


                                    const SizedBox(height: 20,),
                                    // Row(
                                    //     children: [
                                    //       Image.asset(
                                    //         '${Constants.ImagePath}call.png',
                                    //         color: Theme.of(context).primaryColor,
                                    //         height: 20,
                                    //         width: 30,),
                                    //       InkWell(
                                    //         onTap: () {
                                    //           Constants.launchurl(
                                    //               "tel: 9877733798");
                                    //         },
                                    //         child: Text(
                                    //           ' 9877733798',
                                    //           style: TextStyle(
                                    //               fontSize: 14,
                                    //               fontFamily: "Montserrat",
                                    //               fontWeight: FontWeight.w500
                                    //           ),
                                    //           textAlign: TextAlign.start,
                                    //         ),
                                    //       ),
                                    //     ]
                                    // ),
                                    // const SizedBox(height: 20,),
                                    // Row(
                                    //     children: [
                                    //       Image.asset(
                                    //         '${Constants.ImagePath}web.png',
                                    //         color: Theme.of(context).primaryColor,
                                    //         height: 20,
                                    //         width: 30,),
                                    //       InkWell(
                                    //         onTap: () {
                                    //           Constants.launchurl(
                                    //               'https://www.victouslife.com');
                                    //         },
                                    //         child: Text(
                                    //           ' www.victouslife.com',
                                    //           style: TextStyle(
                                    //               fontSize: 14,
                                    //               fontFamily: "Montserrat",
                                    //               fontWeight: FontWeight.w500
                                    //           ),
                                    //           textAlign: TextAlign.start,
                                    //         ),
                                    //       ),
                                    //     ]
                                    // ),

                                  ]

                              ),
                              onTap: () {
                                // Constants.launchurl(
                                //     'https://www.google.com/maps/place/The+Imperial+Heights/@22.2814244,70.7739335,17z/data=!4m9!1m2!2m1!1sB-304+Imperial+Heights,+150Ft+Ring+Road,+Rajkot-360005,+Gujarat.+India!3m5!1s0x3959ca37607d1f4d:0x2a4898386716f588!8m2!3d22.2814202!4d70.7761948!15sCkZCLTMwNCBJbXBlcmlhbCBIZWlnaHRzLCAxNTBGdCBSaW5nIFJvYWQsIFJhamtvdC0zNjAwMDUsIEd1amFyYXQuIEluZGlhkgENYnVzaW5lc3NfcGFyaw');
                              },
                            ),
                          )
                        ],
                      )),

                  const SizedBox(height: 20,),
                  Center(
                      child: Text('Branch Office', style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),)
                  ),
                  Card(
                      elevation: 3,
                      shadowColor: Colors.green[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [

                          Center(
                            child: ClipRRect(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                    children: [
                                      Image.asset(
                                        '${Constants.ImagePath}maps.png',
                                        color: Theme.of(context).primaryColor,
                                        height: 20,
                                        width: 30,),
                                      Text(
                                        'Guwahati ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Montserrat",
                                            color: Theme.of(context).primaryColor),
                                        textAlign: TextAlign.start,
                                      ),
                                    ]

                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: InkWell(
                              child: Column(
                                  children: [
                                    const Text(
                                      '''H. NO. 21, SATYAPUR PATH, BELTOLA BAZAR ROAD, BELTOLA TINIALI, KAMRUP (METRO), GUWAHATI- 781019, ASSAM''',
                                      //overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),

                                    // const SizedBox(height: 20,),
                                    // Row(
                                    //     children: [
                                    //       Image.asset(
                                    //         '${Constants.ImagePath}call.png',
                                    //         color: Colors.green[900],
                                    //         height: 20,
                                    //         width: 30,),
                                    //       InkWell(
                                    //         onTap: () {
                                    //           Constants.launchurl(
                                    //               "tel: 9877733798");
                                    //         },
                                    //         child: Text(
                                    //           ' 9877733798',
                                    //           style: TextStyle(
                                    //               fontSize: 14,
                                    //               fontFamily: "Montserrat",
                                    //               fontWeight: FontWeight.w500
                                    //           ),
                                    //           textAlign: TextAlign.start,
                                    //         ),
                                    //       ),
                                    //     ]
                                    // ),
                                    const SizedBox(height: 20,),
                                    Row(
                                        children: [
                                          Image.asset(
                                            '${Constants.ImagePath}web.png',
                                            color: Colors.green[900],
                                            height: 20,
                                            width: 30,),
                                          InkWell(
                                            onTap: () {
                                              Constants.launchurl(
                                                  'https://www.victouslife.com');
                                            },
                                            child: Text(
                                              ' www.victouslife.com',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "Montserrat",
                                                  fontWeight: FontWeight.w500
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ]
                                    ),

                                  ]

                              ),
                              onTap: () {
                                // Constants.launchurl(
                                //     'https://www.google.com/maps/place/The+Imperial+Heights/@22.2814244,70.7739335,17z/data=!4m9!1m2!2m1!1sB-304+Imperial+Heights,+150Ft+Ring+Road,+Rajkot-360005,+Gujarat.+India!3m5!1s0x3959ca37607d1f4d:0x2a4898386716f588!8m2!3d22.2814202!4d70.7761948!15sCkZCLTMwNCBJbXBlcmlhbCBIZWlnaHRzLCAxNTBGdCBSaW5nIFJvYWQsIFJhamtvdC0zNjAwMDUsIEd1amFyYXQuIEluZGlhkgENYnVzaW5lc3NfcGFyaw');
                              },
                            ),
                          )
                        ],
                      )),




                  // SubHeader("CONTACT FORM"),
                  //
                  // SizedBox(height: 20),
                  //
                  // Form(
                  //   key: _formkey,
                  //   child: Padding(
                  //     padding: EdgeInsets.all(3.0),
                  //     child: Column(
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //               vertical: 4.0, horizontal: 23.0),
                  //           child: TextFormField(
                  //             inputFormatters: [
                  //               //  LengthLimitingTextInputFormatter(6),
                  //               FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                  //               // FilteringTextInputFormatter.allow(RegExp(r'\s ')),
                  //               FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
                  //             ],
                  //             controller: nameCntrl,
                  //             keyboardType: TextInputType.name,
                  //             textInputAction: TextInputAction.next,
                  //             // cursorColor: Constants().cursorcolor,
                  //             validator: (val)=>Validator.inputValidate(val!, ' Name'),
                  //             decoration: InputDecoration(
                  //                 border: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.circular(15)),
                  //                 enabledBorder: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.circular(15)),
                  //                 focusedBorder: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.circular(15)),
                  //                 disabledBorder: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.circular(15),
                  //                     borderSide:
                  //                     const BorderSide(color: Colors.black)),
                  //                 hintText: "Name * ",
                  //                 labelText: 'Name *',
                  //                 hintStyle:
                  //                 TextStyle(color: Constants().black),
                  //                 labelStyle: TextStyle(color: Colors.black)
                  //
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(height: Constants().defaultPadding / 2),
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //               vertical: 4.0, horizontal: 23.0),
                  //           child: TextFormField(
                  //             controller: mobileCntrl,
                  //             keyboardType: TextInputType.number,
                  //             autovalidateMode: AutovalidateMode.onUserInteraction,
                  //             inputFormatters: [
                  //               FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  //               FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  //               LengthLimitingTextInputFormatter(10)
                  //             ],
                  //             validator: (val)=>Validator.mobileValidator(val!),
                  //             textInputAction: TextInputAction.next,
                  //             decoration: InputDecoration(
                  //                 border: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.circular(15)),
                  //                 enabledBorder: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.circular(15)),
                  //                 focusedBorder: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.circular(15)),
                  //                 disabledBorder: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.circular(15),
                  //                     borderSide:
                  //                     const BorderSide(color: Colors.black)),
                  //                 hintText: "Mobile *",
                  //                 hintStyle: TextStyle(color: Colors.black),
                  //                 labelText: "Mobile *",
                  //                 labelStyle: TextStyle(color: Colors.black)
                  //
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(height: Constants().defaultPadding / 2),
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //               vertical: 4.0, horizontal: 23.0),
                  //           child: TextFormField(
                  //             controller: emailCntrl,
                  //             keyboardType: TextInputType.text,
                  //             autovalidateMode: AutovalidateMode.onUserInteraction,
                  //             inputFormatters: [
                  //               FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  //               // FilteringTextInputFormatter.allow(RegExp(r'[]')),
                  //               // LengthLimitingTextInputFormatter(10)
                  //             ],
                  //             validator: (val)=>Validator.emailValidator(val!),
                  //             textInputAction: TextInputAction.next,
                  //             decoration: InputDecoration(
                  //                 border: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.circular(15)),
                  //                 enabledBorder: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.circular(15)),
                  //                 focusedBorder: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.circular(15)),
                  //                 disabledBorder: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.circular(15),
                  //                     borderSide:
                  //                     const BorderSide(color: Colors.black)),
                  //                 hintText: "Email ID *",
                  //                 hintStyle: TextStyle(color: Colors.black),
                  //                 labelText: "Email ID *",
                  //                 labelStyle: TextStyle(color: Colors.black)
                  //
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(height: Constants().defaultPadding / 2),
                  //         Padding(
                  //           padding: EdgeInsets.all(10),
                  //           child: TextFormField(
                  //             enabled:  true,
                  //             controller: pinCntrl,
                  //             keyboardType: TextInputType.number,
                  //             inputFormatters: [
                  //               FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  //               LengthLimitingTextInputFormatter(6),
                  //             ],
                  //             decoration: InputDecoration(
                  //               border: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.circular(10),
                  //                 borderSide: BorderSide(
                  //                     color: Theme.of(context).primaryColor),
                  //               ),
                  //               enabledBorder: OutlineInputBorder(
                  //                   borderSide: BorderSide(
                  //                       color: Theme.of(context).primaryColor),
                  //                   borderRadius: BorderRadius.circular(10)),
                  //               focusedBorder: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.circular(10),
                  //                 borderSide: BorderSide(
                  //                     color: Theme.of(context).primaryColor),
                  //               ),
                  //               labelText: 'Pincode *',
                  //               labelStyle: TextStyle(color: Colors.black),
                  //               hintText: 'Enter Pincode',
                  //             ),
                  //             onChanged: (val) {
                  //               if (val.length == 6) {
                  //                 if(int.parse(pinCntrl.text) == 0){
                  //                   Logger.showWarningAlert("Alert", "Please Enter Valid Pincode");
                  //                   pinCntrl.clear();
                  //                 }else{
                  //                   callDistrict('District', int.parse(pinCntrl.text),'PIN1');
                  //                 }
                  //
                  //               }
                  //             },
                  //           ),
                  //         ),
                  //         const  SizedBox(
                  //           height: 2,
                  //         ),
                  //         Container(
                  //           alignment: Alignment.topLeft,
                  //           child: Text(
                  //             '    District *',
                  //           ),
                  //         ),
                  //         Container(
                  //           padding: const EdgeInsets.symmetric(
                  //               vertical: 5.0, horizontal: 20),
                  //           margin: const EdgeInsets.symmetric(
                  //               vertical: 6, horizontal: 10),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             border: Border.all(
                  //               color: Colors.grey,
                  //             ),
                  //           ),
                  //           child: DropdownButtonHideUnderline(
                  //             child: DropdownButton<StateModel>(
                  //               iconEnabledColor: Theme.of(context).primaryColor,
                  //               isExpanded: true,
                  //               hint: Text(
                  //                 district[districtindex].Value,
                  //                 style: const TextStyle(
                  //                   fontSize: 15.0,
                  //                   color: Colors.black87,
                  //                 ),
                  //               ),
                  //               items: district.map((StateModel map) {
                  //                 return DropdownMenuItem<StateModel>(
                  //                   value: map,
                  //                   child: Text(
                  //                     map.Value,
                  //                     style: const TextStyle(
                  //                       fontSize: 15.0,
                  //                       color: Colors.black87,
                  //                     ),
                  //                   ),
                  //                 );
                  //               }).toList(),
                  //               onChanged: (value) {
                  //                 setState(() {
                  //                   districtindex = district.indexOf(value!);
                  //                 });
                  //               },
                  //             ),
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           height: 2,
                  //         ),
                  //         Container(
                  //           alignment: Alignment.topLeft,
                  //           child: Text(
                  //             '    City *',
                  //           ),
                  //         ),
                  //         Container(
                  //           padding: const EdgeInsets.symmetric(
                  //               vertical: 5.0, horizontal: 20),
                  //           margin: const EdgeInsets.symmetric(
                  //               vertical: 6, horizontal: 10),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             border: Border.all(
                  //               color: Colors.grey,
                  //             ),
                  //           ),
                  //           child: DropdownButtonHideUnderline(
                  //             child: DropdownButton<StateModel>(
                  //               iconEnabledColor: Theme.of(context).primaryColor,
                  //               isExpanded: true,
                  //               hint: Text(
                  //                 city[cityindex].Value,
                  //                 style: const TextStyle(
                  //                   fontSize: 15.0,
                  //                   color: Colors.black87,
                  //                 ),
                  //               ),
                  //               items: city.map((StateModel map) {
                  //                 return DropdownMenuItem<StateModel>(
                  //                   value: map,
                  //                   child: Text(
                  //                     map.Value,
                  //                     style: const TextStyle(
                  //                       fontSize: 15.0,
                  //                       color: Colors.black87,
                  //                     ),
                  //                   ),
                  //                 );
                  //               }).toList(),
                  //               onChanged: (value) {
                  //                 setState(() {
                  //                   cityindex = city.indexOf(value!);
                  //                 });
                  //               },
                  //             ),
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           height: 2,
                  //         ),
                  //         Container(
                  //           alignment: Alignment.topLeft,
                  //           child: Text(
                  //             '    State *',
                  //           ),
                  //         ),
                  //         Container(
                  //           padding: const EdgeInsets.symmetric(
                  //               vertical: 5.0, horizontal: 20),
                  //           margin: const EdgeInsets.symmetric(
                  //               vertical: 6, horizontal: 10),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             border: Border.all(
                  //               color: Colors.grey,
                  //             ),
                  //           ),
                  //           child: DropdownButtonHideUnderline(
                  //             child: DropdownButton<StateModel>(
                  //               iconEnabledColor: Theme.of(context).primaryColor,
                  //               isExpanded: true,
                  //               hint: Text(
                  //                 state[stateindex].Value,
                  //                 style: const TextStyle(
                  //                   fontSize: 15.0,
                  //                   color: Colors.black87,
                  //                 ),
                  //               ),
                  //               items: state.map((StateModel map) {
                  //                 return DropdownMenuItem<StateModel>(
                  //                   value: map,
                  //                   child: Text(
                  //                     map.Value,
                  //                     style: const TextStyle(
                  //                       fontSize: 15.0,
                  //                       color: Colors.black87,
                  //                     ),
                  //                   ),
                  //                 );
                  //               }).toList(),
                  //               onChanged: (value) {
                  //                 setState(() {
                  //                   stateindex = state.indexOf(value!);
                  //                 });
                  //               },
                  //             ),
                  //           ),
                  //         ),
                  //        const SizedBox(
                  //           height: 2,
                  //         ),
                  //
                  //         ElevatedButton(
                  //         style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                  //             onPressed: (){
                  //               if(nameCntrl.text.trim() == ''){
                  //                 Logger.showWarningAlert("Alert", "Please Enter Name");
                  //               }
                  //               else if(mobileCntrl.text.trim() == '' || mobileCntrl.text.length <10){
                  //                 Logger.showWarningAlert("Alert", "Please Enter Valid Mobile Number");
                  //               }
                  //              else if(emailCntrl.text.trim() == ''){
                  //                 Logger.showWarningAlert("Alert", "Please Enter Valid Email ID");
                  //               }
                  //               else if(pinCntrl.text.trim() == '' ||pinCntrl.text.length <6 ){
                  //                 Logger.showWarningAlert("Alert", "Please Enter Valid Pincode");
                  //               }
                  //               else{
                  //                 callSubmission();
                  //               }
                  //
                  //             },
                  //
                  //             child: Text('SUBMIT', style: TextStyle(color: Colors.white),))
                  //
                  //
                  //
                  //       ],
                  //     ),
                  //   ),
                  //
                  //
                  //
                  // )



                ]

            ),

          ),
        )
    );
  }

  void launchMap(String address) async {
    if (await canLaunch(address)) {
      await launch(address);
    }
  }

  callDistrict(String action, int pincode, String type) {
    Map<String,dynamic> param = {
      'Pincode': pincode
    };
    NetworkCall().onCallServer(endPoint: Constants.api_GetStateCityByPincode, parameters: param).then((value){
      var data = jsonDecode(NetworkCall.getParse(value));
      Logger.logger("Data:::$data");
      pincodesList = data['PincodeDetails'];
      districtsList = data['DistrictDetails'];
      if(data.length > 0 ){
        if( pincodesList.isNotEmpty && districtsList.isNotEmpty){
          if(type == 'PIN1'){
            districtindex = 0;
            district.clear();
            stateindex = 0;
            state.clear();
            cityindex = 0;
            city.clear();
            district.add(StateModel(Value: data['DistrictDetails'][0]['District'] ?? '' , Text:'0' ));
            city.add(StateModel(Value: data['PincodeDetails'][0]['CityName'] ?? '' , Text: data['PincodeDetails'][0]['CityID'].toString() ));
            state.add(StateModel(Value: data['PincodeDetails'][0]['StateName'] ?? '' , Text: data['PincodeDetails'][0]['StateID'].toString()         ));

          } else{
            print("inside else");
            districtInd = 0;
            citiesInd = 0;
            stateInd = 0;
            districtList.clear();
            statesList.clear();
            citiesList.clear();
            districtList.add(StateModel(Value: data['DistrictDetails'][0]['District'] ?? '' , Text:'0' ));
            citiesList.add(StateModel(Value: data['PincodeDetails'][0]['CityName'] ?? '' , Text: data['PincodeDetails'][0]['CityID'].toString() ));
            statesList.add(StateModel(Value: data['PincodeDetails'][0]['StateName'] ?? '' , Text: data['PincodeDetails'][0]['StateID'].toString()));
            print("districtList:::${districtList[0].Text}");
          }
        } else{
          Logger.showWarningAlert("Alert", "Please Enter Valid Pincode");

        }

      } else{
        Logger.showWarningAlert("Alert", "Please Enter Valid Pincode");

      }
      setState(() {
        isLoading = false;
      });
    });
  }

   callSubmission() {}
}