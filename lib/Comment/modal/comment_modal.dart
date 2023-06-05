class Comments {
  int? total, skip, limit;
  List<Commment>? CommentList;

  Comments({this.total, this.limit, this.skip, this.CommentList});

  factory Comments.fromjson(Map m1) {
    List list = m1['products'];
    List<Commment> items = list.map((e) => Commment.fromjson(e)).toList();

    return Comments(
        skip: m1['id'],
        limit: m1['date'],
        total: m1['userId'],
        CommentList: items);
  }
}

class Commment {
  int? id, postId;
  String? body;
  UserModal? userModal;

  Commment({this.id, this.body, this.postId, this.userModal});

  factory Commment.fromjson(Map m1) {
    return Commment(
        id: m1['id'],
        body: m1['body'],
        postId: m1['postId'],
        userModal: UserModal.fromjson(m1['userModal']));
  }
}

class UserModal {
  int? id;
  String? username;

  UserModal({this.id, this.username});

  factory UserModal.fromjson(Map m1) {
    return UserModal(id: m1['id'], username: m1['username']);
  }
}
