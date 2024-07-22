import 'package:flutter/material.dart';

class ProjectTeamPage extends StatefulWidget {
  const ProjectTeamPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProjectTeamPageState createState() => _ProjectTeamPageState();
}

class _ProjectTeamPageState extends State<ProjectTeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F9F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F9F1),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Center(
          child: Text(
            'Project Team',
            style: TextStyle(
              color: Color(0xFF5C715E),
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'LeagueSpartan',
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          TeamMember(
            name: 'Unique Scovi Egnel',
            role: 'Project Manager',
            imagePath:
                'assets/Icons/unique.png', // Replace with your image path
          ),
          TeamMember(
            name: 'Raynaldi Sandy',
            role: 'Developer 1',
            imagePath:
                'assets/Icons/raynaldi.png', // Replace with your image path
          ),
          TeamMember(
            name: 'Iqbal Imaduddin R.',
            role: 'Developer 2',
            imagePath: 'assets/Icons/iqbal.png', // Replace with your image path
          ),
          TeamMember(
            name: 'Anisa Riska Septiyana',
            role: 'Quality Assurance',
            imagePath: 'assets/Icons/riska.png', // Replace with your image path
          ),
          SizedBox(height: 16.0),
          Center(
            child: Text(
              'Pemrograman Mobile',
              style: TextStyle(
                color: Color(0xFF5C715E),
                fontSize: 16,
                fontFamily: 'LeagueSpartan',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TeamMember extends StatelessWidget {
  final String name;
  final String role;
  final String imagePath;

  const TeamMember({
    super.key,
    required this.name,
    required this.role,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFD6E8DA),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Color(0xFF5C715E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LeagueSpartan',
                ),
              ),
              Text(
                role,
                style: const TextStyle(
                  color: Color(0xFF5C715E),
                  fontSize: 16,
                  fontFamily: 'LeagueSpartan',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
