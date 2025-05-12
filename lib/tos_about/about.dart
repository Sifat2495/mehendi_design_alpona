import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24),
              Text(
                'About Astha Tech BD',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Astha Tech BD is a purpose-driven technology startup founded with a vision to make a meaningful difference in the world. We believe that technology, when built with empathy and intent, can be a powerful tool to solve real social challenges.\n\n'
                    'As we embark on our journey, our mission is simple yet bold: to build thoughtful, impactful, and accessible digital solutions that improve lives and strengthen communities.\n\n'
                    'From simplifying everyday experiences to addressing broader societal needs, we’re committed to creating technology that serves—not just sells. Our first steps may be small, but they are rooted in purpose and guided by a deep belief in social good.\n\n'
                    'Join us as we grow, learn, and build a better future—one app at a time.\n\n',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Text(
                'Astha Tech BD – Technology with Purpose.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold, // 👈 This makes the line bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
