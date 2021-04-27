import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iotlite/utils/networkUtils.dart';

class TcpServer extends StatefulWidget {
  @override
  _TcpServernState createState() => _TcpServernState();
}

class _TcpServernState extends State<TcpServer> with SingleTickerProviderStateMixin {
  var config = new Map();

  late TabController _tabController;

  TextEditingController hostController = new TextEditingController();

  TextEditingController portController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    NetworkUtils.getLocalIpAddress().then((value) {
      setState(() {
        config['localIp'] = value;
      });
    });
    config["host"] = "0.0.0.0";
    config["port"] = "5555";
    _tabController = TabController(vsync: this, length: 2);
    hostController = TextEditingController(text: config["host"]);
    portController = TextEditingController(text: config["port"]);
  }

  var clientlist = [];
  var loglist = [];
  var serverCtx = null;

  toggleServer() {
    if (serverCtx == null) {
      start();
    } else {
      print("关闭服务器");

      closeAll();

      setState(() {
        serverCtx = null;
        clientlist = [];
        loglist = [];
      });
    }
  }

  start() async {
    print("启动服务器 ${config['host']} ${config['port']}");
    Future<ServerSocket> serverFuture = ServerSocket.bind(config["host"], int.parse(config["port"]));
    serverFuture.then((ServerSocket server) {
      setState(() {
        serverCtx = server;
      });
      server.listen((Socket socket) {
        print("收到的数据 ${socket.remoteAddress.address} ${socket.remotePort}");
        var list = [];
        list.add({
          "host": socket.remoteAddress.address.toString(),
          'port': socket.remotePort,
          "socket": socket,
          "connect": true,
          "time": DateFormat('yyyy-MM-dd  kk:mm:ss').format(DateTime.now()).toString(),
        });
        list.addAll(clientlist);
        setState(() {
          clientlist = list;
        });
        socket.listen((List<int> data) {
          var list = [];
          list.add({
            "host": socket.remoteAddress.address.toString(),
            'port': socket.remotePort.toString(),
            "content": data.toString(),
            "time": DateFormat('yyyy-MM-dd kk:mm:ss').format(DateTime.now()).toString(),
          });
          list.addAll(loglist);
          print(loglist);
          setState(() {
            loglist = list;
          });
          socket.write(data);
          print(data);
        });
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    hostController.dispose();
    portController.dispose();
    closeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {this.toggleServer()},
        backgroundColor: serverCtx == null ? Colors.red : Colors.green,
        child: Text(serverCtx == null ? "启动" : "关闭"),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text('IP:${config["localIp"]}:${config["port"]}'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.adjust,
                color: serverCtx == null ? Colors.red : Colors.green,
              ),
              onPressed: () => {toggleServer()}),
          PopupMenuButton<int>(
            onSelected: (i) => _itemSelected(i),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(
                value: 1,
                child: Text('设置'),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text('清空日志'),
              ),
              const PopupMenuItem<int>(
                value: 3,
                child: Text('断开全部客户端'),
              ),
            ],
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: <Tab>[
            Tab(text: '日志(${loglist.length})'),
            Tab(text: '客户端(${clientlist.length})'),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        Center(
          child: ListView.builder(
              itemCount: loglist.length,
              itemBuilder: (BuildContext context, int index) {
                print(index);
                return ListTile(
                  title: Text(loglist[index]['content']),
                  subtitle: Text(loglist[index]['host'] + ":" + loglist[index]['port'].toString() + " " + loglist[index]['time']),
                );
              }),
        ),
        Center(
          child: ListView.builder(
              itemCount: clientlist.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () => {
                    //TODO 判断是否连接状态
                    clientlist[index]["connect"] = false,
                    clientlist[index]['socket'].close(),
                    this.setState(() {}),
                  },
                  tileColor: clientlist[index]["connect"] ? Colors.green : Colors.red,
                  title: Text(clientlist[index]['host'] + " " + clientlist[index]['port'].toString()),
                  subtitle: Text(clientlist[index]['time']),
                );
              }),
        ),
      ]),
    );
  }

  _itemSelected(int i) {
    switch (i) {
      case 1:
        showDialog(
            context: context,
            builder: (_) => new AlertDialog(
                  title: new Text("服务器设置"),
                  content: SizedBox(
                    width: 200,
                    height: 200,
                    child: ListView(padding: EdgeInsets.zero, children: <Widget>[
                      TextField(
                        controller: hostController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '监听ip地址',
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: portController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '端口号',
                        ),
                      ),
                    ]),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('保存'),
                      onPressed: () {
                        config["host"] = hostController.value.text;
                        config["port"] = portController.value.text;
                        closeAll();
                        start();
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: Text('取消'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ));
        break;
      case 2:
        setState(() {
          loglist = [];
        });
        break;
      case 3:
        clientlist.forEach((element) {
          element['socket'].close();
        });
        setState(() {
          clientlist = [];
        });
        break;
    }
  }

  void closeAll() {
    this.clientlist.forEach((s) {
      s['socket'].close();
    });
    clientlist = [];
    this.serverCtx.close();
    serverCtx = null;
  }
}
