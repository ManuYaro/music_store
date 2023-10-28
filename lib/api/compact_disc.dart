//compact disc's model
class CompactDisc {
  //definition of attributes
  final int? id;
  final String? title;
  final String? author;
  final String? album;
  //constructor
  CompactDisc({ this.id, this.title, this.album, this.author});
  // factory constructor
  factory CompactDisc.fromJson(Map<String, dynamic> json) {
    return CompactDisc(
      id: json['id'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
      album: json['album'] as String,
    );
  }
    @override
    String toString() {
      return 'CompactDisc{CompactDisc_id: $id, title: $title, author: $author, album: $album}';
    }
  }