class Sample {
  String name;
  int age;
  List<String> hobi;
  Github github;
  List<Article> articles;
  Map<String, Contact> contact;

  Sample(
      {this.name,
      this.age,
      this.hobi,
      this.github,
      this.articles,
      this.contact});

  @override
  String toString() {
    return 'Simple{name: $name, age: $age, hobi: $hobi, github: $github, articles: $articles, contact: $contact}';
  }

  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
        name: json['name'],
        age: json['age'],
        hobi: List<String>.from(json['hobi']),
        github: Github.fromJson(json['github']),
        articles: List<Article>.from(json['articles'].map((articles) {
          return Article.fromJson(articles);
        })),
        contact: Map.from(json['contact']).map((key, contact) {
          return MapEntry(key, Contact.fromJson(contact));
        }));
  }
}

class Github {
  String username;
  int repository;

  Github({this.username, this.repository});

  @override
  String toString() {
    return 'Github{username: $username, repository: $repository}';
  }

  factory Github.fromJson(Map<String, dynamic> json) {
    return Github(username: json['username'], repository: json['repository']);
  }
}

class Article {
  int id;
  String title;
  String subtitle;

  Article({this.id, this.title, this.subtitle});

  @override
  String toString() {
    return 'Article{id: $id, title: $title, subtitle: $subtitle}';
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        id: json['id'], title: json['title'], subtitle: json['subtitle']);
  }
}

class Contact {
  String name;
  String phone;

  Contact({this.name, this.phone});

  @override
  String toString() {
    return 'Contact{name: $name, phone: $phone}';
  }

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(name: json['name'], phone: json['phone']);
  }
}
