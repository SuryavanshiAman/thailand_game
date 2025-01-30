import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/main.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/constantButton.dart';
import 'package:game/res/custom_text_field.dart';
import 'package:game/view_model/update_profile_view_model.dart';
import 'package:provider/provider.dart';


class NickNameScreen extends StatefulWidget {
  const NickNameScreen({super.key});

  @override
  State<NickNameScreen> createState() => _NickNameScreenState();
}



class _NickNameScreenState extends State<NickNameScreen> {

  TextEditingController nameCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
final update=Provider.of<UpdateViewModel>(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: ListView(
          children: [
            SizedBox(height: height*0.2,),
            Container(
              height: height*0.5,
              decoration: BoxDecoration(
                  gradient: AppColor.appBarGradient,
                  borderRadius: BorderRadius.circular(15)
              ),
              width: width,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(height: 1,width: width*0.07,color: Colors.white,),
                        const Text('Change NickName',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18,fontFamily: "SitkaSmall"),),
                        Container(height: 1,width: width*0.07,color: Colors.white,)
                      ],
                    ),
                  ),
                  Container(
                    height: 250,
                    width: width*0.7,
                    decoration: BoxDecoration(
                        color: AppColor.black,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.06,),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: width*0.13,
                              decoration:  const BoxDecoration(
                                  image: DecorationImage(image: AssetImage(Assets.imagesDialogNickname))
                              ),
                            ),
                            const Text("Nickname",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:16,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        SizedBox(height: height*0.02,),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CustomTextField(
                            controller: nameCon,
                            label: "NancyMomoLand",
                            hintColor: AppColor.lightGray,
                            hintSize: 16,
                            height: 55,
                            borderSide: BorderSide(color: Colors.white),
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            filled: true,
                            fillColor: AppColor.gray.withOpacity(0.5),
                            border: Border.all(color: AppColor.gray.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(15),
                            fieldRadius: BorderRadius.circular(15),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                        //   child: CustomTextField(
                        //     fillColor: Colors.white,
                        //     controller: nameCon,
                        //     filled: true,
                        //     focusColor: Colors.white,
                        //     maxLines: 1,
                        //     label: "NancyMomoLand",
                        //   ),
                        // ),

                        const Spacer(),
                        constantbutton(onTap: () {
                          update.updateImageApi("", nameCon.text, context);
                        }, text: 'Submit',),
                        // AppBtn(
                        //   height: 50,
                        //   title: 'Submit',
                        //   fontSize: 20,
                        //   titleColor: AppColors.primaryTextColor,
                        //   hideBorder: true,
                        //   onTap: () {
                        //     avtarChangeApi(nameCon.text);
                        //   },
                        //   gradient: AppColors.loginSecondryGrad,
                        // ),
                        SizedBox(height: height*0.02,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: const Icon(Icons.cancel_outlined,size: 35,color: Colors.white,),),
            )
          ],
        ),
      ),
    );
  }
  // BaseApiHelper baseApiHelper = BaseApiHelper();
  //
  // UserViewProvider userProvider = UserViewProvider();
  // avtarChangeApi( String nickname) async {
  //   UserModel user = await userProvider.getUser();
  //   String token = user.id.toString();
  //   final response = await http.post(
  //     Uri.parse(ApiUrl.UpdateAvtarApi),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       "id": token,
  //       "username": nickname,
  //     }),
  //   );
  //   var data = jsonDecode(response.body);
  //   print(data);
  //   if (data["status"] == 200) {
  //     context.read<ProfileProvider>().fetchProfileData();
  //     Navigator.pop(context);
  //     return Utils.flushBarSuccessMessage(data['message'], context, Colors.black);
  //   } else if (data["status"] == 401) {
  //     Utils.flushBarErrorMessage(data['message'], context, Colors.black);
  //   } else {
  //     Utils.flushBarErrorMessage(data['message'], context, Colors.black);
  //   }
  // }
}