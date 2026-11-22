
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myanmarname/myanmar_name_converter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Myanmar Name Converter',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F8F6),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087F5B),
        ),
        fontFamily: null,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _myanmarInput = true;

  final TextEditingController tec = TextEditingController();

  String result = '';

  static const Color primary = Color(0xFF087F5B);
  static const Color darkGreen = Color(0xFF075B43);

  @override
  void dispose() {
    tec.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              const SizedBox(height: 30),
              _welcomeCard(),
              const SizedBox(height: 25),
              _languageSelector(),
              const SizedBox(height: 22),
              _inputSection(),
              const SizedBox(height: 22),
              _resultSection(),
              const SizedBox(height: 25),
              _information(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(
            Icons.translate_rounded,
            color: Colors.white,
            size: 27,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Myanmar Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF183D31),
                ),
              ),
              Text(
                'Name Converter',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFE0F2E9),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Row(
            children: [
              Icon(Icons.check_circle, color: primary, size: 15),
              SizedBox(width: 5),
              Text(
                'Ready',
                style: TextStyle(
                  color: primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _welcomeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [primary, darkGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(23),
        boxShadow: [
          BoxShadow(
            color: primary.withOpacity(0.20),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.auto_awesome_rounded,
            color: Color(0xFFFFE69A),
            size: 30,
          ),
          const SizedBox(height: 13),
          const Text(
            'Myanmar Name Converter',
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'မြန်မာနာမည်များကို အင်္ဂလိပ်အမည်သို့ လွယ်ကူစွာ ပြောင်းလဲလိုက်ပါ။',
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontSize: 13,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _languageSelector() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE4ECE7)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _languageButton(
              title: 'မြန်မာ',
              subtitle: 'Myanmar',
              selected: _myanmarInput,
              onTap: () => _toggleSwitch(true),
            ),
          ),
          GestureDetector(
            onTap: () => _toggleSwitch(!_myanmarInput),
            child: Container(
              width: 43,
              height: 43,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.swap_horiz_rounded,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
          Expanded(
            child: _languageButton(
              title: 'English',
              subtitle: 'English',
              selected: !_myanmarInput,
              onTap: () => _toggleSwitch(false),
            ),
          ),
        ],
      ),
    );
  }

  Widget _languageButton({
    required String title,
    required String subtitle,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFE5F4EB)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: selected ? primary : Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              subtitle,
              style: TextStyle(
                color: selected ? primary : Colors.black38,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Enter Your Name',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF183D31),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: const Color(0xFFE4ECE7)),
          ),
          child: Column(
            children: [
              TextField(
                controller: tec,
                maxLines: 3,
                minLines: 2,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: _myanmarInput
                      ? 'မြန်မာနာမည် ရိုက်ထည့်ပါ...'
                      : 'Enter English Name...',
                  hintStyle: const TextStyle(
                    color: Colors.black38,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.edit_rounded,
                      color: primary,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 30,
                    minHeight: 30,
                  ),
                ),
                onChanged: _convert,
              ),
              const Divider(height: 20),
              Row(
                children: [
                  const Icon(
                    Icons.keyboard_alt_outlined,
                    color: Colors.black38,
                    size: 17,
                  ),
                  const SizedBox(width: 7),
                  const Expanded(
                    child: Text(
                      'Type your name here',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  if (tec.text.isNotEmpty)
                    GestureDetector(
                      onTap: _clear,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.delete_outline,
                            size: 17,
                            color: Colors.redAccent,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Clear',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _resultSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(
              Icons.auto_awesome,
              color: primary,
              size: 19,
            ),
            SizedBox(width: 8),
            Text(
              'Conversion Result',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xFF183D31),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 145),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFDCEBE1),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.025),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _myanmarInput ? 'ENGLISH NAME' : 'MYANMAR NAME',
                style: const TextStyle(
                  color: primary,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 18),
              if (result.isEmpty)
                const Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.text_fields_rounded,
                        size: 35,
                        color: Color(0xFFCAD9D0),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Your result will appear here',
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )
              else
                SelectableText(
                  result,
                  style: const TextStyle(
                    color: Color(0xFF183D31),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
              if (result.isNotEmpty) ...[
                const SizedBox(height: 18),
                const Divider(),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: _copyResult,
                    icon: const Icon(
                      Icons.copy_rounded,
                      size: 17,
                    ),
                    label: const Text('Copy Result'),
                    style: TextButton.styleFrom(
                      foregroundColor: primary,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _information() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F4ED),
        borderRadius: BorderRadius.circular(17),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: primary,
            size: 21,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'အသုံးပြုနည်း - အမည်ကို ရိုက်ထည့်ပါ။ '
              'အလိုအလျောက် ဘာသာပြောင်းပေးပါမည်။ '
              'ဘာသာပြောင်းရန် အလယ်ရှိ ခလုတ်ကို နှိပ်ပါ။',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF356B53),
                height: 1.7,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleSwitch(bool status) {
    setState(() {
      _myanmarInput = status;
      result = '';
      tec.clear();
    });
  }

  void _clear() {
    setState(() {
      tec.clear();
      result = '';
    });
  }

  void _convert(String text) {
    if (text.isEmpty) {
      setState(() {
        result = '';
      });
      return;
    }

    bool isEnglish = checkEnglish(text);

    setState(() {
      _myanmarInput = !isEnglish;

      result = _myanmarInput
          ? MyanmarNameConverter.mm2en(text)
          : MyanmarNameConverter.en2mm(text);
    });
  }

  bool checkEnglish(String input) {
    RegExp regex = RegExp(r'^[a-zA-Z]');
    return regex.hasMatch(input);
  }

  void _copyResult() {
    if (result.isEmpty) return;

    Clipboard.setData(ClipboardData(text: result));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied successfully!'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: primary,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:myanmarname/myanmar_name_converter.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // showSemanticsDebugger: false,
      title: 'Myanmar Name',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _myanmarInput = true;
  TextEditingController tec = TextEditingController();
  String result = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Myanmar Name"),
      ),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget(){
    return Column(
      children: [
        // indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Expanded(
                child: Text(_myanmarInput ? "Myanmar" : "English", textAlign: TextAlign.end,)
            ),

            Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(8.0)
                ),
                child: TextButton(onPressed: (){ _toggleSwitch(!_myanmarInput); }, child: Icon(Icons.arrow_forward_ios, color: Colors.green,))),


            Expanded(child: Text(_myanmarInput ? "English" : "Myanmar")),
            /*
            Switch(
              value: _myanmarInput,
              inactiveTrackColor: Colors.greenAccent,
              inactiveThumbColor: Colors.green,
              onChanged: (value) {
                _toggleSwitch(value);
              },
            ),
            */
            // Text('English'),
          ],
        ),
        // result
        result.isEmpty ? Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            child: Text("Enter English Name / မြန်မာ နာမည် ရိုက်ထည့်ပါ", style: TextStyle(color: Colors.black26),)) :
        Container(
          padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: Text(result, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),)
        ),
        // _switchValue ? Text("Enter Myanmar") : Text("Enter English"),
        SizedBox(height: 8.0,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: tec,
            // textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: _myanmarInput ? "Enter Myanmar" : "Enter English",
              label:  _myanmarInput ? Text("Enter Myanmar") : Text("Enter English"),
            ),
            onChanged: (String? text){
              _convert(text: text ?? "");
            },

          ),
        )
      ],
    );
  }

  void _toggleSwitch(bool status){
    setState(() {
      // clear
      result = "";
      tec.clear();
      _myanmarInput = status;
    });
  }

  void _convert({required String text}){
    // check mode and text is match

    print(checkEnglish(text));
    print("_myanmar is $_myanmarInput");

    if(text.isNotEmpty){
      if(checkEnglish(text[0])){
        // user type english
        if(_myanmarInput == true ){
          // we're expection myanmar
          // so change
          setState(() {
            _myanmarInput = false;
          });
        }
      }
      else{
        if(_myanmarInput == false){
          // မြန်မာစာ လက်မခံဘူးဆိုပေမယ့် မြန်မာစာတွေ ရိုက်နေတယ်။
          setState(() {
            _myanmarInput = true;
          });
        }
      }
    }

    print("_myanmar is $_myanmarInput");


    setState(() {
      result = _myanmarInput ?   MyanmarNameConverter.mm2en(text) : MyanmarNameConverter.en2mm(text);
    });
  }

  bool checkEnglish(String input) {
    RegExp regex = RegExp(r'^[a-zA-Z]');
    return regex.hasMatch(input);
  }
}
