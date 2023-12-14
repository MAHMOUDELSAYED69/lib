import 'dart:developer';

import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key,  this.userName});
  final String? userName;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  List<String> messageList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey,
          leading: Text(widget.userName ?? "Guest"),
          centerTitle: true,
          title: const Text("Chat")),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      messageList.add(controller.text);
                      log(controller.text);
                      controller.clear();
                      setState(() {});
                    }
                  },
                  icon: const Icon(Icons.send)),
              hintText: "Message",
              border: const OutlineInputBorder()),
        ),
      ),
      body: ListView.builder(
        itemCount: messageList.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: index.isEven ? Colors.green : Colors.grey,
            borderRadius: index.isEven
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                : const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
          ),
          child: Text(messageList[index]),
        ),
      ),
    );
  }
}
