class Repository {
  int id;
  String name;
  int forks;
  int watchers;
  int openIssues;

  Repository({this.id, this.forks, this.name, this.watchers, this.openIssues});

  Repository.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    forks = json['forks'];
    watchers = json['watchers'];
    openIssues = json['open_issues'];
  }
}
