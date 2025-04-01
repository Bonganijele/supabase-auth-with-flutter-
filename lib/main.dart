import 'package:cooklink/auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNmbmVrZnZleG10enN1ZW9tdXl4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM0OTQyMTQsImV4cCI6MjA1OTA3MDIxNH0.Xp8yRH6IivBGJ3DB7-w6zOTDf-SCaviGwmTPHBvH0hY', 
  url: 'https://cfnekfvexmtzsueomuyx.supabase.co');
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      home: AuthGate(),
    );
  }
}
