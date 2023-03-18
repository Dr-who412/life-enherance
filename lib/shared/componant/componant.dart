import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../module/homeScreen/doctorScreen/doctorProfile.dart';
import '../style/colors.dart';
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
Widget DashSection({required String title,required String limit,required String used,required Color titleColor,required Color dashColor})=>
    CastumCard(
    color:dashColor,
child: Column(
mainAxisAlignment: MainAxisAlignment.spaceAround,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Icon(Icons.circle,color: titleColor,),
SizedBox(height: 8,),
Text("cateh",style: TextStyle(color:titleColor,fontWeight: FontWeight.bold),),
Text("5/31g",style: TextStyle(color:Colors.black38 ,fontWeight: FontWeight.bold),),
Text("22g left",style: TextStyle(color:Colors.black38 ,),),
],
),
);
Widget MyAppBar()=>  Row(
children: [
Container(
margin: EdgeInsets.all(8),
decoration: BoxDecoration(
color: DARK,
borderRadius: BorderRadius.circular(12),
),
child: IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: Colors.white,),)),
Spacer(),
CircleAvatar(radius: 22,backgroundImage: AssetImage('assets/img.png'),),
],
);
Widget todoTask(
//{
  //required task,
//}
)=>Container(
  margin: EdgeInsets.symmetric(vertical: 6),
  padding: EdgeInsets.all(14),
  decoration: BoxDecoration(
    color: false?WHITE.withOpacity(.4):WHITE.withOpacity(1),
    borderRadius: BorderRadius.circular(24),
  ),
  child: Row(
    children: [
      Spacer(),
      Text("task Title",style: TextStyle(color: DARK,fontWeight: FontWeight.bold),),
      Spacer(),
      Text("02:12",style: TextStyle(color: DARK,fontWeight: FontWeight.bold),)
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
})=> TextFormField(
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
    focusedBorder:  UnderlineInputBorder(borderSide: BorderSide(color: DARK)),
    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    // label: Text(label),
    hintText: hint,
    prefixIcon: Icon(prefix,color: DARK,),
    suffixIcon: IconButton(onPressed: suffixfun, icon: Icon(suffix)),
  ),
);
Widget CastumCard({
  required Widget child,
  required Color color,
})=> Card(
  color: color,
  elevation: 16,
shadowColor: DARKINDED,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  child:   Container(
    padding: EdgeInsets.all(8),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  ),
  child:child,
  ),
);
Widget DoctorCard({required BuildContext context})=> CastumCard(
color:WHITE.withOpacity(.4),
child:Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
mainAxisAlignment: MainAxisAlignment.start,
children: [
SizedBox(width:12,),
CircleAvatar(backgroundImage: AssetImage("assets/img.png")),
SizedBox(width: 12,),
Text("Dr.",
style: TextStyle(color: DARK.withOpacity(.4),fontWeight: FontWeight.bold,
fontSize: 22,
),),
Expanded(
child: Text("shen power of sheld ",
style: TextStyle(color: DARK.withOpacity(.4),fontWeight: FontWeight.bold,
),),
)
],
),
SizedBox(height: 8,),
Row(
mainAxisAlignment: MainAxisAlignment.start,
children: [
SizedBox(width:12,),
Image.asset('assets/homeIcon/stethoscope.png'),
SizedBox(width: 12,),

Expanded(
child: Text("shen power of sheld ",
style: TextStyle(color: DARK.withOpacity(.4),fontWeight: FontWeight.bold,
fontSize: 22,
),),
)
],
),
SizedBox(height: 8,),
Row(
mainAxisAlignment: MainAxisAlignment.start,
children: [
SizedBox(width:12,),
Icon(Icons.add_location,color: DARKINDED,),
SizedBox(width: 12,),
Expanded(
child: Text("shen power of sheld ",
style: TextStyle(color: DARK.withOpacity(.4),fontWeight: FontWeight.bold,
),),
)
],
),
SizedBox(height: 8,),
Row(
mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
SizedBox(width:12,),
Image.asset("assets/homeIcon/money.png"),
SizedBox(width: 12,),

Expanded(
child: Text("300",
style: TextStyle(color: DARK.withOpacity(.4),fontWeight: FontWeight.bold,

),),
),
Card(
elevation: .6,
color:WHITE.withOpacity(.4),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(22)
),
child: InkWell(
onTap: (){
  NavigatPushTo(context: context, widget: DoctorProfile());
},
child: Padding(
padding: const EdgeInsets.all(8.0),
child: Row(
mainAxisSize: MainAxisSize.min,
children: [
  SizedBox(width: 4,),
Text("More ",style: TextStyle(color: Colors.white60,fontWeight: FontWeight.bold),),
  Icon(Icons.arrow_forward_ios_rounded,color: Colors.white60,),
],
),
),
),
),
],
),

],
)
);