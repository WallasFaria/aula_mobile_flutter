import 'package:flutter/material.dart';
import 'package:git_app/services/local_storage.dart';
import 'package:git_app/services/repository_service.dart';
import 'package:git_app/user_page.dart';
import 'modes/repository.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final repositoryService = RepositoryService();
  final localStorage = LocalStorage();

  String username = '';
  List<Repository> repositories = [];

  @override
  void initState() {
    super.initState();
    localStorage.getUsename().then((value) {
      setState(() => username = value);
      if (value.isNotEmpty)
        repositoryService.getRepositories(value).then((list) {
          setState(() => repositories = list);
        });
    });
  }

  setUsername(String name) async {
    setState(() => username = name);
    if (name.isNotEmpty)
      repositoryService.getRepositories(name).then((list) {
        setState(() => repositories = list);
      });
    await localStorage.setUsename(username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Git App', style: TextStyle(color: Color(0xFF666666))),
        centerTitle: false,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Color(0xFF666666)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person_pin),
            onPressed: _navigateToUserPage,
          )
        ],
      ),
      body: username.isEmpty
          ? _configureUser()
          : _repositories(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _repositories() {
    return Column(children: [
      Container(
        width: double.infinity,
        color: Colors.grey[200],
        child: Text('Repositorios de : $username'),
        padding: EdgeInsets.all(20),
      ),
      Expanded(
        child: ListView(
            children: List<Widget>.from(repositories.map((r) => listItem(r)))),
      )
    ]);
  }

  Widget _configureUser() {
    return Center(
      child: RaisedButton(
        child: Text('Configurar Usuário'),
        onPressed: _navigateToUserPage,
      ),
    );
  }

  listItem(Repository repository) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(repository.name),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Forks: ${repository.forks}'),
          Text('Watchers: ${repository.watchers}'),
          Text('Open issues: ${repository.openIssues}'),
        ],
      ),
      isThreeLine: true,
    );
  }

  _navigateToUserPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return UserPage(onSave: setUsername);
    }));
  }
}
