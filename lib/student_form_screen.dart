import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labtest/student.dart';

class StudentFormScreen extends StatefulWidget {
  @override
  _StudentFormScreenState createState() => _StudentFormScreenState();
}

class _StudentFormScreenState extends State<StudentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _rollNumberController = TextEditingController();
  final _ageController = TextEditingController();
  final _gradeController = TextEditingController();
  final _addressController = TextEditingController();

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
            Icon(Icons.person_add, size: 30),
            SizedBox(width: 10),
            Text(
              'Add New Student',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.purple,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildFormCard(
                  child: Column(
                    children: [
                      _buildFormField(
                        controller: _nameController,
                        label: 'Student Name',
                        icon: Icons.person,
                        validator: (value) => value?.isEmpty ?? true
                            ? 'Please enter student name'
                            : null,
                      ),
                      SizedBox(height: 20),
                      _buildFormField(
                        controller: _rollNumberController,
                        label: 'Roll Number',
                        icon: Icons.numbers,
                        validator: (value) => value?.isEmpty ?? true
                            ? 'Please enter roll number'
                            : null,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                _buildFormCard(
                  child: Column(
                    children: [
                      _buildFormField(
                        controller: _ageController,
                        label: 'Age',
                        icon: Icons.calendar_today,
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                        value?.isEmpty ?? true ? 'Please enter age' : null,
                      ),
                      SizedBox(height: 20),
                      _buildFormField(
                        controller: _gradeController,
                        label: 'Grade',
                        icon: Icons.school,
                        validator: (value) =>
                        value?.isEmpty ?? true ? 'Please enter grade' : null,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                _buildFormCard(
                  child: _buildFormField(
                    controller: _addressController,
                    label: 'Address',
                    icon: Icons.home,
                    maxLines: 3,
                    validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter address' : null,
                  ),
                ),
                SizedBox(height: 24),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormCard({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey[700],
          fontSize: 16,
        ),
        prefixIcon: Container(
          margin: EdgeInsets.only(right: 8),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.purple.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Colors.purple,
            size: 24,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.purple,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
      ),
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final student = Student(
              name: _nameController.text,
              rollNumber: _rollNumberController.text,
              age: int.parse(_ageController.text),
              grade: _gradeController.text,
              address: _addressController.text,
              cardColor: cardColors[DateTime.now().microsecond % cardColors.length],
            );
            Navigator.pop(context, student);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white60,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.save, size: 24),
            SizedBox(width: 8),
            Text(
              'Save Student',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}