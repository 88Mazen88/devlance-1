import 'package:flutter/material.dart';

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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                // Details Tab
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.jobTitle,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Project Brief - Clothing Brand',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildDetailItem('Website Brand Name:', '[Your Brand Name]'),
                      _buildDetailItem('Website Type:', 'E-commerce'),
                      const SizedBox(height: 16),
                      const Text(
                        'Build a clean, responsive online store. Display products with categories and filters. Enable secure checkout (Stripe/PayPal). Reflect a modern, tech-inspired brand vibe.',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Features:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _buildBulletPoint('Homepage (hero, featured items)'),
                      _buildBulletPoint('Product Pages (images, size, price, add to cart)'),
                      _buildBulletPoint('Shop with filters (by category, size, price)'),
                      _buildBulletPoint('Cart & Checkout'),
                      _buildBulletPoint('About + Contact Page'),
                      _buildBulletPoint('Mobile-friendly design'),
                      const SizedBox(height: 16),
                      const Text(
                        'Style:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _buildBulletPoint('Minimal, clean, and developer-aesthetic'),
                      _buildBulletPoint('Color palette & font: [Add here]'),
                      _buildBulletPoint('Logo: [Attach if available]'),
                      _buildBulletPoint('Design reference: [Link to 1-2 sites you like]'),
                      const SizedBox(height: 16),
                      const Text(
                        'Deadline:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text('May 10, 2025', style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 16),
                      const Text(
                        'Budget:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Fixed Salary: \$${widget.price} USD',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4AC5DE),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: const Text(
                                'Apply now',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.pop(context),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                side: const BorderSide(color: Color(0xFF4AC5DE)),
                              ),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4AC5DE),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                // Contact Tab
                const Center(child: Text('Contact information would go here')),
                
                // About Client Tab
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'John Smith',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.location_on, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  widget.location,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 20),
                                const SizedBox(width: 4),
                                Text(
                                  widget.rating.toString(),
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Job History',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildJobHistoryItem('E-commerce Website', 'Completed 12 projects', '4.8 rating'),
                      _buildJobHistoryItem('Mobile App Development', 'Completed 8 projects', '4.6 rating'),
                      _buildJobHistoryItem('UI/UX Design', 'Completed 15 projects', '4.9 rating'),
                      const SizedBox(height: 16),
                      const Text(
                        'About',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Experienced entrepreneur with 5+ years in the fashion industry. '
                        'Looking to expand my brand online with a professional e-commerce presence.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
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
        onPressed: () {
          setState(() => _selectedTab = index);
        },
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

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(
              text: label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: ' $value'),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _buildJobHistoryItem(String title, String projects, String rating) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(projects, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 4),
          Text(rating, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}