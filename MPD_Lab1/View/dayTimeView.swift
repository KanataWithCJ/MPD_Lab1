//
//  dayTimeView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/22.
//

import SwiftUI

struct dayTimeView:View{
    let timeName:String
    var dFont:Font = .body
    var buttonColor:Color
    var textColor:Color = .gray
    var showTime:Bool = true
    @ObservedObject var inputItemList:MyInputItemViewModel
//    @State var inputList:[inputItemEntity] = []
    var body: some View{
        VStack(alignment:.leading){
            Text(timeName).foregroundColor(textColor).font(dFont).padding([.leading],10)
            ForEach($inputItemList.inputItem){input in
                listInputView(id:input.id,inputItemList:inputItemList,buttonColor:self.buttonColor)
            }
        }.onTapGesture {
            if self.inputItemList.inputItem.isEmpty{
                inputItemList.Append(text: "", note: "")
            }
        }
    }
}

struct listInputView:View{
    let id:Int
    @State var isButtonPushed:Bool = false
    @State var shownote:Bool = true
    @State var isEditing:Bool = true
    @State var showView:Bool = true
    @State var opa:Double = 1.0
    @ObservedObject var inputItemList:MyInputItemViewModel
    var buttonColor:Color = .blue
    var body: some View{
        if self.showView{
            VStack{
                HStack{
                    Button(action:{
                        self.isButtonPushed.toggle()
                        withAnimation(.linear(duration: 2)){
                            self.opa = 0
                        }
                        if self.isButtonPushed{
                            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
    //                            self.isButtonPushed = false
    //                            inputList.remove(at: id)
                                self.showView = false
                                inputItemList.ItemNum-=1
                            })
                        }
                    }){
                        if !self.isButtonPushed{
                            Circle().stroke().frame(width: 30,height:30,alignment: .topLeading).foregroundColor(.gray)
                        }else{
                            ZStack{
                                Circle().stroke().frame(width: 30,height:30,alignment: .topLeading)
                                Circle().frame(width: 25,height: 25,alignment: .topLeading)
                            }.foregroundColor(self.buttonColor)
                        }
                    }
                    
                    if self.isButtonPushed{
                        TextField("",text: $inputItemList.inputItem[self.id].text).font(.title2).foregroundColor(.gray)
                    }else{
                        TextField("",text: $inputItemList.inputItem[self.id].text,onEditingChanged: {
                            self.isEditing = $0;
                        },onCommit:{
                            inputItemList.Append(text: "", note: "")
    //                        inputList.append(inputItemEntity(id: inputList.count, text: "", note: ""))
                        }).font(.title2)
                    }
                    
                    if self.isEditing{
                        Image(systemName: "info.circle")
                            .resizable()
                            .foregroundColor(self.buttonColor)
                            .frame(width: 30,height: 30,alignment: .topLeading)
                            .padding(.top,10)
                    }
                }
                VStack{
                    if self.shownote{
                        TextField("添加备注",text: $inputItemList.inputItem[self.id].note,onEditingChanged: {
                            if self.inputItemList.inputItem[self.id].note.isEmpty{
                                self.shownote = $0
                            }
                        }).font(.caption).foregroundColor(.gray).padding(.leading,40)
                    }
                    Divider().frame(width: 320)
                }
            }.padding(.horizontal).opacity(self.opa)
        }
    }
}

