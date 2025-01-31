
import 'package:flutter/material.dart';
import 'package:game/generated/assets.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/text_widget.dart';
import 'package:game/view/game/wingo/res/gradient_app_bar.dart';
import 'package:game/view_model/avtar_view_model.dart';
import 'package:game/view_model/update_profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;

class ChangeAvtar extends StatefulWidget {
  const ChangeAvtar({super.key});

  @override
  State<ChangeAvtar> createState() => _ChangeAvtarState();
}

class _ChangeAvtarState extends State<ChangeAvtar> {
  int selectedIndex = -1;
  @override
  void initState() {
    super.initState();
    Provider.of<AvtarViewModel>(context,listen: false).avtarApi(context);
  }
  @override
  Widget build(BuildContext context) {
final avtar =Provider.of<AvtarViewModel>(context);
final update=Provider.of<UpdateViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: GradientAppBar(
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                )),
          ),
          centerTitle: true,
          title: textWidget(
            text: 'Change avatar',
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: AppColor.white,
          ),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        // changeAvtar.isEmpty?const Center(child: CircularProgressIndicator()):
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemCount: avtar.avtarData?.data?.length??0,
          itemBuilder: (context, index) {
            final bool isSelected = index == selectedIndex;
final data= avtar.avtarData?.data?[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                update.updateImageApi(data?.id,"",context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                NetworkImage(data?.image.toString()??"",)
                                ))),
                      isSelected ?
                       Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(Icons.check_circle,color: AppColor.white,)):Container()

                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }


}

