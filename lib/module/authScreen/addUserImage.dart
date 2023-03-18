import 'package:flutter/material.dart';
import 'package:life_partner/layout/homeLayout.dart';
import '../../module/bmiScreen/bmi.dart';
import '../../shared/componant/componant.dart';
import '../../shared/style/colors.dart';

class AddUserImage extends StatelessWidget {
  const AddUserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
        child: Center(
          child: CastumCard(
            color: WHITE,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 12,),
                  Text("choose your profile Image",style: TextStyle(color: DARK),),
                  Image.asset("assets/icon/gallery.png"),
                  Text("OR",
                    style:TextStyle(color:Colors.grey,
                      fontWeight: FontWeight.bold,),),
                  SizedBox(height: 8,),
                  InkWell(
                    onTap: (){
                      NavigatPushTo(context: context, widget: Bmi());
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: DARK,
                        shape: BoxShape.circle
                      ),
                      child: Icon(Icons.arrow_forward,color: WHITE,),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text("Skip",
                    style:TextStyle(color:DARK,
                      fontWeight: FontWeight.bold,),),
                  SizedBox(height: 12,),

                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
