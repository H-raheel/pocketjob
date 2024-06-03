import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/providers/userProvider.dart';
import 'package:pocketjob/widgets/back.dart';

class AddSkillsScreen extends ConsumerStatefulWidget {
  const AddSkillsScreen({super.key});

  @override
  _AddSkillsScreenState createState() => _AddSkillsScreenState();
}

class _AddSkillsScreenState extends ConsumerState<AddSkillsScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> _skills = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _skills = ref.read(CurrentUserProvider)?.skills ?? [];
  }

  void _addSkill() {
    final skill = _controller.text.trim();
    if (skill.isNotEmpty && !_skills.contains(skill)) {
      setState(() {
        _skills.add(skill);
      });
      _controller.clear();
    }
  }

  void _removeSkill(String skill) {
    setState(() {
      _skills.remove(skill);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: Back(
          context: context,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.done,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              ref.read(CurrentUserProvider.notifier).updateList(_skills);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.secondary,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  focusColor: Theme.of(context).colorScheme.primary,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  labelText: 'Enter your skills',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _addSkill,
                  ),
                ),
                onSubmitted: (value) => _addSkill(),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: _skills.length,
                    itemBuilder: (context, index) {
                      final skill = _skills[index];
                      return ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              color: const Color.fromARGB(255, 160, 22, 22)),
                        ),
                        title: Text(skill),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _removeSkill(skill),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      home: AddSkillsScreen(),
    ),
  ));
}
