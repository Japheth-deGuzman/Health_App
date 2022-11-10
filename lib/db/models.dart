class Bmi {
  final int? id;
  final String bmi;
  final String weight;
  final String height;
  final String result;
  final String date;
  Bmi(
      {this.id,
      required this.bmi,
      required this.weight,
      required this.height,
      required this.result,
      required this.date});

  factory Bmi.fromMap(Map<String, dynamic> json) => new Bmi(
        id: json['id'],
        bmi: json['bmi'],
        weight: json['weight'],
        height: json['height'],
        result: json['result'],
        date: json['date'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bmi': bmi,
      'weight': weight,
      'height': height,
      'result': result,
      'date': date,
    };
  }
}

class Exercise {
  final int? id;
  final String exercise;
  final String time;
  final String secs;
  final String level;
  final String date;
  Exercise(
      {this.id,
      required this.exercise,
      required this.time,
      required this.secs,
      required this.level,
      required this.date});

  factory Exercise.fromMap(Map<String, dynamic> json) => new Exercise(
        id: json['id'],
        exercise: json['exercise'],
        time: json['time'],
        secs: json['secs'],
        level: json['level'],
        date: json['date'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'exercise': exercise,
      'time': time,
      'secs': secs,
      'level': level,
      'date': date,
    };
  }
}

class Summary {
  final int? id;
  final String summary;
  Summary(
      {this.id,
      required this.summary});
  factory Summary.fromMap(Map<String, dynamic> json) => new Summary(
        id: json['id'],
        summary: json['summary'],
      );
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'summary': summary,
    };
  }
}

class BP {
  final int? id;
  final String systolic;
  final String diastolic;
  final String result;
  final String date;
  BP(
      {this.id,
      required this.systolic,
      required this.diastolic,
      required this.result,
      required this.date});

  factory BP.fromMap(Map<String, dynamic> json) => new BP(
        id: json['id'],
        systolic: json['systolic'],
        diastolic: json['diastolic'],
        result: json['result'],
        date: json['date'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'systolic': systolic,
      'diastolic': diastolic,
      'result': result,
      'date': date,
    };
  }
}

class Profile {
  final int? id;
  final String name;
  final String age;
  Profile({
    this.id,
    required this.name,
    required this.age,
  });

  factory Profile.fromMap(Map<String, dynamic> json) => new Profile(
        id: json['id'],
        name: json['name'],
        age: json['age'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}

class GAC1 {
  final int? id;
  final String result;
  final String ac1;
  final String date;
  GAC1({this.id, required this.result, required this.ac1, required this.date});

  factory GAC1.fromMap(Map<String, dynamic> json) => new GAC1(
      id: json['id'],
      result: json['result'],
      ac1: json['ac1'],
      date: json['date']);

  Map<String, dynamic> toMap() {
    return {'id': id, 'result': result, 'ac1': ac1, 'date': date};
  }
}

class FBST {
  final int? id;
  final String result;
  final String fbst;
  final String date;
  FBST({this.id, required this.result, required this.fbst, required this.date});

  factory FBST.fromMap(Map<String, dynamic> json) => new FBST(
      id: json['id'],
      result: json['result'],
      fbst: json['fbst'],
      date: json['date']);

  Map<String, dynamic> toMap() {
    return {'id': id, 'result': result, 'fbst': fbst, 'date': date};
  }
}

class GTT {
  final int? id;
  final String result;
  final String gtt;
  final String date;
  GTT({this.id, required this.result, required this.gtt, required this.date});

  factory GTT.fromMap(Map<String, dynamic> json) => new GTT(
      id: json['id'],
      result: json['result'],
      gtt: json['gtt'],
      date: json['date']);

  Map<String, dynamic> toMap() {
    return {'id': id, 'result': result, 'gtt': gtt, 'date': date};
  }
}

class RBST {
  final int? id;
  final String result;
  final String rbst;
  final String date;
  RBST({this.id, required this.result, required this.rbst, required this.date});

  factory RBST.fromMap(Map<String, dynamic> json) => new RBST(
      id: json['id'],
      result: json['result'],
      rbst: json['rbst'],
      date: json['date']);

  Map<String, dynamic> toMap() {
    return {'id': id, 'result': result, 'rbst': rbst, 'date': date};
  }
}
