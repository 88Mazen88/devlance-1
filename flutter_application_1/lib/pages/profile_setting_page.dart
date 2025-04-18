import 'package:flutter/material.dart';
class ProfileSettingPage extends StatefulWidget {
  final String? fullName;
  final String? bio;
  final String? degree;
  
  const ProfileSettingPage({
    super.key,
    this.fullName,
    this.bio,
    this.degree,
  });

  @override
  State<ProfileSettingPage> createState() => _ProfileSettingPageState();
}

class _ProfileSettingPageState extends State<ProfileSettingPage> {
  List<String> skills = [];
  List<String> jobHistory = [];
  TextEditingController skillController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  bool isDarkMode = false;

  @override
  void dispose() {
    skillController.dispose();
    jobController.dispose();
    super.dispose();
  }

  void _addSkill() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Skill'),
        content: TextField(
          controller: skillController,
          decoration: const InputDecoration(hintText: 'Enter your skill'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (skillController.text.isNotEmpty) {
                setState(() {
                  skills.add(skillController.text);
                  skillController.clear();
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _deleteSkill(int index) {
    setState(() {
      skills.removeAt(index);
    });
  }

  void _addJobHistory() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Job History'),
        content: TextField(
          controller: jobController,
          decoration: const InputDecoration(hintText: 'Enter job history'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (jobController.text.isNotEmpty) {
                setState(() {
                  jobHistory.add(jobController.text);
                  jobController.clear();
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _deleteJobHistory(int index) {
    setState(() {
      jobHistory.removeAt(index);
    });
  }

  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayName = widget.fullName ?? 'Youssef Mohamed';
    final bioText = widget.bio ?? 'Software Engineer';
    final degreeText = widget.degree ?? 'Graduated From Egyptian Chinese University, Software Department';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Settings'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: _toggleTheme,
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(context, '/developer-info');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                displayName,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                bioText,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            Center(
              child: Text(
                degreeText,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),

            // Skills Section
            Row(
              children: [
                const Text(
                  'Skills',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addSkill,
                ),
              ],
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills.asMap().entries.map((entry) => Chip(
                label: Text(entry.value),
                backgroundColor: Colors.cyan[100],
                deleteIcon: const Icon(Icons.close),
                onDeleted: () => _deleteSkill(entry.key),
              )).toList(),
            ),
            const SizedBox(height: 24),

            // Job History Section
            Row(
              children: [
                const Text(
                  'Job History',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addJobHistory,
                ),
              ],
            ),
            Column(
              children: jobHistory.asMap().entries.map((entry) => Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(child: Text(entry.value)),
                    IconButton(
                      icon: const Icon(Icons.delete, size: 20),
                      onPressed: () => _deleteJobHistory(entry.key),
                    ),
                  ],
                ),
              )).toList(),
            ),
            const SizedBox(height: 24),

            // Account Balance Section
            const Text(
              'Account Balance',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '00.00\$',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle withdraw action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4AC5DE),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Withdraw',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
      ),
    );
  }
}

