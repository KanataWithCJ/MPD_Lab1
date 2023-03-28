//
//  TagView.swift
//  MPD_Lab1
//
//  Created by 从径源 on 2023/3/28.
//

import SwiftUI

struct TagView: View {
    @State var isExpanded = false
    var body: some View {
        DisclosureGroup(
            isExpanded:self.$isExpanded,
            content: {
                VStack(alignment: .leading){
                    HStack(alignment:.top){
                        Text("#hello").bold().padding(.horizontal,10).padding(.vertical,5).background(Color(UIColor.systemGray5)).clipShape(RoundedRectangle(cornerRadius: 10))
                        Text("#family").bold().padding(.horizontal,10).padding(.vertical,5).background(Color(UIColor.systemGray5)).clipShape(RoundedRectangle(cornerRadius: 10))
                        Text("#family").bold().padding(.horizontal,10).padding(.vertical,5).background(Color(UIColor.systemGray5)).clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Spacer()
                    }
                    HStack(alignment:.top){
                        Text("#friends").bold().padding(.horizontal,10).padding(.vertical,5).background(Color(UIColor.systemGray5)).clipShape(RoundedRectangle(cornerRadius: 10))
                        Text("#Icon").bold().padding(.horizontal,10).padding(.vertical,5).background(Color(UIColor.systemGray5)).clipShape(RoundedRectangle(cornerRadius: 10))
                        Text("#LoL").bold().padding(.horizontal,10).padding(.vertical,5).background(Color(UIColor.systemGray5)).clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Spacer()
                    }.padding(.vertical,5)
                }.padding().frame(width: 365,alignment: .leading).background(.white).clipShape(RoundedRectangle(cornerRadius: 10))
        }) {
            Text("标签").foregroundColor(.black).font(.title).bold().frame(width: 350,alignment: .leading)
        }.listRowBackground(Color.clear)
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView()
    }
}
