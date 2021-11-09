import 'package:bytebank_persistencia/components/progress.dart';
import 'package:bytebank_persistencia/database/app_database.dart';
import 'package:bytebank_persistencia/models/contact.dart';
import 'package:bytebank_persistencia/screens/contact_form.dart';
import 'package:bytebank_persistencia/screens/transaction_form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1))
            .then((value) => findAll()),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            final List<Contact>? contacts = snapshot.data as List<Contact>?;
            return ListView.builder(
              itemBuilder: (context, index) {
                final Contact? contact = contacts?[index];
                return _ContactItem(
                  contact,
                  onClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TransactionForm(contact!),
                      ),
                    );
                  },
                );
              },
              itemCount: contacts?.length,
            );
          }
          return const Progress(
            message: '',
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => const ContactForm(),
            ),
          )
              .then((value) {
            setState(() {});
          });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact? contact;
  final Function onClick;

  const _ContactItem(
    this.contact, {
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(
          contact?.name ?? "",
          style: const TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          contact?.accountNumber.toString() ?? "",
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
