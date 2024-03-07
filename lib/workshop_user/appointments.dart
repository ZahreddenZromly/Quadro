import 'package:flutter/material.dart';

import 'car_status.dart';



class Appointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppointmentsPage();
  }
}

class AppointmentsPage extends StatefulWidget {
  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  List<Appointment> appointments = [
    Appointment(
      date: "2024-02-10",
      time: "10:00 AM",
      serviceRequested: "Oil Change",
      status: AppointmentStatus.pending,
    ),
    Appointment(
      date: "2024-02-15",
      time: "2:00 PM",
      serviceRequested: "Tire Rotation",
      status: AppointmentStatus.pending,
    ),
  ];

  void updateAppointmentStatus(Appointment appointment, AppointmentStatus status) {
    setState(() {
      appointment.status = status;
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => CarStatus(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments',style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
        child: ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: AppointmentCard(
                appointment: appointments[index],
                onUpdateStatus: (status) {
                  updateAppointmentStatus(appointments[index], status);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final Function(AppointmentStatus) onUpdateStatus;

  AppointmentCard({required this.appointment, required this.onUpdateStatus});

  @override
  Widget build(BuildContext context) {
    String statusText = appointment.status.toString().split('.').last;
    Color statusColor = Colors.black; // Default color
    if (appointment.status == AppointmentStatus.confirmed) {
      statusColor = Colors.green; // Change color for confirmed status
    } else if (appointment.status == AppointmentStatus.rejected) {
      statusColor = Colors.red; // Change color for rejected status
    }
    return Card(
      elevation: 10,
      child: ListTile(
        title: Text("Date: ${appointment.date}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text("Time: ${appointment.time}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
            SizedBox(height: 10,),
            Text("Service Requested: ${appointment.serviceRequested}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
            SizedBox(height: 10,),
            Text("Status: $statusText",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: statusColor)),
          ],
        ),
        trailing: appointment.status == AppointmentStatus.pending
            ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.check,color: Colors.green,size: 30),
              onPressed: () {
                onUpdateStatus(AppointmentStatus.confirmed);
              },
            ),
            IconButton(
              icon: Icon(Icons.close,color: Colors.red,size: 30),
              onPressed: () {
                onUpdateStatus(AppointmentStatus.rejected);
              },
            ),
          ],
        )
            : null,
      ),
    );
  }
}

class Appointment {
  final String date;
  final String time;
  final String serviceRequested;
  AppointmentStatus status;

  Appointment({
    required this.date,
    required this.time,
    required this.serviceRequested,
    required this.status,
  });
}

enum AppointmentStatus { pending, confirmed, rejected }
