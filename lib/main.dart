import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Модель заметки
class Note {
  final String id;
  String title;
  String body;

  Note({required this.id, required this.title, required this.body});

  Note copyWith({String? title, String? body}) => Note(
    id: id,
    title: title ?? this.title,
    body: body ?? this.body,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Здесь могут быть глобальные списки заметок или логика навигации, если потребуется

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // убираем баннер debug
      title: 'Практика 3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const NotesPage(),
    );
  }
}

// Экран списка заметок
class NotesPage extends StatefulWidget {
  const NotesPage({super.key});
  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final List<Note> _notes = [
    Note(id: '1', title: 'Пример', body: 'Это пример заметки'),
  ];

  String _search = '';

  Future<void> _addNote() async {
    final newNote = await Navigator.push<Note>(
      context,
      MaterialPageRoute(builder: (_) => const EditNotePage()),
    );
    if (newNote != null) {
      setState(() => _notes.add(newNote));
    }
  }

  Future<void> _edit(Note note) async {
    final updated = await Navigator.push<Note>(
      context,
      MaterialPageRoute(builder: (_) => EditNotePage(existing: note)),
    );
    if (updated != null) {
      setState(() {
        final i = _notes.indexWhere((n) => n.id == updated.id);
        if (i != -1) _notes[i] = updated;
      });
    }
  }

  void _delete(Note note) {
    setState(() => _notes.removeWhere((n) => n.id == note.id));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Заметка удалена')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _notes
        .where((n) => n.title.toLowerCase().contains(_search))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            hintText: 'Поиск...',
            border: InputBorder.none,
          ),
          onChanged: (value) => setState(() => _search = value.toLowerCase()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: const Icon(Icons.add),
      ),
      body: filtered.isEmpty
          ? const Center(child: Text('Пока нет заметок. Нажмите +'))
          : ListView.builder(
        itemCount: filtered.length,
        itemBuilder: (context, i) {
          final note = filtered[i];
          return Dismissible(
            key: ValueKey(note.id),
            onDismissed: (_) => _delete(note),
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text(note.title.isEmpty ? '(без названия)' : note.title),
              subtitle: Text(
                note.body,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => _edit(note),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () => _delete(note),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Экран редактирования/создания заметки
class EditNotePage extends StatefulWidget {
  final Note? existing;
  const EditNotePage({super.key, this.existing});

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  final _formKey = GlobalKey<FormState>();
  late String _title = widget.existing?.title ?? '';
  late String _body = widget.existing?.body ?? '';

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    final result = (widget.existing == null)
        ? Note(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _title,
      body: _body,
    )
        : widget.existing!.copyWith(title: _title, body: _body);
    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.existing != null;
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Редактировать' : 'Новая заметка')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: const InputDecoration(labelText: 'Заголовок'),
                onSaved: (v) => _title = v!.trim(),
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: _body,
                decoration: const InputDecoration(labelText: 'Текст'),
                minLines: 3,
                maxLines: 6,
                onSaved: (v) => _body = v!.trim(),
                validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Введите текст заметки' : null,
              ),
              const Spacer(),
              FilledButton.icon(
                onPressed: _save,
                icon: const Icon(Icons.check),
                label: const Text('Сохранить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Практика 3"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Добро пожаловать в Flutter!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Кнопка нажата!")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6200EE), // кастомный цвет
              ),
              child: const Text(
                "Нажми меня",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: 150,
              height: 100,
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text(
                "Контейнер",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.star, color: Colors.orange, size: 40),
                SizedBox(width: 20),
                Icon(Icons.favorite, color: Colors.red, size: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

