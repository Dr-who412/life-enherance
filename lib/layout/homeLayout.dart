import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_partner/module/authScreen/sign_cubit/cubit.dart';
import 'package:life_partner/module/bmiScreen/bmiUpdate.dart';
import 'package:life_partner/module/eating_disorder/guide.dart';
import 'package:life_partner/module/homeScreen/cubit/homeCubit.dart';
import 'package:life_partner/module/homeScreen/cubit/state.dart';
import 'package:life_partner/shared/componant/componant.dart';
import 'package:life_partner/shared/componant/constant.dart';

import '../module/authScreen/login.dart';
import '../module/authScreen/sign_cubit/sign_state.dart';
import '../shared/style/colors.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SignCubit.get(context).getUserData();
  }

  @override
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
        if (AppConstant.Token == '' || AppConstant.Token == null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Login()),
              (route) => false);
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SafeArea(
            top: true,
            right: true,
            bottom: true,
            left: true,
            child: BlocListener<SignCubit, SignState>(
              listener: (context, state) {
                // TODO: implement listener}
                if (state is LogoutState) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                      (route) => false);
                }
                print(State);
                if (state is GetUserDataSucces &&
                    SignCubit.get(context).weeklyDiet == null) {
                  SignCubit.get(context).getWeaklyDietDaily();
                }
              },
              child: Scaffold(
                key: _scaffoldKey,
                drawer: Drawer(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  child: Card(
                    color: WHITE.withOpacity(.5),
                    elevation: 16,
                    margin: EdgeInsets.only(bottom: 58, left: 8, top: 8),
                    shadowColor: DARKINDED,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(horizontal: 26),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        // Important: Remove any padding from the ListView.

                        children: [
                          DrawerHeader(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      // print("object1111111111111111");
                                      // print("object");
                                      // _scaffoldKey.currentState!.openDrawer();
                                    },
                                    child: BlocConsumer<SignCubit, SignState>(
                                      listener: (context, state) {
                                        // TODO: implement listener
                                      },
                                      builder: (context, state) {
                                        return CachedNetworkImage(
                                          imageUrl:
                                              "${SignCubit.get(context).user?.user?.photoURL}",
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            width: 75,
                                            height: 75,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              SizedBox(
                                            width: 75,
                                            height: 75,
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.white54,
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              CircleAvatar(
                                            radius: 42,
                                            backgroundImage:
                                                AssetImage('assets/img.png'),
                                          ),
                                        );
                                      },
                                    )),
                                BlocConsumer<SignCubit, SignState>(
                                  listener: (context, state) {
                                    // TODO: implement listener
                                  },
                                  builder: (context, state) {
                                    return Text(
                                      '${SignCubit.get(context).user?.user?.name}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 34,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          BmiUpdate()));
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/bmi.png",
                                  height: 22,
                                  width: 22,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'BMI',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          BlocConsumer<SignCubit, SignState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              return SignCubit.get(context)
                                          .user
                                          ?.user
                                          ?.hasDisorder
                                          .toString() ==
                                      '1'
                                  ? GestureDetector(
                                      child: Row(
                                        children: [
                                          Icon(Icons.info_outline_rounded,
                                              color: Colors.white),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                            'guide',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        SignCubit.get(context).getGuide();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GuideScrean()),
                                        );
                                      },
                                    )
                                  : SizedBox();
                            },
                          ),

                          Spacer(),
                          // ListTile(
                          //   title: Text('Item 1'),
                          //   onTap: () {
                          //     // Update the state of the app.
                          //     // ...
                          //   },
                          // ),
                          GestureDetector(
                            child: Row(
                              children: [
                                Icon(Icons.logout, color: Colors.white),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Logout',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            onTap: () {
                              SignCubit.get(context).logOut();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                body: BackGround(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: BlocListener<SignCubit, SignState>(
                                  listener: (context, state) {
                                    if (SignCubit.get(context).showDrower ==
                                        true) {
                                      SignCubit.get(context).showDrower = false;
                                      _scaffoldKey.currentState!.openDrawer();
                                    }
                                    // TODO: implement listener}
                                  },
                                  child: InkWell(
                                      onTap: () {
                                        // SignCubit.get(context).logOut();
                                        //   SignCubit.get(context).getUserData();
                                        SignCubit.get(context).showDrower =
                                            true;
                                        // SignCubit.get(context).showDrower = false;
                                        _scaffoldKey.currentState!.openDrawer();
                                        print("object");
                                      },
                                      child: BlocConsumer<SignCubit, SignState>(
                                        listener: (context, state) {
                                          // TODO: implement listener
                                        },
                                        builder: (context, state) {
                                          return CachedNetworkImage(
                                            imageUrl:
                                                "${SignCubit.get(context).user?.user?.photoURL}",
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              width: 56,
                                              height: 56,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            // placeholder: (context, url) => Center(
                                            //   child: CircularProgressIndicator(
                                            //     color: Colors.white54,
                                            //   ),
                                            // ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    CircleAvatar(
                                              radius: 22,
                                              backgroundImage:
                                                  AssetImage('assets/img.png'),
                                            ),
                                          );
                                        },
                                      )),
                                )),
                            cubit.Screens[cubit.currentScreen],
                          ],
                        ),
                      ),
                      if (SignCubit.get(context).BMI != null &&
                          (SignCubit.get(context).BMI ?? 0) >= 30)
                        BlocConsumer<SignCubit, SignState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            return Align(
                              alignment: Alignment.center,
                              child: Card(
                                  color: Colors.white.withOpacity(0.9),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    padding: EdgeInsets.all(12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                            alignment: Alignment.center,
                                            child: BlocListener<SignCubit,
                                                SignState>(
                                              listener: (context, state) {
                                                if (state
                                                        is GetUserDataSucces &&
                                                    SignCubit.get(context)
                                                            .showDrower ==
                                                        true) {
                                                  SignCubit.get(context)
                                                      .showDrower = false;
                                                  _scaffoldKey.currentState!
                                                      .openDrawer();
                                                }

                                                // TODO: implement listener}
                                              },
                                              child: BlocConsumer<SignCubit,
                                                  SignState>(
                                                listener: (context, state) {
                                                  // TODO: implement listener
                                                },
                                                builder: (context, state) {
                                                  return CachedNetworkImage(
                                                    imageUrl:
                                                        "${SignCubit.get(context).user?.user?.photoURL}",
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                      width: 90,
                                                      height: 90,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    // placeholder: (context, url) => Center(
                                                    //   child: CircularProgressIndicator(
                                                    //     color: Colors.white54,
                                                    //   ),
                                                    // ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            CircleAvatar(
                                                      radius: 82,
                                                      backgroundImage:
                                                          AssetImage(
                                                              'assets/img.png'),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )),
                                        Text(
                                          'dear ${SignCubit.get(context).user?.user?.name ?? ''} based on Your BMI ${SignCubit.get(context).BMI} & BMR ${SignCubit.get(context).user?.user?.bmr?.round() ?? ''} you need to visit doctor so i recommend list of them ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 32,
                                          ),
                                        ),
                                        Spacer(),
                                        ElevatedButton(
                                            onPressed: () {
                                              SignCubit.get(context).BMI = null;
                                              SignCubit.get(context).zero();
                                              HomeCubit.get(context)
                                                  .ChangeNavBarScreen(index: 3);
                                            },
                                            child: Text('doctors Section')),
                                      ],
                                    ),
                                  )),
                            );
                          },
                        ),
                    ],
                  ),
                ),
                // floatingActionButton: cubit.currentScreen == 1
                //     ? FloatingActionButton(
                //         heroTag: Text("todoFAT"),
                //         onPressed: () {
                //           NavigatPushTo(context: context, widget: AddTask());
                //         },
                //         child: Icon(
                //           Icons.add,
                //           color: DARK,
                //         ),
                //         backgroundColor: WHITE,
                //       )
                //     : null,
                bottomNavigationBar: BottomNavigationBar(
                  onTap: (index) {
                    print(index);
                    cubit.ChangeNavBarScreen(index: index);
                    if (index == 0) {
                      SignCubit.get(context).getUserData();
                    }
                    print(cubit.currentScreen);
                  },
                  currentIndex: cubit.currentScreen,
                  elevation: .8,
                  showSelectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                  // selectedLabelStyle: TextStyle(color: DARKINDED,fontWeight: FontWeight.bold),
                  items: [
                    BottomNavigationBarItem(
                        icon: Image.asset('assets/homeIcon/home.png'),
                        label: 'home'),
                    BottomNavigationBarItem(
                        icon: Image.asset('assets/homeIcon/planning.png'),
                        label: 'todo'),
                    BottomNavigationBarItem(
                        icon: Image.asset('assets/homeIcon/stretching.png'),
                        label: 'tranning'),
                    BottomNavigationBarItem(
                        icon: Image.asset('assets/homeIcon/stethoscope.png'),
                        label: 'doctors'),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
