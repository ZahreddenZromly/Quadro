import 'package:flutter/material.dart';


class WorkshopOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Workshop Overview',style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.teal,
        ),
        body: WorkshopOverview()
    );
  }
}

class WorkshopOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WorkshopStatCard(
            icon: Icons.event,
            label: 'Total Appointments Booked',
            value: '50',
          ),
          SizedBox(height: 20.0),
          WorkshopStatCard(
            icon: Icons.star,
            label: 'Average Rating',
            value: '4.5',
          ),
          SizedBox(height: 20.0),
          WorkshopStatCard(
            icon: Icons.access_time,
            label: 'Current Availability',
            value: 'High',
          ),

        ],
      ),
    );
  }
}

class WorkshopStatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  WorkshopStatCard({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 36.0,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
