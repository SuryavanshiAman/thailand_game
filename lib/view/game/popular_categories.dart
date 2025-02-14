import 'package:flutter/material.dart';
import 'package:game/main.dart';
import 'package:game/res/color-const.dart';
import 'package:game/res/shimmer.dart';
import 'package:game/view_model/all_game_list_view_model.dart';
import 'package:game/view_model/jili_game_launcher_view_model.dart';
import 'package:provider/provider.dart';

class PopularCategories extends StatefulWidget {
  final String data;
  const PopularCategories({super.key, required this.data});

  @override
  State<PopularCategories> createState() => _PopularCategoriesState();
}

class _PopularCategoriesState extends State<PopularCategories> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AllGameListViewModel>(context,listen: false).allGameListApi(context);
  }
  @override
  Widget build(BuildContext context) {

    final gameData=Provider.of<AllGameListViewModel>(context).allGameData;
    final jiliApi=Provider.of<JiliGameLauncherViewModel>(context);
    print(widget.data);
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemCount: gameData?.slot?.length ??0,
          itemBuilder: (context, index) {
            final data = gameData?.slot?[index];

            return InkWell(
              onTap: () {
                jiliApi.setIsGameLaunched(true);
                jiliApi.jiligame(data?.id??"", context);
                // Handle tap event
              },
              child: Stack(
                children: [
                  Container(
                      width: double.infinity,
                      height: height * 0.13,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColor.gray, AppColor.black],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.white.withOpacity(0.5),
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Image.network(
                        data?.img??"",
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.broken_image, size: 40, color: Colors.white), // ✅ Added error handling
                      )// ✅ Placeholder for empty image
                  ),
                  Shimmer.fromColors(
                    period: Duration(seconds: 6),
                    baseColor: Colors.transparent,
                    highlightColor: AppColor.white.withOpacity(0.3),
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.01),
                      height: height * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
