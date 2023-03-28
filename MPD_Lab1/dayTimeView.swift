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
    @State var inputList:[inputItemEntity] = []
    var body: some View{
        VStack(alignment:.leading){
            Text(timeName).foregroundColor(textColor).font(dFont).padding([.leading],10)
            ForEach($inputList){input in
                listInputView(id:input.id,inputtext:input.text,inputnote: input.note,inputList:self.$inputList, buttonColor:self.buttonColor)
            }
        }.onTapGesture {
            if self.inputList.count == 0{
                inputList.append(inputItemEntity(id: inputList.count, text: "", note: ""))
            }
        }
    }
}

struct listInputView:View{
    let id:Int
    @State var isButtonPushed:Bool = false
    @State var shownote:Bool = true
    @State var isEditing:Bool = true
    @Binding var inputtext:String
    @Binding var inputnote:String
    @Binding var inputList:[inputItemEntity]
    //    @Binding var
    var buttonColor:Color = .blue
    var body: some View{
        VStack{
            HStack{
                Button(action:{
                    self.isButtonPushed.toggle()
                    if self.isButtonPushed{
                        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                            self.isButtonPushed = false
                            inputList.remove(at: id)
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
                    TextField("",text: self.$inputtext).font(.title2).foregroundColor(.gray)
                }else{
                    TextField("",text: self.$inputtext,onEditingChanged: {
                        self.isEditing = $0;
                    },onCommit:{
                        inputList.append(inputItemEntity(id: inputList.count, text: "", note: ""))
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
            if self.shownote{
                TextField("添加备注",text: self.$inputnote,onEditingChanged: {
                    if self.inputnote.isEmpty{
                        self.shownote = $0
                    }
                }).font(.caption).foregroundColor(.gray).padding(.leading,40)
            }
        }.padding(.horizontal)
    }
}


// button 1



// text field big




// image



// textfield small

//struct dayTimeView_Previews: PreviewProvider {
//    static var previews: some View {
//        dayTimeView(timeName: "Today")
//    }
//}
