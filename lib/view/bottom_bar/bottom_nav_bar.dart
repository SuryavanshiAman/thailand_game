import 'package:flutter/material.dart';
import 'package:game/res/color-const.dart';
import 'package:game/utils/utils.dart';
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
  Future<bool> _onWillPop() async {
    if (_pageController.page != 1) {

      _pageController.jumpToPage(1);
      setState(() {
        _selectedIndex = 1; // Update the bottom navigation index
      });
      return Future.value(false);
    } else {
      return await Utils.showExitConfirmation(context) ?? false;
    }
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: false,
      onPopInvoked: (v) {
        _onWillPop();
      },
      child: Scaffold(
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