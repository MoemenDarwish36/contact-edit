import 'package:contact_edit/model/contact_data.dart';
import 'package:contact_edit/shared_widget/contact_item.dart';
import 'package:contact_edit/shared_widget/custom_button.dart';
import 'package:contact_edit/shared_widget/custom_field.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  List<ContactData> contactList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: const Text(
          "Contact Screen",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      ///this widget (form) to make validation and send key
      body: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomField(
                  validator: validName,
                  controller: name,
                  hint: 'Enter your name',
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomField(
                  validator: validName,
                  controller: phone,
                  hint: 'Enter your phone',
                  icon: Icons.call,
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                    visible: contactList.length < 3,
                    child: CustomButton(onTap: add)),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: contactList.length,
                      itemBuilder: (context, index) => ContactItem(
                          index: index,
                          onTap: delete,
                          name: contactList[index].name,
                          phone: contactList[index].phone)),
                )
              ],
            ),
          )),
    );
  }

  ///this function to display message to
  /// users if validator is not achieve
  String? validName(String? content) {
    if (content!.isEmpty) {
      return "Please Enter Your Name";
    }
    return null;
  }

  ///this  function to add after i check a valid
  void add() {
    if (_form.currentState!.validate()) {
      setState(() {
        contactList.add(ContactData(phone: phone.text, name: name.text));
        name.clear();
        phone.clear();
      });
    }
  }

  void delete(int index) {
    setState(() {
      contactList.removeAt(index);
    });
  }
}
