import 'package:flutter/material.dart';

class IdeaState{
  final Color themeColor;
  IdeaState(this.themeColor);
}


IdeaState appReducer(IdeaState state,action){
  return IdeaState(action.themeColor);
}

class RefreshColorAction{
  final Color themeColor;
  RefreshColorAction(this.themeColor);
}