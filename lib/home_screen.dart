import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    Provider.of<ApiProvider>(context, listen: false).getDataWithModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiProvider>(context);
    return Scaffold(
        appBar: AppBar(title: const Text("Provider API"),
        centerTitle: true,
        backgroundColor: Colors.yellow,),
        body: provider.loading? const Center(child: CircularProgressIndicator(),):
            ListView.builder(
                itemCount: provider.mode.data!.length,
                itemBuilder: (context, index){
                  return ListTile(
                    // leading: Text(provider.mode.data![index].avatar.toString()),
                    title: Text(provider.mode.data![index].firstName.toString()),
                    subtitle: Text(provider.mode.data![index].email.toString()),
                  );
                })
    );
  }
}
