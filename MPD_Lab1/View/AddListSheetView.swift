//
//  AddListSheetView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/23.
//

import SwiftUI

struct AddListSheetView: View {
    @State var ititle:String=""
    @State var inote:String=""
    @Binding var isSheetPreseted:Bool
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Button("cancel"){isSheetPreseted = false}
                    Spacer()
                    Text("New Remind Item")
                    Spacer()
                    Button("Add"){}
                }.padding()
                ZStack{
                    GeometryReader{_ in
                        RoundedRectangle(cornerRadius: 10).foregroundColor(.white)
                        VStack{
                            TextField("title",text: self.$ititle)
                            Divider()
                            TextField("note",text: self.$inote)
                        }.padding(.leading,10)
                    }
                }.padding(.horizontal,25).frame(height: 150)
                
                Form{
                    Section{
                        List{
                            NavigationLink(destination:{}){Text("Information")}
                        }
                    }
                    Section{
                        List{
                            NavigationLink(destination:{}){Text("Information")}
                        }
                    }
                }
            }
            .background(Color(red: 0.949, green: 0.949, blue: 0.971))
        }
    }
}
//
//struct AddListSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddListSheetView()
//    }
//}
