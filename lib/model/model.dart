class Tournaments {
  String? name;
  String? time;
  String? date;
  String? game;
  String? description;
  String? place;
  String? prize;

  Tournaments({
    required this.name,
    this.time,
    this.date,
    this.game,
    this.description,
    this.place,
    this.prize,
  });

  Tournaments.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = json['time'];
    date = json['date'];
    game = json['game'];
    description = json['description'];
    place = json['place'];
    prize = json['prize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['time'] = this.time;
    data['date'] = this.date;
    data['game'] = this.game;
    data['description'] = this.description;
    data['place'] = this.place;
    data['prize'] = this.prize;
    return data;
  }
}

class Challenges {
  String? name;
  String? date;
  String? game;
  String? prize;
  String? type;

  Challenges({
    required this.name,
    this.date,
    this.game,
    this.prize,
    this.type,
  });

  Challenges.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    date = json['date'];
    game = json['game'];
    prize = json['prize'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['date'] = this.date;
    data['game'] = this.game;
    data['prize'] = this.prize;
    data['type'] = this.type;
    return data;
  }
}

class UsersModel {
  String? account;
  String? password;

  UsersModel({
    required this.account,
    required this.password,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    account = json['account'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account'] = this.account;
    data['password'] = this.password;
    return data;
  }
}
