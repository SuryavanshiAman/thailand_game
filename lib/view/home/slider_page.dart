import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:game/main.dart';
import 'package:game/view_model/banner_view_%20model.dart';
import 'package:provider/provider.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  int _currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<BannerViewModel>(context,listen: false).bannerApi(context);

  }
  @override

  Widget build(BuildContext context) {
    final banner= Provider.of<BannerViewModel>(context).bannerResponse;

    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: height*0.25,
            aspectRatio: 18/10,
            viewportFraction: 0.99,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
          items: (banner?.data??[]).map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(i.image??"")
                      )
                  ),

                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  List<String> state_data = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs39HZSVdNk4sipuGJ10Ebwajwcq03xrqz_A&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1Dw7-4lVfRq74_YEiPEt4e-bQ0_6UA2y73Q&s"
  ];

}