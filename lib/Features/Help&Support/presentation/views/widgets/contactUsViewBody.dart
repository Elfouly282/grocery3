import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/contactUs/ContactUs_Cubit.dart';
import '../../cubit/contactUs/ContactUs_states.dart';



class Contactusviewbody extends StatefulWidget {
  const Contactusviewbody({super.key});

  @override
  State<Contactusviewbody> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<Contactusviewbody> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ContactCubit, ContactState>(
        listener: (context, state) {
          if (state is ContactSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Message sent successfully ✅")),
            );

            // 🔥 clear fields
            nameController.clear();
            emailController.clear();
            subjectController.clear();
            messageController.clear();
          }

          if (state is ContactFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is ContactLoading;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Name
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: "Name"),
                      validator: (value) =>
                      value!.isEmpty ? "Enter your name" : null,
                    ),
            
                    const SizedBox(height: 12),
            
                    // Email
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: "Email"),
                      validator: (value) =>
                      value!.isEmpty ? "Enter your email" : null,
                    ),
            
                    const SizedBox(height: 12),
            
                    // Subject
                    TextFormField(
                      controller: subjectController,
                      decoration: const InputDecoration(labelText: "Subject"),
                      validator: (value) =>
                      value!.isEmpty ? "Enter subject" : null,
                    ),
            
                    const SizedBox(height: 12),
            
                    // Message
                    TextFormField(
                      controller: messageController,
                      maxLines: 4,
                      decoration: const InputDecoration(labelText: "Message"),
                      validator: (value) =>
                      value!.isEmpty ? "Enter message" : null,
                    ),
            
                    const SizedBox(height: 20),
            
                    // Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                          if (_formKey.currentState!.validate()) {
                            context.read<ContactCubit>().sendContact(
                              name: nameController.text,
                              email: emailController.text,
                              subject: subjectController.text,
                              message: messageController.text,
                            );
                          }
                        },
                        child: isLoading
                            ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                            : const Text("Send"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

  }
}