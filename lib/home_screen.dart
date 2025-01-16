import 'package:flutter/material.dart';

import 'widgets/glowing_text.dart';
import 'widgets/nametag.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                        color: const Color.fromARGB(
                            255, 123, 120, 179), // rgba(204, 200, 255, 1)
                        // height: 1.22,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
