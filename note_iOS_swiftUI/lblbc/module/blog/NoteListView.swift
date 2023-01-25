// 厦门大学计算机专业 | 前华为工程师
// 专注《零基础学编程系列》  http://lblbc.cn/blog
// 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
// 公众号：蓝不蓝编程

import SwiftUI
import SDWebImageSwiftUI

struct NoteListView: View {
    @StateObject private var noteViewModel = NoteViewModel()
    @StateObject private var loginViewModel = LoginViewModel.shared
    @State var isLoggedIn: Bool = false
    @State var shouldShowLogin: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("蓝不蓝云笔记")
                List {
                    ForEach(noteViewModel.dataList.indices , id: \.self){ i in
                        NoteRowView(viewModel: noteViewModel,
                                    note: noteViewModel.dataList[i])
                    }
                }
                NavigationLink(destination: AddNoteView(viewModel: noteViewModel)){
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.blue)
                        .font(.system(size: 60))
                }
            }.background(Color.white)
        }.onChange(of: loginViewModel.loginStatus, perform: { value in
            if(value) {
                isLoggedIn = true
            } else {
                isLoggedIn = false
            }
            shouldShowLogin = !isLoggedIn
            noteViewModel.queryNoteList()
        }).onChange(of: noteViewModel.shouldRefresh, perform: { value in
            if(value) {
                noteViewModel.queryNoteList()
                noteViewModel.shouldRefresh = false
            }
        })
        
        .onAppear(perform: {
            isLoggedIn = loginViewModel.isLoggedIn()
            shouldShowLogin = !isLoggedIn
            noteViewModel.queryNoteList()
        }).sheet(isPresented: $shouldShowLogin, content: {
            LoginView(loginViewModel: loginViewModel)
        })
    }
}

struct NoteRowView: View {
    var viewModel: NoteViewModel
    var note: Note
    var body: some View {
        NavigationLink(destination: EditNoteView(noteId: note.id, viewModel: viewModel)){
            Text(note.content)
                .lineLimit(1)
                .padding(EdgeInsets.init(top: 10, leading: 0, bottom: 10, trailing: 0))
        }
    }
}


struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NoteListView()
    }
}
