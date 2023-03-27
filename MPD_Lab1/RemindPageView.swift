//
//  RemindView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/15.
//

import SwiftUI

struct RemindPageView: View {
    var body: some View {
        VStack{
            ScrollView{
                Text("Reminders")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .bold()
                    .frame(width: 370,alignment: .leading)
                Divider()
                RemindListView()
            }
            HStack{
                Button(action: {}, label: {
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

struct RemindItem:View{
    var title:String = "Facetime Grandma"
    var subtitle:String = "Today 5:00PM weekly"
    var hashtag:String = "#family"
    @State var IsOn:Bool = false
    var body: some View{
        HStack{
            Button(action: {IsOn.toggle()}, label: {
                if IsOn{
                    Image(systemName: "circle.fill")
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.blue)
                        .font(.title2)
                        .frame(height: 50)
                }else{
                    Image(systemName: "circle")
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.gray)
                        .font(.title2)
                        .frame(height: 50)
                }
            })
            
            VStack{
                VStack{
                    Text(title)
                        .font(.title2)
                    HStack{
                        Text(subtitle)
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(hashtag)
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                }
                .frame(width: 360,alignment: .leading)
                Divider()
            }
        }
        .frame(width: 380,alignment: .leading)
    }
}

struct RemindListView:View{
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
            LazyVStack{
                ForEach(0..<4){_ in
                    RemindItem()
                }
            }
        }
        .frame(width: 350)
    }
}



struct RemindView_Previews: PreviewProvider {
    static var previews: some View {
        RemindPageView()
    }
}
