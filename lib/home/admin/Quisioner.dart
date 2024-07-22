import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuisonersPage extends StatefulWidget {
  const QuisonersPage({super.key});

  @override
  _QuisonersPageState createState() => _QuisonersPageState();
}

class _QuisonersPageState extends State<QuisonersPage> {
  List<DocumentSnapshot> questions = [];
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _bobotController = TextEditingController();
  bool _isEditing = false;
  String? currentQuestionId;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('quisioners').get();

    setState(() {
      questions = querySnapshot.docs; // Store all questions
    });
  }

  Future<void> _updateQuestion(String questionId) async {
    await FirebaseFirestore.instance
        .collection('quisioners')
        .doc(questionId)
        .update({
      'question': _questionController.text,
      'bobot': _bobotController.text,
    });
    setState(() {
      _isEditing = false; // Exit editing mode
      currentQuestionId = null; // Clear current question ID
      _questionController.clear(); // Clear the text field
      _bobotController.clear(); // Clear the bobot field
    });
    _loadQuestions(); // Refresh questions list
  }

  void _startEditing(
      String questionId, String currentQuestion, String currentBobot) {
    setState(() {
      _isEditing = true;
      currentQuestionId = questionId;
      _questionController.text = currentQuestion; // Set question for editing
      _bobotController.text = currentBobot; // Set bobot for editing
    });
  }

  Future<void> _deleteQuestion(String questionId) async {
    await FirebaseFirestore.instance
        .collection('quisioners')
        .doc(questionId)
        .delete();
    _loadQuestions(); // Refresh questions list after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: const Color(0xFFF2F9F1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.black),
          ),
          child: const Center(
            child: Text(
              'Quisoners of Skin Cancer\n(Gejala Kanker Kulit)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'LeagueSpartan',
                color: Color(0xFF5C715E),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              var questionData = questions[index];
              return Card(
                color: const Color(0xFFF2F9F1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        questionData['question'] ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        'Bobot: ${questionData['bobot'] ?? ''}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit,
                                color: Color(0xFF5C715E)),
                            onPressed: () {
                              _startEditing(
                                questionData.id,
                                questionData['question'],
                                questionData['bobot'],
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete,
                                color: Color(0xFF5C715E)),
                            onPressed: () {
                              _deleteQuestion(questionData.id);
                            },
                          ),
                        ],
                      ),
                      if (_isEditing && currentQuestionId == questionData.id)
                        Column(
                          children: [
                            TextField(
                              controller: _questionController,
                              maxLines: null,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Edit Quisoners...',
                              ),
                            ),
                            TextField(
                              controller: _bobotController,
                              maxLines: null,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Edit bobot...',
                              ),
                            ),
                            ElevatedButton(
                              child: const Text('Save'),
                              onPressed: () => _updateQuestion(questionData.id),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
