
import 'package:flutter/material.dart';

void main() {
  runApp(const HokmArena());
}

class HokmArena extends StatelessWidget {
  const HokmArena({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hokm Arena',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF101010),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD4AF37),
        ),
      ),
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF171717),
        title: const Text(
          'HOKM ARENA',
          style: TextStyle(
            color: Color(0xFFD4AF37),
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            const Text(
              'TEAM GOLD  0  -  0  TEAM BLACK',
              style: TextStyle(
                color: Color(0xFFD4AF37),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text('PLAYER 2'),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlayingCard(hidden: true),
                PlayingCard(hidden: true),
                PlayingCard(hidden: true),
              ],
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(18),
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                color: const Color(0xFF17452E),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: const Color(0xFFD4AF37),
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15,
                  ),
                ],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'HOKM TABLE',
                    style: TextStyle(
                      color: Color(0xFFD4AF37),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PlayingCard(value: 'A', suit: '♠'),
                      PlayingCard(value: 'K', suit: '♥'),
                      PlayingCard(value: '10', suit: '♦'),
                      PlayingCard(value: '7', suit: '♣'),
                    ],
                  ),
                  Text(
                    'Trump: ♠  |  Your turn',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Text('YOUR HAND'),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlayingCard(value: 'A', suit: '♠'),
                PlayingCard(value: 'K', suit: '♥'),
                PlayingCard(value: 'Q', suit: '♦'),
                PlayingCard(value: 'J', suit: '♣'),
              ],
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'FIND MATCH',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class PlayingCard extends StatelessWidget {
  final String value;
  final String suit;
  final bool hidden;

  const PlayingCard({
    super.key,
    this.value = '',
    this.suit = '',
    this.hidden = false,
  });

  @override
  Widget build(BuildContext context) {
    final red = suit == '♥' || suit == '♦';

    return Container(
      width: 48,
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: hidden ? const Color(0xFF252525) : Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: const Color(0xFFD4AF37),
          width: 1.5,
        ),
      ),
      child: Center(
        child: hidden
            ? const Icon(
                Icons.style,
                color: Color(0xFFD4AF37),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      color: red ? Colors.red : Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    suit,
                    style: TextStyle(
                      color: red ? Colors.red : Colors.black,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
