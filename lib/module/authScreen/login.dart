
import 'package:flutter/material.dart';
import 'package:life_partner/module/authScreen/signUp.dart';
import '../../shared/componant/componant.dart';
import '../../shared/style/colors.dart';
import '../../layout/homeLayout.dart';
import '../bmiScreen/bmi.dart';

class Login extends StatelessWidget {
  static const String routeName= 'Login screen';
   Login({Key? key}) : super(key: key);
var emailController= TextEditingController();
var passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
        child: Center(
          child: CastumCard(
            color: WHITE,
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 35,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 2,horizontal: 1),
                    margin: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: DARK,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Text("login",
                          style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,),),
                        Spacer(),
                        Expanded(
                          flex: 4,
                          child: InkWell(
                            onTap: (){
                              NavigatPushTo(context: context, widget: SignUp());
                            },
                            child: Container(
                              alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: WHITE,
                              borderRadius: BorderRadius.circular(15),
                            ),
                         child: Text("sign Up",
                               style:TextStyle(color:DARK,fontWeight: FontWeight.bold,)
                         ),
                         ),
                          ),
                        ),
                      ],
                    ),
                  ),
                TextFaildCustom(controller: emailController,
                    type: TextInputType.text,
                    isPassword: false,
                    prefix: Icons.email,
                    validate: (value) {
                      if (value.isEmpty) {
                        return "email can't be empty";
                      }
                      return null;
                    },
                  hint: 'your account @gmail.com',),
                 TextFaildCustom(controller: passwordController, type: TextInputType.text,
                     prefix: Icons.lock,
                     suffix: Icons.visibility,

                     isPassword: true, validate: (value) {
                   if (value.isEmpty) {
                     return "Password is short";
                   }
                   return null;
                 }, hint: 'password'),
                  InkWell(
                    onTap: (){
                      NavigatPushTo(context: context, widget:  Bmi());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(14),
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                      decoration: BoxDecoration(
                          color: DARK,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: Text("login",
                        style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,),),

                    ),


                  ),
                  Text("OR",
                    style:TextStyle(color:Colors.grey,
                      fontWeight: FontWeight.bold,),),
                  SizedBox(height: 12,),
                  InkWell(
                    onTap: (){
                    },
                    child:Image.asset("assets/icon/google.png") ,
                  )
                ],
              ),
            ),
          ),
        )
      ),
    ) ;
  }
}
