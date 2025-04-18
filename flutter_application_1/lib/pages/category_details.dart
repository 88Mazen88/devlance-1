import 'package:flutter/material.dart';

class CategoryDetailsPage extends StatelessWidget {
  final String category;

  const CategoryDetailsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: Center(
        child: Text(
          'Details for $category',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class JobDetailsPage extends StatefulWidget {
  final String jobTitle;
  final String description;
  final double rating;
  final String location;
  final int price;

  const JobDetailsPage({
    super.key,
    required this.jobTitle,
    required this.description,
    required this.rating,
    required this.location,
    required this.price,
  });

  @override
  State<JobDetailsPage> createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[200],
            child: Row(
              children: [
                _buildTabButton(0, 'Details'),
                _buildTabButton(1, 'Contact'),
                _buildTabButton(2, 'About Client'),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedTab,
              children: [
                _buildDetailsTab(),
                const Center(child: Text('Contact information would go here')),
                _buildClientTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(int index, String title) {
    return Expanded(
      child: TextButton(
        onPressed: () => setState(() => _selectedTab = index),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: _selectedTab == index ? Colors.grey[300] : Colors.transparent,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: _selectedTab == index ? Colors.blue : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.jobTitle, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text(widget.description, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 16),
          const Text('Budget:', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('\$${widget.price}', style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildClientTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
          ),
          const SizedBox(height: 16),
          const Text('Client Info', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Location: ${widget.location}'),
          const SizedBox(height: 8),
          Text('Rating: ${widget.rating}'),
        ],
      ),
    );
  }
}
