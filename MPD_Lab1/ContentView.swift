//
//  ContentView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/15.
//

import SwiftUI

struct ContentView: View {
    @State var text:String = ""
    var MyList = [
        MyListItem(name:"remind",img:"arrowshape.left"),
        MyListItem(name:"remind",img:"arrowshape.right"),

        MyListItem(name:"remind",img:"arrowshape.right"),
        MyListItem(name:"remind",img:"arrowshape.right"),
        MyListItem(name:"remind",img:"arrowshape.right"),
        MyListItem(name:"remind",img:"arrowshape.right"),
        MyListItem(name:"remind",img:"arrowshape.right"),
        MyListItem(name:"remind",img:"arrowshape.right"),
        MyListItem(name:"remind",img:"arrowshape.right"),
        MyListItem(name:"remind",img:"arrowshape.right"),
    ]
    
    var body: some View {
        NavigationView{
            VStack {
                Button("Edit", action: {})
                    .frame(width: 350,alignment:.bottomTrailing)
                GeometryReader{g in
                    ScrollView{
                        SearchBarView(text: $text)
                            .padding(.bottom,15)
                        LazyVGrid(columns: [GridItem(),GridItem()]){
                            ForEach((0..<4)){_ in
                                SectionBlockView()
                                    .aspectRatio(2,contentMode: .fit)
                                    .padding(10)
                            }
                        }
                        
                        
                        List{
                            ForEach(MyList) { list in
                                NavigationLink(destination:CampingView()){
                                    HStack {
                                        Image(systemName:list.img)
                                            .resizable()
                                            .frame(width:40,height:40)
                                            .cornerRadius(5)
                                        Text(list.name)
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .frame(width:g.size.width,height: g.size.height-5,alignment: .center)
                    }
                }
                
                
                
                mainBottom()
            }
            .padding()
            .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
            .background(Color(red: 0.949, green: 0.949, blue: 0.971))
        }
    }
}

struct MyListItem:Identifiable{
    var id = UUID()
    var name:String
    var img:String
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
                    .frame(width:350,height: .infinity,alignment: .topLeading)
                    .padding(.leading,8)
            )
            .padding(.horizontal,10)
    }
}


struct SectionBlockView:View{
    let title:String = "Today"
    let symbol:Image = Image(systemName: "sos.circle.fill")
    var number:Int = 0
    var body: some View{
        Button(action: {}, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.white)
                VStack{
                    HStack{
                        symbol
                            .font(.largeTitle)
                        Spacer()
                        Text("\(number)")
                            .font(.largeTitle)
                            .bold()
                            .padding(.trailing, 10.0)
                    }
                    .padding([.top, .leading, .trailing], 5)
                    Text(title)
                        .bold()
                        .foregroundColor(.gray)
                        .frame(width:150,alignment: .leading)
                        .padding([.leading, .bottom, .trailing], 5)
                }
            }
        })
    }
}

    
    
    struct TagView:View{
        var Tags = ["happy","sad","angry","jealous","hungry","horny"]
        var body: some View{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                VStack{
                    ForEach(Tags, id:\.self){
                        tag in
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.gray)
                            Text(tag)
                        }
                        .aspectRatio(2/1, contentMode: .fit)
                        .padding()
                    }
                }
            }
        }
    }
    

struct mainBottom:View{
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
        ContentView()
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.949, green: 0.949, blue: 0.971)/*@END_MENU_TOKEN@*/)
    }
}
