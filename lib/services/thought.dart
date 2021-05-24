class Thought {
  final String id;
  final String content;
  final String name;
  final String user_id;

  Thought(this.id, this.content, this.name, this.user_id);

  Thought.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        content = json['content'],
        name = json['name'],
        user_id = json['user_id'];
}
