// 厦门大学计算机专业 | 前华为工程师
// 专注《零基础学编程系列》  http://lblbc.cn/blog
// 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
// 公众号：蓝不蓝编程

import SwiftUI

struct EditNoteView: View {
    var noteId: Int
    @ObservedObject var viewModel: NoteViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack{
            TextField("请输入内容", text: $viewModel.note.content)
        }
        .padding()
        .background(.white)
        .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
        .background(Color(hex: 0xF4F4F4))
        .navigationBarItems(
            trailing:EditTrailingButtons(onSave: {modifyNote()}, onDelete:{deleteNote()}))
        .onAppear(perform: {
            viewModel.queryNote(noteId: noteId)
        })
    }
    
    func modifyNote() {
        viewModel.modifyNote(note: viewModel.note){isSuccess,msg in
            if(isSuccess){
                viewModel.shouldRefresh = true
                goBack()
            }else{
                // error = msg
            }
        }
    }
    
    func deleteNote() {
        viewModel.deleteNote(noteId: viewModel.note.id){isSuccess,msg in
            if(isSuccess){
                viewModel.shouldRefresh = true
                goBack()
            }else{
                // error = msg
            }
        }
    }
    
    private func goBack(){
        self.presentationMode.wrappedValue.dismiss()
    }
}
struct EditTrailingButtons : View{
    var onSave: (()->())
    var onDelete: (()->())
    var body: some View {
        HStack{
            Button(action: {
                onSave()
            }) {
                Image(systemName: "tray")
            }
            Button(action: {
                onDelete()
            }) {
                Image(systemName: "trash")
            }
        }
    }
}
