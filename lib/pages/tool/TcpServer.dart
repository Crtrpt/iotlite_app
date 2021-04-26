import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TcpServer extends StatefulWidget {
  @override
  _TcpServernState createState() => _TcpServernState();
}

class _TcpServernState extends State<TcpServer> with SingleTickerProviderStateMixin {
  var config = new Map();
  final List<Tab> myTabs = <Tab>[
    Tab(text: '日志'),
    Tab(text: '客户端列表'),
  ];

  late TabController _tabController;

  TextEditingController hostController = new TextEditingController();

  TextEditingController portController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    getLocalIpAddress().then((value) {
      setState(() {
        config['localIp'] = value;
      });
    });
    config["host"] = "0.0.0.0";
    config["port"] = "5555";
    _tabController = TabController(vsync: this, length: myTabs.length);
    hostController = TextEditingController(text: config["host"]);
    portController = TextEditingController(text: config["port"]);
  }

  static Future<String?> getLocalIpAddress() async {
    final interfaces = await NetworkInterface.list(type: InternetAddressType.IPv4, includeLinkLocal: true);

    try {
      // Try VPN connection first
      NetworkInterface vpnInterface = interfaces.firstWhere((element) => element.name == "tun0");
      return vpnInterface.addresses.first.address;
    } on StateError {
      // Try wlan connection next
      try {
        NetworkInterface interface = interfaces.firstWhere((element) => element.name == "wlan0");
        print("单独IP地址" + interface.addresses.first.address);
        return interface.addresses.first.address;
      } catch (ex) {
        // Try any other connection next
        try {
          NetworkInterface interface = interfaces.firstWhere((element) => !(element.name == "tun0" || element.name == "wlan0"));
          return interface.addresses.first.address;
        } catch (ex) {
          return null;
        }
      }
    }
  }

  var clientlist = [];
  var loglist = [];
  var serverCtx = null;

  toggleServer() {
    if (serverCtx == null) {
      start();
    } else {
      print("关闭服务器");
      serverCtx.close();
      serverCtx = null;
      clientlist = [];
    }
  }

  start() async {
    print("启动服务器 ${config['host']} ${config['port']}");
    Future<ServerSocket> serverFuture = ServerSocket.bind(config["host"], int.parse(config["port"]));
    serverFuture.then((ServerSocket server) {
      serverCtx = server;
      server.listen((Socket socket) {
        print("收到的数据 ${socket.remoteAddress.address} ${socket.remotePort}");
        clientlist.add({
          "host": socket.remoteAddress.address.toString(),
          'port': socket.remotePort,
          "socket": socket,
          "time": DateFormat('yyyy-MM-dd  kk:mm:ss').format(DateTime.now()).toString(),
        });
        setState(() {
          clientlist = clientlist;
        });
        socket.listen((List<int> data) {
          loglist.add({
            "host": socket.remoteAddress.address.toString(),
            'port': socket.remotePort.toString(),
            "content": data.toString(),
            "time": DateFormat('yyyy-MM-dd kk:mm:ss').format(DateTime.now()).toString(),
          });
          print(loglist);
          setState(() {
            loglist = loglist;
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
    serverCtx.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IP:${config["localIp"]}'),
        actions: [
          IconButton(icon: Icon(Icons.data_usage), onPressed: () => {toggleServer()}),
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
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          if (tab.text == '日志') {
            print(loglist.length);
            return Center(
              child: ListView.builder(
                  itemCount: loglist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(loglist[index]['content']),
                      subtitle: Text(clientlist[index]['time'] + " " + clientlist[index]['host'] + " " + clientlist[index]['port'].toString()),
                    );
                  }),
            );
          } else {
            print(clientlist.length);
            return Center(
              child: ListView.builder(
                  itemCount: clientlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () => {
                        //TODO 判断是否连接状态
                        clientlist[index]['socket'].close(),
                      },
                      title: Text(clientlist[index]['host'] + " " + clientlist[index]['port'].toString()),
                      subtitle: Text(clientlist[index]['time']),
                    );
                  }),
            );
          }
        }).toList(),
      ),
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
                        config.putIfAbsent("host", () => hostController.value.text);
                        config.putIfAbsent("port", () => portController.value.text);
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
}
