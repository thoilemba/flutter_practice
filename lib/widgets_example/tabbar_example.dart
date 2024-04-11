import 'package:flutter/material.dart';

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  TabBarExampleState createState() => TabBarExampleState();
}

class TabBarExampleState extends State<TabBarExample> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // 2 tabs: Login and Sign Up
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        title: const Text('TabBar Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
              child: Text(
                'Login & Sign Up Using'
              ),
            ),
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Login'),
                Tab(text: 'Sign Up'),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  // Login Tab Content
                  LoginTabContent(),
                  // Sign Up Tab Content
                  SignUpTabContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginTabContent extends StatelessWidget {
  const LoginTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Login Page Content'),
    );
  }
}

class SignUpTabContent extends StatelessWidget {
  const SignUpTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Sign Up Page Content'),
    );
  }
}

