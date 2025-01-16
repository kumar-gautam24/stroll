import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stroll/widgets/bottom_nav.dart';
import 'widgets/glowing_text.dart';
import 'widgets/nametag.dart';
import 'widgets/option_grid.dart';
import 'widgets/action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedOption = 'D';
  int _selectedNavIndex = 0;

  final List<Map<String, String>> options = [
    {'letter': 'A', 'text': 'The peace in the early mornings'},
    {'letter': 'B', 'text': 'The magical golden hours'},
    {'letter': 'C', 'text': 'Wind-down time after dinners'},
    {'letter': 'D', 'text': 'The serenity past midnight'},
  ];

  @override
  void initState() {
    super.initState();
    _setSystemUIOverlays();
  }

  // Method to set system UI settings
  void _setSystemUIOverlays() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    // Make app full screen
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/background.png'),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(),
                  Colors.black.withValues(),
                  Colors.black,
                ],
                stops: const [0.3, 0.6, 0.8, 1.0],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 30),
                _buildHeader(),
                const SizedBox(height: 8),
                _buildStats(),
                const Spacer(),
                const NameTag(),
                OptionsGrid(
                  options: options,
                  selectedOption: selectedOption,
                  onOptionSelect: _handleOptionSelect,
                ),
                _buildBottomSection(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedNavIndex,
        onItemSelected: _handleNavItemSelected,
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Stroll Bonfire',
          style: TextStyle(
            fontFamily: 'Proxima Nova',
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: const Color.fromARGB(255, 123, 120, 179),
          ),
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: const Color.fromARGB(255, 123, 120, 179),
          size: 28,
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: const [
            GlowingIcon(icon: Icons.access_time),
            SizedBox(width: 4),
            GlowingText(text: '22h 00m'),
          ],
        ),
        const SizedBox(width: 16),
        Row(
          children: const [
            GlowingIcon(icon: Icons.people_outline),
            SizedBox(width: 4),
            GlowingText(text: '103'),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Pick your option.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
              Text(
                'See who has a similar mind.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          const ActionButton(icon: Icons.mic),
          const SizedBox(width: 10),
          const ActionButton(icon: Icons.arrow_forward),
        ],
      ),
    );
  }

  void _handleNavItemSelected(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  void _handleOptionSelect(String letter) {
    setState(() {
      selectedOption = letter;
    });
  }
}
