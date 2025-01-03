import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labtest/student.dart';

class StudentDetailScreen extends StatelessWidget {
  final Student student;

  const StudentDetailScreen({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${student.name}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Roll Number: ${student.rollNumber}'),
            SizedBox(height: 8),
            Text('Age: ${student.age}'),
            SizedBox(height: 8),
            Text('Grade: ${student.grade}'),
            SizedBox(height: 8),
            Text('Address: ${student.address}'),
          ],
        ),
      ),
    );
  }
}