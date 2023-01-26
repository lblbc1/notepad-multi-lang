// 厦门大学计算机专业 | 前华为工程师
// 专注《零基础学编程系列》  http://lblbc.cn/blog
// 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
// 公众号：蓝不蓝编程

import SwiftUI

struct AddNoteView: View {
    var viewModel: NoteViewModel
    @State var note = Note()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack{
            TextField(NSLocalizedString("input_content", comment: ""), text: $note.content)
        }
        .padding()
        .background(.white)
        .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
        .background(Color(hex: 0xF4F4F4))
        .navigationBarItems(
            trailing:AddNoteTrailingButtons(onSave: {addNote()}))
    }
    
    func addNote() {
        viewModel.addNote(note: note){isSuccess,msg in
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
struct AddNoteTrailingButtons : View{
    var onSave: (()->())
    var body: some View {
        HStack{
            Button(action: {
                onSave()
            }) {
                Image(systemName: "tray")
            }
        }
    }
}
