import 'package:flutter/material.dart';
import 'widgets/glowing_text.dart';
import 'widgets/nametag.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedOption = 'D'; // Default selected option

  // List of options
  final List<Map<String, String>> options = [
    {'letter': 'A', 'text': 'The peace in the early mornings'},
    {'letter': 'B', 'text': 'The magical golden hours'},
    {'letter': 'C', 'text': 'Wind-down time after dinners'},
    {'letter': 'D', 'text': 'The serenity past midnight'},
  ];

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
                SizedBox(height: 30),
                Row(
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
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const GlowingIcon(icon: Icons.access_time),
                        const SizedBox(width: 4),
                        GlowingText(text: '22h 00m'),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Row(
                      children: [
                        const GlowingIcon(icon: Icons.people_outline),
                        const SizedBox(width: 4),
                        GlowingText(text: '103'),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                NameTag(),
                // Options
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: options
                        .map((option) => Column(
                              children: [
                                _buildOption(
                                  option['letter']!,
                                  option['text']!,
                                  isSelected:
                                      selectedOption == option['letter'],
                                  onTap: () =>
                                      _handleOptionSelect(option['letter']!),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ))
                        .toList(),
                  ),
                ),
                // Bottom text and actions
                Padding(
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
                      Spacer(),
                      _buildActionButton(Icons.mic),
                      SizedBox(width: 10),
                      _buildActionButton(Icons.arrow_forward),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOption(
    String letter,
    String text, {
    bool isSelected = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF7B78B3).withAlpha(51)
              : const Color(0xFF000000).withAlpha(77),
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(
                  color: const Color(0xFF7B78B3).withAlpha(102),
                  width: 1,
                )
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withAlpha(26),
              ),
              child: Center(
                child: Text(
                  letter,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF7B78B3).withAlpha(51),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  void _handleOptionSelect(String letter) {
    setState(() {
      selectedOption = letter;
    });
    // Add any additional logic here when an option is selected
  }
}
