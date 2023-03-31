//
//  RemindView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/15.
//

import SwiftUI

struct RemindPageView: View {
    var title:String = "Reminders"
    var ButtonColor:Color = .blue
    @ObservedObject var inputItemViewModel:MyInputItemViewModel
//    @State var inputList:[inputItemEntity] = []
    var body: some View {
        VStack{
            ScrollView{
                Text(self.title)
                    .font(.largeTitle)
                    .foregroundColor(self.ButtonColor)
                    .bold()
                    .frame(width: 370,alignment: .leading)
                Divider()
                ForEach(inputItemViewModel.inputItem){ list in
                    listInputView(id: list.id,inputItemList: self.inputItemViewModel, buttonColor:self.ButtonColor)
                }
                
            }.onTapGesture {
                if self.inputItemViewModel.inputItem.count == 0{
                    self.inputItemViewModel.Append(text: "", note: "")
                }
            }
            HStack{
                Button(action: {self.inputItemViewModel.Append(text: "", note: "")}, label: {
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

//struct RemindView_Previews: PreviewProvider {
//    static var previews: some View {
//        RemindPageView()
//    }
//}
