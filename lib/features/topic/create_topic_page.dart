import 'package:finalproject/data/models/card_model.dart';
import 'package:finalproject/data/models/topic_model.dart';
import 'package:finalproject/data/repositories/topic_repo.dart';
import 'package:finalproject/reuseable/constants/strings.dart';
import 'package:finalproject/reuseable/constants/text_styles.dart';
import 'package:finalproject/reuseable/constants/theme.dart';
import 'package:finalproject/reuseable/widgets/card_dialog.dart';
import 'package:finalproject/reuseable/widgets/card_editing.dart';
import 'package:finalproject/reuseable/widgets/single_choice_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateTopicPage extends StatefulWidget {
  const CreateTopicPage({super.key});

  @override
  State<CreateTopicPage> createState() => _CreateTopicPageState();
}

class _CreateTopicPageState extends State<CreateTopicPage> {
  final _topicRepo = TopicRepo();
  List<CardModel> cards = [];
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _termController = TextEditingController();
  final _definitionController = TextEditingController();

  void addCards() {
    if (_termController.text == '' || _definitionController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Add card failed: Term and definition are required!'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      cards.add(CardModel(
          term: _termController.text, definition: _definitionController.text));
      _termController.text = '';
      _definitionController.text = '';
    });
  }

  void finish() async {
    if (_titleController.text == '' && _descriptionController.text == '') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return SingleChoiceDialog(
              title: 'Cannot create topic',
              message: 'Title and description cannot be empty!',
            );
          });
      return;
    }
    if (cards.length < 4) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return SingleChoiceDialog(
              title: 'Cannot create topic',
              message: 'A topic must have at least 4 cards!',
            );
          });
      return;
    }

    final currentUser = FirebaseAuth.instance.currentUser!;
    final newTopic = TopicModel(
        title: _titleController.text,
        description: _descriptionController.text,
        date: DateTime.now(),
        ownerID: currentUser.uid);

    _topicRepo.createTopic(newTopic, cards);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SingleChoiceDialog(
            title: 'Congrats!',
            message: 'Your topic has been created',
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CardDialog(
                  termController: _termController,
                  definitionController: _definitionController,
                  onConfirm: addCards,
                );
              })
        },
        backgroundColor: AppTheme.floatingButton,
        child: Icon(Icons.add),
        shape: CircleBorder(),
      ),
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Text('Create topic', // Title
            style: AppTextStyles.bold20),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings_outlined,
              size: 30,
            ), // Action icon
            onPressed: () {
              // Action when search icon is tapped
            },
            color: Colors.black,
          ),
          IconButton(
            icon: Icon(
              Icons.check,
              size: 40,
            ), // Action icon
            onPressed: () {
              finish();
            },
            color: AppTheme.primaryColor,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text('TITLE', style: AppTextStyles.bold16),
                TextFormField(
                  controller: _titleController,
                  style: AppTextStyles.bold16,
                  cursorColor: AppTheme.primaryColor,
                  decoration: const InputDecoration(
                    hintText: 'Your topic\'s title',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.primaryColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.primaryColor)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'DESCRIPTION',
                  style: AppTextStyles.bold16,
                ),
                TextFormField(
                  controller: _descriptionController,
                  style: AppTextStyles.bold16,
                  cursorColor: AppTheme.primaryColor,
                  decoration: InputDecoration(
                    hintText: 'Write something about your topic',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.primaryColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.primaryColor)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'CARD LIST',
                  style: AppTextStyles.bold16,
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: cards
                      .map((card) => Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: CardEditing(card: card),
                          ))
                      .toList(),
                ),
                //CardEditing(card: CardModel(definition: 'Đoàn Kim Bảng', term: 'Vaynlista'),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}