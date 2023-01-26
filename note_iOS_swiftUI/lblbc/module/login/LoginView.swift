// 厦门大学计算机专业 | 前华为工程师
// 专注《零基础学编程系列》  http://lblbc.cn/blog
// 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
// 公众号：蓝不蓝编程
import SwiftUI

struct LoginView : View {
    var loginViewModel: LoginViewModel
    @State var name: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @State var showPwd = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var isCanLogin: Bool {
        name.count > 0 &&
        password.count > 0
    }
    
    var body: some View {
        VStack {
            Text(error).foregroundColor(.red)
            HStack {
                Image(systemName: "person")
                TextField(NSLocalizedString("input_user_name", comment: ""), text: $name)
            }
            Divider()
            HStack {
                Image(systemName: "lock")
                if showPwd {
                    TextField(NSLocalizedString("input_password", comment: ""), text: $password)
                } else {
                    SecureField(NSLocalizedString("input_password", comment: ""), text: $password)
                }
                Button(action: {
                    self.showPwd.toggle()
                }) {
                    Image(systemName: self.showPwd ? "eye" : "eye.slash")
                }
                
            }
            Divider()
            HStack{
                Button(action: {
                    error = ""
                    loginViewModel.login(name: name , password: password){isSuccess,msg in
                        if(isSuccess){
                            loginViewModel.loginStatus = true
                            goBack()
                        }else{
                            error = msg
                        }
                    }
                }) {
                    Text(NSLocalizedString("login", comment: "")).foregroundColor(.white)
                }
                .frame(width: 100, height: 45, alignment: .center)
                .background(isCanLogin ? Color.main_color: Color.gray)
                .cornerRadius(10)
                .disabled(!isCanLogin)
                
                Button(action: {
                    error = ""
                    loginViewModel.register(name: name , password: password){isSuccess,msg in
                        if(isSuccess){
                            loginViewModel.loginStatus = true
                            goBack()
                        }else{
                            error = msg
                        }
                    }
                }) {
                    Text(NSLocalizedString("register", comment: "")).foregroundColor(.white)
                }
                .frame(width: 100, height: 45, alignment: .center)
                .background(isCanLogin ? Color.main_color: Color.gray)
                .cornerRadius(10)
                .disabled(!isCanLogin)
            }
            
            Spacer()
        }
        .padding(.top, 100)
        .padding(.leading)
        .padding(.trailing)
    }
    
    private func goBack(){
        self.presentationMode.wrappedValue.dismiss()
    }
}

//#if DEBUG
//struct LoginView_Previews : PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
//#endif

