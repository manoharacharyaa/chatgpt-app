import 'package:flutter/material.dart';
import 'package:sakecbot/api/api_services.dart';
import 'package:sakecbot/dry/chat_model.dart';
import 'package:sakecbot/dry/pallete.dart';
import 'chat_msg_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late bool isLoading;
  TextEditingController textController = TextEditingController();
  final scrollController = ScrollController();
  final List<ChatMessage> messages = [];

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('AI-CHAT'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: isLoading,
            child: LinearProgressIndicator(
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              buildInputs(),
              buildSubmit(),
            ],
          ),
        ],
      ),
    );
  }

  Expanded buildInputs() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Pallete.themeColor,
          ),
          child: TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: textController,
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
      ),
    );
  }

  Widget buildSubmit() {
    return Visibility(
      visible: !isLoading,
      child: Container(
        child: IconButton(
          icon: Icon(
            Icons.send,
            size: 30,
            color: Colors.deepPurpleAccent,
          ),
          onPressed: () {
            setState(() {
              //user input
              messages.add(
                ChatMessage(
                  text: textController.text, type: ChatMessageType.user));
              
              isLoading = true;
            });
            var input = textController.text;
            textController.clear();
            Future.delayed(Duration(milliseconds: 50))
                .then((value) => scrollDown());
            //api call
            ApiServices.sendMessage(input);
            setState(() {
              isLoading = false;
              messages.add(
                ChatMessage(
                  text: input,
                  type: ChatMessageType.bot,
                ),
              );
            });
            textController.clear();
            Future.delayed(Duration(milliseconds: 50))
                .then((value) => scrollDown());
          },
        ),
      ),
    );
  }

  void scrollDown() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  ListView buildList() {
    return ListView.builder(
      itemCount: messages.length,
      controller: scrollController,
      itemBuilder: (context, index) {
        var message = messages[index];
        return ChatMessageWidget(
          text: message.text,
          chatMessageType: message.type,
        );
      },
    );
  }
}
