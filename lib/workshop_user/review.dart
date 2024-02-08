import 'package:flutter/material.dart';

class ReviewsPage extends StatefulWidget {
  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  final TextEditingController _responseController = TextEditingController();
  Map<int, String> _responses = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Workshop Reviews',
          style: TextStyle(
            fontFamily: 'Montserrat',color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<List<Review>>(
        future: fetchReviews(), // Function to fetch reviews data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No reviews available',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final review = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    elevation: 3.0,
                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      title: Text(
                        review.customerName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5.0),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16.0),
                              SizedBox(width: 5.0),
                              Text(
                                '${review.rating}/5',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            review.comment,
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(height: 5.0),
                          if (_responses.containsKey(index))
                            Text(
                              'Owner Response: ${_responses[index]}',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.green,
                              ),
                            ),
                          SizedBox(height: 5.0),
                          if (!_responses.containsKey(index))
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _responseController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your response',
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _responses[index] = _responseController.text;
                                      _responseController.clear();
                                    });
                                  },
                                  child: Text('Submit'),
                                ),
                              ],
                            ),
                        ],
                      ),
                      onTap: () {
                        // Handle tapping on review (e.g., show full review details)
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _responseController.dispose();
    super.dispose();
  }
}

class Review {
  final String customerName;
  final int rating;
  final String comment;

  Review({
    required this.customerName,
    required this.rating,
    required this.comment,
  });
}

Future<List<Review>> fetchReviews() async {
  // Simulated function to fetch reviews data (replace with actual implementation)
  await Future.delayed(Duration(seconds: 2)); // Simulating delay
  return [
    Review(
      customerName: 'John Doe',
      rating: 4,
      comment: 'Great service! Would recommend.',
    ),
    Review(
      customerName: 'Jane Smith',
      rating: 3,
      comment: 'Service was okay, but could be better.',
    ),
    // Add more reviews here
  ];
}
