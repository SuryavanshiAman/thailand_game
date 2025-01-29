import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Center(
            child: Text(
              'Page $index',
              style: const TextStyle(fontSize: 24),
            ),
          );
        },
        itemCount: 3,
      ),
      bottomNavigationBar: CustomPaint(
        painter: CurvedPainter(),
        child: SizedBox(
          height: 110,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: _getItemPosition(screenWidth, 0),
                top: _selectedIndex == 0 ? 0 : 20,
                child: navItem(Icons.qr_code_scanner, "SCAN & PAY", 0),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: _getItemPosition(screenWidth, 1),
                top: _selectedIndex == 1 ? 0 : 20,
                child: profileItem("HARSH SINGH", 1),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: _getItemPosition(screenWidth, 2),
                top: _selectedIndex == 2 ? 0 : 20,
                child: navItem(Icons.credit_card, "CREDIT CARD", 2),
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
            duration: const Duration(milliseconds: 300),
            width: _selectedIndex == index ? 70 : 60,
            height: _selectedIndex == index ? 90 : 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _selectedIndex == index ? Colors.transparent : Colors.grey[800],
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
              fontSize: _selectedIndex == index ? 12 : 7,
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
              border: Border.all(
                color: _selectedIndex == index ? Colors.white : Colors.transparent,
                width: 2,  // Add border width
              ),
            ),
            child: const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('Assets/person_man_2.png'),
            ),
          ),
          // Adjust the text size based on selection state
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: _selectedIndex == index ? 12 : 7,  // Selected text is larger
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
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 20)
      ..quadraticBezierTo(size.width * 0.5, -10, size.width, 20)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}