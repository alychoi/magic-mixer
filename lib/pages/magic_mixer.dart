import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/pages/openai_repository.dart';
import 'chatmodel.dart';
import 'package:provider/provider.dart';

class MagicMixer extends StatefulWidget {
  const MagicMixer({Key? key}) : super(key: key);

  @override
  State<MagicMixer> createState() => _MagicMixerState();
}

class _MagicMixerState extends State<MagicMixer> {

  final TextEditingController _controller = TextEditingController();
  Map<String, dynamic> response = {};
  String text = "";
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatModel()),
      ],
      child: Consumer<ChatModel>(builder: (context, model, child) {
        //_controller.text = model.getText;
        return Center(
          child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 65),
              child: Text(
                "MAGIC MIXER 🪄",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: 340,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xffba53de)
                  )
                ),
                child: const Center(
                  child: Text(
                    "choose a theme",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xfff469a9),
                        fontWeight: FontWeight.w700,
                    )
                  )
                )
              ),
            ),
            SizedBox(
              height: 270,
              width: 355,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 7/5,
                padding: const EdgeInsets.all(10),
                children: [
                  GestureDetector(
                    onTap: () {
                      isSelected1 = true;
                      isSelected2 = false;
                      isSelected3 = false;
                      isSelected4 = false;
                      _controller.text = "";
                      context.read<ChatModel>().sendChat("Create a unique message to a lover under 100 characters.");
                    },
                    child: Container(
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), 
                        color: isSelected1 ? const Color(0xfff469a9) : const Color(0xfffcffd8)
                      ),
                      child: const Center(
                        child: Text(
                          "love",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                          )
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      isSelected1 = false;
                      isSelected2 = true;
                      isSelected3 = false;
                      isSelected4 = false;
                      _controller.text = "";
                      context.read<ChatModel>().sendChat("Create a unique message to a friend under 100 characters.");
                    },
                    child: Container(
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), 
                        color: isSelected2 ? const Color(0xffba53de) : const Color(0xfffcffd8)
                      ),
                      child: const Center(
                        child: Text(
                          "friends",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                          )
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      isSelected1 = false;
                      isSelected2 = false;
                      isSelected3 = true;
                      isSelected4 = false;
                      _controller.text = "";
                      context.read<ChatModel>().sendChat("Create a unique message to a someone who needs hope under 100 characters.");
                    },
                    child: Container(
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), 
                        color: isSelected3 ? Color.fromARGB(255, 241, 255, 50) : const Color(0xfffcffd8)
                      ),
                      child: const Center(
                        child: Text(
                          "hope",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                          )
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      isSelected1 = false;
                      isSelected2 = false;
                      isSelected3 = false;
                      isSelected4 = true;
                      _controller.text = "";
                      context.read<ChatModel>().sendChat("Create a random unique message under 100 characters.");
                    },
                    child: Container(
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), 
                        color: isSelected4 ? const Color(0xff88bef5) : const Color(0xfffcffd8)
                      ),
                      child: const Center(
                        child: Text(
                          "random",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                          )
                        )
                      )
                    ),
                  ),
                ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: GestureDetector(
                onTap: () {
                  isSelected1 = false;
                  isSelected2 = false;
                  isSelected3 = false;
                  isSelected4 = false;
                  _controller.text = model.getText;
                  print("TEXTTT 2----" + text);

                  // _controller.value = _controller.value.copyWith(
                  //   text: text,
                  // );
                },
                child: Container(
                  width: 340,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffba53de)
                  ),
                  child: const Center(
                    child: Text(
                    "generate ✨",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      )
                    )
                  )
                ),
              )
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    width: 330,
                    height: 243,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), 
                      color: const Color(0xff88bef5)
                    )
                  ),
                  Positioned(
                    left: -15,
                    top: -15,
                    child: Container(
                      width: 330,
                      height: 243,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), 
                        color: const Color(0xfff469a9)
                      ),
                      child: TextField(
                        enabled: false,
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15.0),
                          hintText: 'Create a positive message!',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          )
                        ),
                        onChanged: (txt) {
                          // print("txt: --" + txt);
                          // context.read<ChatModel>().text = txt;
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ),
                  ),
                    Positioned(
                      right: 25,
                      bottom: 25,
                      child: GestureDetector(
                        child: Container(
                          width: 80,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20), 
                            color: const Color(0xffba53de)
                          ),
                          child: const Center(
                            child: Text(
                            "next →",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              )
                            )
                          )
                        )
                      ),
                    ),
                  ]
                )
              )
            ],
          )
        );
        }
      )
    );
  }
}