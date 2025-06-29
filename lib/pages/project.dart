import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        "title": "CineLoop",
        "desc": "Movie Booking App",
        "image": "images/project1.png",
      },
      {
        "title": "Newsify",
        "desc": "News App",
        "image": "images/project2.png",
      },
      {
        "title": "NovaCart",
        "desc": "E Commerce",
        "image": "images/project3.png",
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Text(
            "Projects",
            style: GoogleFonts.fredoka(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: projects.map((proj) => ProjectCard(proj)).toList(),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Map project;

  const ProjectCard(this.project, {super.key});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 250,
        height: 380,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isHover ? Colors.white24 : Colors.white10,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isHover
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 10),
            ),
          ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.project["image"], height: 250),
            const SizedBox(height: 20),
            Text(
              widget.project["title"],
              style: GoogleFonts.fredoka(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.project["desc"],
              textAlign: TextAlign.center,
              style: GoogleFonts.fredoka(color: Colors.white60),
            ),
          ],
        ),
      ),
    );
  }
}