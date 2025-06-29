import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio/pages/project.dart';
import 'package:portfolio/pages/contact.dart';
import 'about.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF5D1AB3),
              Color(0xFF7F1BCD),
              Color(0xFFCD27A3),
              Color(0xFF7F1BCD),
              Color(0xFF1888F8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              CustomAppBar(),
              SizedBox(height: 40),
              HomeHeroSection(),
              SizedBox(height: 80),
              AboutSection(),
              SizedBox(height: 80),
              ProjectSection(),
              SizedBox(height: 80),
              ContactSection(),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 700;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            children: [
              Image.asset("images/logo.png", height: 60),
              const Spacer(),
              if (!isMobile) ...[
                NavButton("Home"),
                NavButton("About"),
                NavButton("Projects"),
                NavButton("Contact"),
              ] else
                const Icon(Icons.menu, color: Colors.white),
            ],
          ),
        );
      },
    );
  }
}

class NavButton extends StatelessWidget {
  final String title;

  const NavButton(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

class HomeHeroSection extends StatelessWidget {
  const HomeHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 700;

        return Stack(
          children: [
            ClipPath(
              clipper: WaveClipperOne(reverse: true, flip: true),
              child: Container(
                height: isMobile ? MediaQuery.of(context).size.height*0.9 : MediaQuery.of(context).size.height*0.9,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.purpleAccent.withOpacity(0.2),
                      Colors.blueAccent.withOpacity(0.2),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left Space
                  if (!isMobile)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("👨‍💻", style: TextStyle(fontSize: 50)),
                          SizedBox(height: 10),
                          Text(
                            "🚀 Building Beautiful UIs",
                            style: TextStyle(color: Colors.white,fontSize: 30),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "🔥 Passion for Flutter",
                            style: TextStyle(color: Colors.white,fontSize: 30),
                          ),
                        ],
                      ),
                    ),

                  // Main Hero
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        const SizedBox(height: 60),
                        Text(
                          "Hey I'm Vansh",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.fredoka(
                            fontSize: isMobile ? 36 : 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Flutter Developer & App Wizard",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.fredoka(
                            fontSize: isMobile ? 24 : 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 20),
                        AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              'Flutter Developer 💙',
                              textStyle: GoogleFonts.fredoka(
                                fontSize: isMobile ? 20 : 28,
                                color: Colors.white,
                              ),
                            ),
                            TyperAnimatedText(
                              'AI Enthusiast 🤖',
                              textStyle: GoogleFonts.fredoka(
                                fontSize: isMobile ? 20 : 28,
                                color: Colors.white,
                              ),
                            ),
                            TyperAnimatedText(
                              'App Wizard 🧙‍♂️',
                              textStyle: GoogleFonts.fredoka(
                                fontSize: isMobile ? 20 : 28,
                                color: Colors.white,
                              ),
                            ),
                          ],
                          repeatForever: true,
                          pause: const Duration(milliseconds: 1000),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                        const SizedBox(height: 20),
                        Image.asset(
                          "images/boy.png",
                          height: isMobile ? 600 : 700,
                        ),
                      ],
                    ),
                  ),

                  // Right Space
                  if (!isMobile)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("images/flutter.png", height: 80),
                                const SizedBox(height: 10),
                                Image.asset("images/dart.png", height: 200),
                                const SizedBox(height: 10),
                                Image.asset("images/firebase.png", height: 120),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}




