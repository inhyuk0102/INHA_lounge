import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class lounge extends StatefulWidget {
  bool isLiked = false;
  Color? status;
  final String LoungeName;
  final String LoungesImg;
  final String loungesPath;
  final String LoungesTime;
  final String LoungesStatus;
  lounge({
    super.key,
    required this.LoungeName,
    required this.LoungesImg,
    required this.loungesPath,
    required this.LoungesTime,
    required this.LoungesStatus,
  });
  @override
  State<lounge> createState() => _loungeState();
}

class _loungeState extends State<lounge> {
  onheartTap() {
    setState(() {
      widget.isLiked = !widget.isLiked;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.LoungesStatus == "원활") {
      widget.status = Colors.green;
    } else if (widget.LoungesStatus == "보통") {
      widget.status = Colors.amber;
    } else {
      widget.status = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(50),
          ),
          height: 150,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.LoungesImg,
                        headers: {
                          "User-Agent":
                              "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                        },
                      ), // 이미지 URL
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.LoungeName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 20),
                              ),
                              IconButton(
                                  onPressed: onheartTap,
                                  icon: Icon(widget.isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_outline_outlined))
                            ],
                          ),
                          Text(widget.loungesPath),
                          Text(widget.LoungesTime),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.people_alt_rounded,
                                color: widget.status,
                              ),
                              Text(
                                widget.LoungesStatus,
                                style: TextStyle(color: widget.status),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
