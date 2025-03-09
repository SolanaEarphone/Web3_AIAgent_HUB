import 'package:flutter/material.dart';

class AgentStoreHome extends StatefulWidget {
  const AgentStoreHome({super.key});

  @override
  State<AgentStoreHome> createState() => _AgentStoreHomeState();
}

class _AgentStoreHomeState extends State<AgentStoreHome> {
  final List<Map<String, dynamic>> _featuredAgents = [
    {
      'name': 'Voice Assistant Pro',
      'description': 'Professional voice assistant with multi-language support',
      'rating': 4.8,
      'downloads': 15000,
      'price': 9.99,
      'image': 'assets/agent1.png',
    },
    {
      'name': 'Music DJ',
      'description': 'AI DJ that helps you discover and mix music',
      'rating': 4.6,
      'downloads': 12000,
      'price': 4.99,
      'image': 'assets/agent2.png',
    },
    {
      'name': 'Language Tutor',
      'description': 'Learn new languages with AI-powered conversations',
      'rating': 4.9,
      'downloads': 20000,
      'price': 14.99,
      'image': 'assets/agent3.png',
    },
  ];

  final List<String> _categories = ['All', 'Productivity', 'Education', 'Entertainment', 'Lifestyle', 'Social'];

  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agent Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // TODO: Implement cart functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildCategoryFilter(), _buildFeaturedSection(), _buildNewArrivalsSection(), _buildPopularSection()],
        ),
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(_categories[index]),
              selected: _selectedCategory == _categories[index],
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = _categories[index];
                });
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.all(16), child: Text('Featured Agents', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _featuredAgents.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return _buildAgentCard(_featuredAgents[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAgentCard(Map<String, dynamic> agent) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 120, color: Colors.grey[200], child: const Center(child: Icon(Icons.smart_toy, size: 48))),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(agent['name'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(agent['description'], maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.amber[700]),
                      const SizedBox(width: 4),
                      Text(agent['rating'].toString(), style: const TextStyle(fontSize: 12)),
                      const SizedBox(width: 8),
                      Text('${(agent['downloads'] / 1000).toStringAsFixed(1)}k', style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement purchase functionality
                    },
                    child: Text('\$${agent['price']}'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewArrivalsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.all(16), child: Text('New Arrivals', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return _buildNewArrivalCard();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNewArrivalCard() {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        child: Column(
          children: [
            Container(height: 100, color: Colors.grey[200], child: const Center(child: Icon(Icons.new_releases, size: 32))),
            const Padding(padding: EdgeInsets.all(8), child: Text('New Agent', style: TextStyle(fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.all(16), child: Text('Popular', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return _buildPopularAgentTile();
          },
        ),
      ],
    );
  }

  Widget _buildPopularAgentTile() {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
          child: const Icon(Icons.smart_toy),
        ),
        title: const Text('Popular Agent'),
        subtitle: const Text('Description'),
        trailing: ElevatedButton(
          onPressed: () {
            // TODO: Implement purchase functionality
          },
          child: const Text('\$4.99'),
        ),
      ),
    );
  }
}
