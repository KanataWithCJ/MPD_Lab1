//
//  RemindView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/15.
//

import SwiftUI

struct RemindPageView: View {
    @State var inputList:[inputItemEntity] = []
    var body: some View {
        VStack{
            ScrollView{
                Text("Reminders")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .bold()
                    .frame(width: 370,alignment: .leading)
                Divider()
                ForEach($inputList){ list in
                    listInputView(id: list.id, inputtext: list.text, inputnote: list.note, inputList: self.$inputList)
                }
                
            }.onTapGesture {
                if self.inputList.count == 0{
                    self.inputList.append(inputItemEntity(id: self.inputList.count, text: "", note: ""))
                }
            }
            HStack{
                Button(action: {self.inputList.append(inputItemEntity(id: self.inputList.count, text: "", note: ""))}, label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                    Text("New event")
                        .font(.title2)
                        .bold()
                })
                .padding()
                Spacer()
            }
        }
        
    }
}

struct RemindView_Previews: PreviewProvider {
    static var previews: some View {
        RemindPageView()
    }
}
