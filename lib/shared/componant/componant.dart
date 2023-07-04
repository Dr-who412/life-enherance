import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:life_partner/module/authScreen/sign_cubit/cubit.dart';
import 'package:life_partner/module/authScreen/sign_cubit/sign_state.dart';

import '../../model/auth_model/doctors.dart';
import '../../module/homeScreen/doctorScreen/doctorProfile.dart';
import '../style/colors.dart';

enum toastStates { ERROR, WARRING, SUCESS }

Color? toastColor({toastStates? state}) {
  Color? color;
  switch (state) {
    case toastStates.ERROR:
      color = Color.fromRGBO(245, 3, 3, 0.6470588235294118).withOpacity(.4);
      break;
    case toastStates.SUCESS:
      color = Colors.teal.withOpacity(.4);
      break;
    case toastStates.WARRING:
      color = Color.fromRGBO(245, 196, 1, 0.6980392156862745).withOpacity(.4);
      break;
  }
  return color;
}

void showtoast({required String text, required toastStates state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: toastColor(state: state),
        textColor: Colors.white,
        fontSize: 16.0);

void navigatfinished(context, Widget widget) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false);
}

NavigatPushTo({
  required BuildContext context,
  required Widget widget,
}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
//widget
Widget BackGround({required Widget child}) => Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          INDED,
          DARK.withOpacity(.4),

          // HexColor('0a1c1c'),
          // HexColor('3e6864'),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      )),
      child: child,
    );

Widget DashSection(
        {required String title,
        required String limit,
        required String used,
        required Color titleColor,
        required Color dashColor}) =>
    CastumCard(
      color: dashColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.circle,
            color: titleColor,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "$title",
            style: TextStyle(color: titleColor, fontWeight: FontWeight.bold),
          ),
          Text(
            "$limit",
            style: TextStyle(
              color: Colors.black38,
            ),
          ),
        ],
      ),
    );
Widget MyAppBar(BuildContext context) => BlocConsumer<SignCubit, SignState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return CachedNetworkImage(
          imageUrl:
              "https://firebasestorage.googleapis.com/v0/b/lifeenhancer.appspot.com/o/Images%2F20230528_214550.jpg?alt=media&token=e5150a49-f843-43be-8950-b16964b60ec3",
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
            ),
          ),
          // placeholder: (context, url) => Center(
          //   child: CircularProgressIndicator(
          //     color: Colors.white54,
          //   ),
          // ),
          errorWidget: (context, url, error) => CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('assets/img.png'),
          ),
        );
      },
    );
Widget todoTask({
  required String task,
}) =>
    Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: false ? WHITE.withOpacity(.4) : WHITE.withOpacity(1),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Spacer(),
          Text(
            "$task",
            style: TextStyle(color: DARK, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          // Text(
          //   "02:12",
          //   style: TextStyle(color: DARK, fontWeight: FontWeight.bold),
          // )
        ],
      ),
    );
Widget TextFaildCustom({
  required TextEditingController controller,
  required TextInputType type,
  required bool isPassword,
  onsubmit,
  onChange,
  onTap,
  required validate,
  required String hint,
  IconData? prefix,
  IconData? suffix,
  suffixfun,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onsubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      maxLines: 1,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: DARK)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        border:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        // label: Text(label),
        hintText: hint,
        prefixIcon: Icon(
          prefix,
          color: DARK,
        ),
        suffixIcon: IconButton(
            onPressed: suffixfun,
            icon: Icon(
              suffix,
              color: DARK,
            )),
      ),
    );
Widget CastumCard({
  required Widget child,
  required Color color,
}) =>
    Card(
      color: color,
      elevation: 16,
      shadowColor: DARKINDED,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      ),
    );
Widget DoctorCard({required BuildContext context, required AllDoctors? item}) =>
    CastumCard(
        color: WHITE.withOpacity(.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 12,
                ),
                Card(
                  elevation: 0,
                  clipBehavior: Clip.hardEdge,
                  shadowColor: DARK,
                  color: Colors.white.withOpacity(.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(4),
                    height: 82,
                    width: 82,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.network(
                      '${item?.image}',
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (BuildContext, Object, StackTrace) {
                        return Image.asset("assets/img.png");
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "Dr.",
                  style: TextStyle(
                    color: DARK.withOpacity(.8),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${item?.doctor}',
                    style: TextStyle(
                      color: DARK.withOpacity(.6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 12,
                ),
                Image.asset('assets/homeIcon/stethoscope.png'),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                    "${item?.rate}",
                    style: TextStyle(
                      color: DARK.withOpacity(.4),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 12,
                ),
                Icon(
                  Icons.add_location,
                  color: DARKINDED,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                    "${item?.address}",
                    style: TextStyle(
                      color: DARK.withOpacity(.4),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 12,
                ),
                Image.asset("assets/homeIcon/money.png"),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                    "${item?.price}",
                    style: TextStyle(
                      color: DARK.withOpacity(.4),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Card(
                  elevation: .6,
                  color: WHITE.withOpacity(.4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22)),
                  child: InkWell(
                    onTap: () {
                      NavigatPushTo(
                          context: context, widget: DoctorProfile(item: item));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "More ",
                            style: TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
