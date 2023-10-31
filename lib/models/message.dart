class Message {
  Message({
    required this.id,
    required this.profileId,
    required this.content,
    required this.createdAt,
    required this.isMine,
    required this.isImage,
  });

  final String id;
  final String profileId;
  final String content;
  final DateTime createdAt;
  final bool isMine;
  final bool isImage;

  Message.fromMap({
    required Map<String, dynamic> map,
    required String myUserId,
  })  : id = map['id'],
        profileId = map['profile_id'],
        content = map['content'],
        createdAt = DateTime.parse(map['created_at']),
        isMine = myUserId == map['profile_id'],
        isImage = map['content'].toString().startsWith('image:'); // Example logic
}
