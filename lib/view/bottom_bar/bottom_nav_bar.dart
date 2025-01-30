//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:game/main.dart';
// import 'package:game/res/color-const.dart';
// import 'package:game/view/home/home_screen.dart';
// import 'package:game/view/profile/profile_screen.dart';
// import 'package:game/view/wallet/wallet_screen.dart';
// import 'package:iconly/iconly.dart';
// import 'bottom_bar_cubit.dart';
//
// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});
//
//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   late PageController pageController;
//
//   @override
//   void initState() {
//     super.initState();
//     pageController = PageController();
//   }
//
//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }
//
//   /// Top Level Pages
//   final List<Widget> topLevelPages = const [
//     HomeScreen(),
//     // HomeScreen(),
//     WalletScreen(),
//     ProfileScreen(),
//   ];
//
//   /// on Page Changed
//   void onPageChanged(int page) {
//     BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 2, 2, 2),
//       body: _BottomNavBarBody(),
//       bottomNavigationBar: _BottomNavBarBottomNavBar(context),
//     );
//   }
//
//   // Bottom Navigation Bar - BottomNavBar Widget
//   Container _BottomNavBarBottomNavBar(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border:  Border(top: BorderSide(color:AppColor.white)),
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(20),  // Top-left corner curve
//           topRight: Radius.circular(20), // Top-right corner curve
//         ),
//       ),
//       child: ClipRRect(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(20),  // Top-left corner curve
//           topRight: Radius.circular(20), // Top-right corner curve
//         ),
//         child: BottomAppBar(
//             color: AppColor.black,
//             shape:  CircularNotchedRectangle(
//
//             ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _bottomAppBarItem(
//                 context,
//                 defaultIcon: IconlyLight.home,
//                 page: 0,
//                 label: "Home",
//                 filledIcon: IconlyBold.home,
//               ),
//               _bottomAppBarItem(
//                 context,
//                 defaultIcon: IconlyLight.wallet,
//                 page: 1,
//                 label: "Wallet",
//                 filledIcon: IconlyBold.wallet,
//               ),
//               _bottomAppBarItem(
//                 context,
//                 defaultIcon: IconlyLight.profile,
//                 page: 2,
//                 label: "Profile",
//                 filledIcon: IconlyBold.profile,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   PageView _BottomNavBarBody() {
//     return PageView(
//       onPageChanged: (int page) => onPageChanged(page),
//       controller: pageController,
//       children: topLevelPages,
//     );
//   }
//
//   // Bottom Navigation Bar Single item - BottomNavBar Widget
//   Widget _bottomAppBarItem(
//       BuildContext context, {
//         required defaultIcon,
//         required page,
//         required label,
//         required filledIcon,
//       }) {
//     return GestureDetector(
//       onTap: () {
//         BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);
//
//         pageController.animateToPage(page,
//             duration: const Duration(milliseconds: 10),
//             curve: Curves.fastLinearToSlowEaseIn);
//       },
//       child: Container(
//         color: Colors.transparent,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // const SizedBox(
//             //   height: 10,
//             // ),
//             Icon(
//               context.watch<BottomNavCubit>().state == page
//                   ? filledIcon
//                   : defaultIcon,
//               color: context.watch<BottomNavCubit>().state == page
//                   ? AppColor.white
//                   : AppColor.lightGray,
//               size: 26,
//             ),
//             const SizedBox(
//               height: 3,
//             ),
//             Text(
//               label,
//               style: TextStyle(
//                 color: context.watch<BottomNavCubit>().state == page
//                     ? AppColor.white
//                     : AppColor.lightGrayOne,
//                 fontSize: 13,
//                 fontWeight: context.watch<BottomNavCubit>().state == page
//                     ? FontWeight.w600
//                     : FontWeight.w400,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:game/res/color-const.dart';
import 'package:game/view/home/home_screen.dart';
import 'package:game/view/profile/profile_screen.dart';
import 'package:game/view/wallet/wallet_screen.dart';
import 'package:iconly/iconly.dart';

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);
  List<Widget> screens = [
    WalletScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.black,
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        controller: _pageController,
        children: screens,
      ),
      // PageView.builder(
      //   controller: _pageController,
      //   onPageChanged: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      //   itemBuilder: (context, index) {
      //     return screens();
      //       Center(
      //       child: Text(
      //         'Page $index',
      //         style: const TextStyle(fontSize: 24),
      //       ),
      //     );
      //   },
      //   itemCount: 3,
      // ),
      bottomNavigationBar: CustomPaint(

        painter: CurvedPainter(),
        child: SizedBox(
          // color: Colors.black,
          height: 110,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: _getItemPosition(screenWidth, 0),
                top: _selectedIndex == 0 ? 0 : 20,
                child: navItem(IconlyBold.wallet, "Wallet", 0),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: _getItemPosition(screenWidth, 1),
                top: _selectedIndex == 1 ? 0 : 20,
                child: profileItem("Home", 1),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: _getItemPosition(screenWidth, 2),
                top: _selectedIndex == 2 ? 0 : 20,
                child: navItem(IconlyBold.profile, "Profile", 2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _getItemPosition(double screenWidth, int index) {
    switch (_selectedIndex) {
      case 0:
        return index == 0
            ? screenWidth * 0.41
            : (index == 1 ? screenWidth * 0.75 : screenWidth * 0.97);
      case 1:
        return index == 1
            ? screenWidth * 0.39
            : (index == 0 ? screenWidth * 0.12 : screenWidth * 0.7);
      case 2:
        return index == 2
            ? screenWidth * 0.39
            : (index == 1 ? screenWidth * 0.12 : screenWidth / -8);
      default:
        return 0;
    }
  }

  Widget navItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Column(
        children: [
          AnimatedContainer(
            margin: EdgeInsets.only(top: 5),
            duration: const Duration(milliseconds: 300),
            width: _selectedIndex == index ? 70 : 50,
            height: _selectedIndex == index ? 90 : 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _selectedIndex == index ? Colors.transparent : AppColor.darkGray,
              border: Border.all(
                color: _selectedIndex == index ? Colors.white : Colors.transparent,
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: _selectedIndex == index ? 35 : 25,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: _selectedIndex == index ? 12 : 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget profileItem(String label, int index) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _selectedIndex == index ? 70 : 60,
            height: _selectedIndex == index ? 90 : 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.darkGray.withOpacity(0.5),
              border: Border.all(
                color: _selectedIndex == index ? Colors.white : Colors.transparent,
                width: 2,  // Add border width
              ),
            ),
            child: const Icon(
              IconlyBold.home,
              color: Colors.white,
              // size: _selectedIndex == index ? 35 : 25,
            ),
          ),
          // Adjust the text size based on selection state
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: _selectedIndex == index ? 12 : 12,  // Selected text is larger
            ),
          ),
        ],
      ),
    );
  }


}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Gradient for the fill
    final gradient =AppColor.appBarGradient;

    // Shader for the gradient
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final gradientPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    // Path for the gradient fill
    final fillPath = Path()
      ..moveTo(0, 20)
      ..quadraticBezierTo(size.width * 0.5, -10, size.width, 20)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(fillPath, gradientPaint);

    // Paint for the red border
    final borderPaint = Paint()
      ..color = AppColor.lightGray
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.4; // Adjust border thickness

    // Path for the red border (same as the top curve)
    final borderPath = Path()
      ..moveTo(0, 20)
      ..quadraticBezierTo(size.width * 0.5, -10, size.width, 20);

    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
// class CurvedPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = AppColor.darkGray
//       ..style = PaintingStyle.fill;
//
//     final path = Path()
//       ..moveTo(0, 20)
//       ..quadraticBezierTo(size.width * 0.5, -16, size.width, 20)
//       ..lineTo(size.width, size.height)
//       ..lineTo(0, size.height)
//       ..close();
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }