import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myanmarname/myanmar_name_converter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

const Color primary = Color(0xFF087F5B);
const Color darkGreen = Color(0xFF075B43);
const Color backgroundColor = Color(0xFFF5F8F6);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Myanmar Name Converter',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: darkGreen,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ================= HOME PAGE =================

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool myanmarInput = true;

  final TextEditingController controller =
      TextEditingController();

  String result = '';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              const SizedBox(height: 25),
              welcomeCard(),
              const SizedBox(height: 25),
              languageSelector(),
              const SizedBox(height: 25),
              inputSection(),
              const SizedBox(height: 25),
              resultSection(),
              const SizedBox(height: 25),
              information(),
            ],
          ),
        ),
      ),
    );
  }

  // HEADER

  Widget header() {
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Myanmar Name',
                style: TextStyle(
                  fontSize: 19,
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
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AboutPage(),
              ),
            );
          },
          icon: const Icon(
            Icons.info_outline_rounded,
            color: primary,
            size: 28,
          ),
          tooltip: 'About',
        ),
      ],
    );
  }

  // WELCOME CARD

  Widget welcomeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF16A875), darkGreen],
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
            'မြန်မာနာမည်များကို အင်္ဂလိပ်အမည်သို့ '
            'လွယ်ကူစွာ ပြောင်းလဲလိုက်ပါ။',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 13,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }

  // LANGUAGE SELECTOR

  Widget languageSelector() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE4ECE7),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: languageButton(
              'မြန်မာ',
              'Myanmar',
              myanmarInput,
              () => toggleSwitch(true),
            ),
          ),
          GestureDetector(
            onTap: () => toggleSwitch(!myanmarInput),
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
            child: languageButton(
              'English',
              'English',
              !myanmarInput,
              () => toggleSwitch(false),
            ),
          ),
        ],
      ),
    );
  }

  Widget languageButton(
    String title,
    String subtitle,
    bool selected,
    VoidCallback onTap,
  ) {
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

  // INPUT SECTION

  Widget inputSection() {
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
            border: Border.all(
              color: const Color(0xFFE4ECE7),
            ),
          ),
          child: Column(
            children: [
              TextField(
                controller: controller,
                maxLines: 3,
                minLines: 2,
                textCapitalization:
                    TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: myanmarInput
                      ? 'မြန်မာနာမည် ရိုက်ထည့်ပါ...'
                      : 'Enter English Name...',
                  hintStyle: const TextStyle(
                    color: Colors.black38,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                    Icons.edit_rounded,
                    color: primary,
                  ),
                ),
                onChanged: convert,
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
                  if (controller.text.isNotEmpty)
                    GestureDetector(
                      onTap: clearText,
                      child: Row(
                        children: const [
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

  // RESULT SECTION

  Widget resultSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
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
          constraints: const BoxConstraints(
            minHeight: 145,
          ),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFDCEBE1),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                myanmarInput
                    ? 'ENGLISH NAME'
                    : 'MYANMAR NAME',
                style: const TextStyle(
                  color: primary,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 18),
              if (result.isEmpty)
                Center(
                  child: Column(
                    children: const [
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
                    onPressed: copyResult,
                    icon: const Icon(
                      Icons.copy_rounded,
                      size: 17,
                    ),
                    label: const Text('Copy Result'),
                    style: TextButton.styleFrom(
                      primary: primary,
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

  // INFORMATION

  Widget information() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F4ED),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
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

  // CONVERSION FUNCTIONS

  void toggleSwitch(bool value) {
    setState(() {
      myanmarInput = value;
      controller.clear();
      result = '';
    });
  }

  void clearText() {
    setState(() {
      controller.clear();
      result = '';
    });
  }

  void convert(String text) {
    if (text.trim().isEmpty) {
      setState(() {
        result = '';
      });
      return;
    }

    bool isEnglish =
        RegExp(r'^[a-zA-Z]').hasMatch(text.trim());

    setState(() {
      myanmarInput = !isEnglish;

      result = myanmarInput
          ? MyanmarNameConverter.mm2en(text)
          : MyanmarNameConverter.en2mm(text);
    });
  }

  void copyResult() {
    if (result.isEmpty) return;

    Clipboard.setData(
      ClipboardData(text: result),
    );

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

// ================= ABOUT PAGE =================

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 15),

            // APP LOGO

            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF32C58B),
                    darkGreen,
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: primary.withOpacity(0.2),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(
                Icons.translate_rounded,
                color: Colors.white,
                size: 58,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Myanmar Name Converter',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF183D31),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Myanmar to English • English to Myanmar',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 25),

            // DESCRIPTION

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFE3F4EB),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'မြန်မာနာမည်များကို အင်္ဂလိပ်အမည်သို့ '
                'လွယ်ကူလျင်မြန်စွာ ပြောင်းလဲအသုံးပြုနိုင်သော '
                'ဆော့ဝဲတစ်ခုဖြစ်ပါသည်။',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.8,
                  color: darkGreen,
                ),
              ),
            ),

            const SizedBox(height: 22),

            // ABOUT APP

            aboutCard(
              icon: Icons.info_outline_rounded,
              title: 'About This App',
              content:
                  'Myanmar Name Converter သည် မြန်မာဘာသာမှ '
                  'အင်္ဂလိပ်ဘာသာသို့လည်းကောင်း၊ '
                  'အင်္ဂလိပ်ဘာသာမှ မြန်မာဘာသာသို့လည်းကောင်း '
                  'အမည်များကို ပြောင်းလဲပေးနိုင်သော '
                  'အသုံးဝင်သည့် Application ဖြစ်ပါသည်။',
            ),

            const SizedBox(height: 16),

            // DEVELOPER

            aboutCard(
              icon: Icons.person_outline_rounded,
              title: 'Software Developer',
              content: 'Ye Min Tun',
            ),

            const SizedBox(height: 16),

            // CONTACT

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3F4EB),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.phone_rounded,
                      color: primary,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '09974419102',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: darkGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(
                        const ClipboardData(
                          text: '09974419102',
                        ),
                      );

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Phone number copied!',
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.copy_rounded,
                      color: primary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Icon(
              Icons.favorite_rounded,
              color: primary,
              size: 30,
            ),

            const SizedBox(height: 10),

            const Text(
              'Thank you for using',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Myanmar Name Converter',
              style: TextStyle(
                fontSize: 17,
                color: darkGreen,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            const Divider(),

            const Text(
              '© 2026 Ye Min Tun. All rights reserved.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black45,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ABOUT INFORMATION CARD

  static Widget aboutCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: primary,
                size: 25,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: darkGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              height: 1.7,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
