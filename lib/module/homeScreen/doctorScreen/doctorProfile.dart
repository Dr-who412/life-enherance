import 'package:flutter/material.dart';
import 'package:life_partner/shared/style/colors.dart';

import '../../../model/auth_model/doctors.dart';
import '../../../shared/componant/componant.dart';

class DoctorProfile extends StatelessWidget {
  final AllDoctors? item;
  DoctorProfile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      right: true,
      bottom: true,
      left: true,
      child: Scaffold(
        backgroundColor: WHITE.withOpacity(.9),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Card(
                      elevation: 0,
                      clipBehavior: Clip.hardEdge,
                      shadowColor: DARK,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("assets/img.png"),
                        radius: 46,
                      )),
                  Expanded(
                    flex: 2,
                    child: CastumCard(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 34),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "Dr.",
                                  style: TextStyle(
                                    color: DARKINDED,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "${item?.doctor}",
                                    style: TextStyle(
                                      color: DARK.withOpacity(.4),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      color: WHITE,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              //  CastumCard(child:
              Container(
                margin: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "about",
                      style: TextStyle(
                        color: DARKINDED,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      '${item?.description}',
                      style: TextStyle(
                        color: DARK.withOpacity(.4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              //       color:WHITE),
              SizedBox(
                height: 6,
              ),
              CastumCard(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Brief",
                          style: TextStyle(
                            color: DARKINDED,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "${item?.brief}",
                          style: TextStyle(
                            color: DARKINDED,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  color: WHITE),
              // Row(
              //   children: [
              //     Expanded(
              //       child: CastumCard(
              //           child: Column(
              //             children: [
              //               Text(
              //                 "open",
              //                 style: TextStyle(
              //                     color: DARKINDED,
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 22),
              //               ),
              //               Text(
              //                 " from \n 8  to 10 ",
              //                 style: TextStyle(
              //                   color: DARKINDED,
              //                 ),
              //               ),
              //             ],
              //           ),
              //           color: WHITE),
              //     ),
              //     // Expanded(
              //     //   child: CastumCard(
              //     //       child: Column(
              //     //         children: [
              //     //           Text(
              //     //             "open from  \n 12 to 6",
              //     //             style: TextStyle(
              //     //               color: DARKINDED,
              //     //               fontWeight: FontWeight.bold,
              //     //             ),
              //     //           ),
              //     //         ],
              //     //       ),
              //     //       color: WHITE),
              //     // ),
              //   ],
              // ),
              CastumCard(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/homeIcon/money.png',
                            color: DARKINDED,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${item?.price}",
                            style: TextStyle(
                              color: DARK.withOpacity(.4),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.not_listed_location,
                            color: DARKINDED,
                          ),
                          Flexible(
                            child: Text(
                              "${item?.area}${item?.address}",
                              maxLines: 3,
                              softWrap: true,
                              style: TextStyle(
                                color: DARK.withOpacity(.4),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone_android,
                            color: DARKINDED,
                          ),
                          Text(
                            "${item?.phoneNumber}",
                            style: TextStyle(
                              color: DARK.withOpacity(.4),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      // InkWell(
                      //   onTap: () async => await launchUrl(
                      //       Uri.parse('https://www.google.com')),
                      //   child: Text(
                      //     'Click here',
                      //     style: TextStyle(
                      //         decoration: TextDecoration.underline,
                      //         color: Colors.blue),
                      //   ),
                      // )
                    ],
                  ),
                ),
                color: WHITE,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
