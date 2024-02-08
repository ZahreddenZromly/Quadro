
import 'dart:io';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class CarStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaintenancePage();
  }
}

class MaintenancePage extends StatefulWidget {
  @override
  _MaintenancePageState createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {
  // Example data for car status
  String currentStatus = 'In Progress';
  String maintenanceDetails =
      'Oil change and filter replacement. Estimated completion time: 2 hours.';
  List<String> comments = [];
  File? _image;
  double userRating = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Maintenance Tracker'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Summary Section
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Status',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        _buildStatusIndicator(currentStatus),
                        SizedBox(width: 12),
                        Text(
                          currentStatus,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: currentStatus == 'In Progress' ? 0.5 : 1.0,
                      minHeight: 10,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Detailed Information Section
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Detailed Information',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _showAddCommentDialog(context);
                          },
                          child: Text('Add Comment'),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      maintenanceDetails,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 12),
                    Divider(),
                    SizedBox(height: 8),
                    Text(
                      'Comments',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: comments
                          .map((comment) => Text(comment))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                onTap: () {
                  getImage();
                },
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Upload Image',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      _image == null
                          ? Icon(Icons.camera_alt, size: 60, color: Colors.grey)
                          : Image.file(_image!, height: 150),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Update Status Section (for workshop owners)
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Update Status',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    DropdownButton<String>(
                      value: currentStatus,
                      onChanged: (newValue) {
                        setState(() {
                          currentStatus = newValue!;
                          if(newValue == 'Closed') {
                            // Show review dialog when status is closed
                            showReviewDialog(context);
                          }
                        });
                        // Call function to update status in database or backend
                      },
                      items: <String>['In Progress', 'Ready', 'Completed','Closed','Quality Check']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 12),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void showReviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Leave Review and Comment'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rate your experience:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                StarRating(
                  onRatingUpdate: (rating) {
                    setState(() {
                      userRating = rating;
                    });
                  },
                ),
                SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Leave your comments...',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    setState(() {
                    });
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                submitReviewAndComments(context, userRating, comments);
              },
              child: Text('Submit'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
  // Function to build status indicator based on status
  Widget _buildStatusIndicator(String status) {
    Color color;
    IconData icon;
    switch (status) {
      case 'In Progress':
        color = Colors.yellow;
        icon = Icons.hourglass_empty;
        break;
      case 'Ready':
        color = Colors.green;
        icon = Icons.check_circle;
        break;
      case 'Completed':
        color = Colors.blue;
        icon = Icons.done_all;
        break;
      case 'Quality Check':
        color = Colors.orange;
        icon = Icons.assessment;
        break;
      case 'Closed':
        color = Colors.green;
        icon = Icons.check_circle_outline;
        break;
      default:
        color = Colors.grey;
        icon = Icons.error;
    }
    return Icon(
      icon,
      color: color,
      size: 32,
    );
  }
  void submitReviewAndComments(BuildContext context, double rating, List<String> comments) {
    // Assuming you have a method to save the review and comments to your database
    // saveReviewAndCommentsToDatabase(rating, comments);

    // Close the review dialog
    Navigator.of(context).pop();

    // Show a "Thank you" message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thank You'),
          content: Text('Your review has been submitted. Thank you for your feedback!'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the "Thank you" dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Function to show dialog for adding comment
  Future<void> _showAddCommentDialog(BuildContext context) async {
    String newComment = '';
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Comment'),
          content: SingleChildScrollView(
            child: TextField(
              autofocus: true,
              onChanged: (value) {
                newComment = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your comment...',
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  comments.add(newComment);
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Function to handle image selection
  Future getImage() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }
}
class StarRating extends StatelessWidget {
  final ValueChanged<double>? onRatingUpdate;

  const StarRating({Key? key, this.onRatingUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 30.0,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: onRatingUpdate ?? (rating) {}, // Assign an empty function if onRatingUpdate is null
    );
  }
}
