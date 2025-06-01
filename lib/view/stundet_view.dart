import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:student/cubit/student_cubit.dart';
import 'package:student/model/student_model.dart';
import 'package:student/state/student_state.dart';

class StudentView extends StatefulWidget {
  const StudentView({super.key});

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Student Cubit"))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Age",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: "Address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  context.read<StudentCubit>().addStudent(StudentModel(
                      name: nameController.text,
                      age: int.tryParse(ageController.text) ?? 0,
                      address: addressController.text));
                  nameController.clear();
                  ageController.clear();
                  addressController.clear();
                },
                child: const Text("Submit"),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<StudentCubit, StudentState>(
                  builder: (context, state) {
                    if (state.isloading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.lstStudent.isEmpty) {
                      return const Center(child: Text("No students found"));
                    }

                    return ListView.separated(
                      itemCount: state.lstStudent.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final student = state.lstStudent[index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade500),
                          ),
                          child: ListTile(
                            title: Text(student.name),
                            subtitle:
                                Text('${student.age}, ${student.address}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Delete?"),
                                      content: Text(
                                          "Are you sure you want to delete ${student.name}?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            context
                                                .read<StudentCubit>()
                                                .deleteStudent(student);
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Yes"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("No"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
