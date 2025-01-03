import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labtest/student.dart';
import 'package:labtest/student_detail_screen.dart';
import 'package:labtest/student_form_screen.dart';

class StudentListScreen extends StatefulWidget {
  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  List<Student> students = [];

  final List<Color> cardColors = [
    const Color(0xFFFFE0E0),
    const Color(0xFFE0F4FF),
    const Color(0xFFE0FFE3),
    const Color(0xFFFFF4E0),
    const Color(0xFFF4E0FF),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.school, size: 30),
            SizedBox(width: 10),
            Text('My Classmates',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                )
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.purple,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30)
            )
        ),
      ),
      body: students.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
                Icons.group_outlined,
                size: 100,
                color: Colors.grey
            ),
            SizedBox(height: 20),
            Text(
              'No Students Yet!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Tap the + button to add new friends',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600]
              ),
            ),
          ],
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentDetailScreen(student: student),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: cardColors[index % cardColors.length],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Text(
                      student.name[0].toUpperCase(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Grade ${student.grade}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Roll No: ${student.rollNumber}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8),
        child: FloatingActionButton(
          onPressed: () async {
            final student = await Navigator.push<Student>(
              context,
              MaterialPageRoute(builder: (context) => StudentFormScreen()),
            );
            if (student != null) {
              setState(() {
                students.add(student);
              });
            }
          },
          backgroundColor: Colors.transparent,
          elevation: 8,
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.purple,
                  Colors.purpleAccent,
                ],
              ),
            ),
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}