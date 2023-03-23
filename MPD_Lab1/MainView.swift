//
//  MainView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/15.
//

import SwiftUI

var SectionBlocks = [
    SectionBlockView(
        title:"Today",
        symbol:"calendar.circle.fill",
        foreGroundColor: .blue,
        number: 0
    ),
    SectionBlockView(
        title: "Plan",
        symbol:"calendar.circle.fill",
        foreGroundColor: .red,
        number: 0
    ),
    SectionBlockView(
        title:"All",
        symbol:"tray.circle.fill",
        foreGroundColor: .black,
        number: 0
    ),
    SectionBlockView(
        title:"Completed",
        symbol:"checkmark.circle.fill",
        foreGroundColor: .secondary,
        number: 0
    )
]

struct MainView: View {
    @ObservedObject var mainViewModel = MainViewModel()
    @State var text:String = ""
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                mainTopView()
                GeometryReader{g in
                    ScrollView{
                        LazyVStack{
                            SearchBarView(text: $text)
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]){
                                NavigationLink(destination: TodayView()){SectionBlocks[0]}
                                NavigationLink(destination: PlanView()){SectionBlocks[1]}
                                NavigationLink(destination: TodayView()){SectionBlocks[2]}
                                NavigationLink(destination: CompleteView()){SectionBlocks[3]}
                            }
                            .frame(width: g.size.width,height: g.size.height-550)
                            MyListView(MyList: mainViewModel.getRemindList())
                                .frame(width:g.size.width+20,height: g.size.height)
                        }
                    }
                }
                mainBottomView()
            }
            .padding()
            .background(Color(red: 0.949, green: 0.949, blue: 0.971))
        }
    }
}

struct mainTopView:View{
    var body: some View{
        Button("Edit", action: {})
            .frame(width: 350,alignment:.bottomTrailing)
    }
}

struct SearchBarView:View{
    @Binding var text:String
    var body: some View{
        TextField("search",text: $text)
            .padding(6)
            .padding(.horizontal,25)
            .background(Color(.systemGray5))
            .cornerRadius(8)
            .overlay(
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading,8)
                ,alignment: .leading
            )
            .padding([.horizontal,.bottom],15)
    }
}

struct mainBottomView:View{
    var body: some View{
        HStack{
            Button(action: {}, label: {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
                Text("New event")
                    .font(.title2)
                    .bold()
            })
            Spacer()
            Button("Add list", action: {})
                .font(.title2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.949, green: 0.949, blue: 0.971)/*@END_MENU_TOKEN@*/)
    }
}
