import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_partner/module/authScreen/sign_cubit/cubit.dart';
import 'package:life_partner/module/homeScreen/cubit/homeCubit.dart';
import 'package:life_partner/module/homeScreen/cubit/state.dart';
import 'package:life_partner/shared/componant/componant.dart';

import '../module/authScreen/login.dart';
import '../module/authScreen/sign_cubit/sign_state.dart';
import '../module/homeScreen/todo/addTask.dart';
import '../shared/style/colors.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListView(
                        // Important: Remove any padding from the ListView.
                        padding: EdgeInsets.zero,
                        children: [
                          const DrawerHeader(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Text('Drawer Header'),
                          ),
                          ListTile(
                            title: const Text('Item 1'),
                            onTap: () {
                              // Update the state of the app.
                              // ...
                            },
                          ),
                          ListTile(
                            title: const Text('Logout'),
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                                onTap: () {
                                  // SignCubit.get(context).logOut();
                                  print("object");
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                                child: MyAppBar(
                                  context,
                                ))),
                        cubit.Screens[cubit.currentScreen],
                      ],
                    ),
                  ),
                ),
                floatingActionButton: cubit.currentScreen == 1
                    ? FloatingActionButton(
                        heroTag: Text("todoFAT"),
                        onPressed: () {
                          NavigatPushTo(context: context, widget: AddTask());
                        },
                        child: Icon(
                          Icons.add,
                          color: DARK,
                        ),
                        backgroundColor: WHITE,
                      )
                    : null,
                bottomNavigationBar: BottomNavigationBar(
                  onTap: (index) {
                    print(index);
                    cubit.ChangeNavBarScreen(index: index);
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
