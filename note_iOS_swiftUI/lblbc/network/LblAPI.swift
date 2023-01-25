// 厦门大学计算机专业 | 前华为工程师
// 分享编程技术，没啥深度，但看得懂，适合初学者。
// Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
// 公众号：蓝不蓝编程

import Foundation
import Moya
import HandyJSON
import SwiftyJSON

let LblProvider = MoyaProvider<LblAPI>()


enum LblAPI {
    case login(params: [String:Any])
    case register(params: [String:Any])
    case queryNoteList
    case queryNote(noteId: Int)
    case deleteNote(noteId: Int)
    case addNote(params: Note)
    case modifyNote(params: Note)
}

extension LblAPI: TargetType {
    public var baseURL: URL {
        //Moya会把path中带的问号转为%3F，所以只能将带有问号路径的URL放到baseURL中来规避该问题
        switch self {
            case .queryNote(let noteId):
                return URL(string: "http://lblbc.cn/note/notes/\(noteId)")!
            case .deleteNote(let noteId):
                return URL(string: "http://lblbc.cn/note/notes/\(noteId)")!
            default:
                return URL(string: "http://lblbc.cn/")!
        }
    }
    
    var path: String {
        switch self {
            case .login: return "user/login"
            case .register: return "user/register"
            case .queryNoteList: return "note/notes"
            case .addNote: return "note/notes"
            case .modifyNote: return "note/notes"
            default: return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .queryNoteList,.queryNote:
            return .get
        case .login, .register, .addNote:
            return .post
        case .modifyNote:
            return .put
        case .deleteNote:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case .addNote(let params), .modifyNote(let params):
            return .requestParameters(parameters: params.toJSON() ?? ["":""], encoding: JSONEncoding.default)
        case .login(let params), .register(let params):
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .queryNoteList,.queryNote, .deleteNote:
            return .requestPlain
        }
    }
    
    var sampleData: Data { return "".data(using: String.Encoding.utf8)! }
    var headers: [String : String]? {
        let userInfo = LoginViewModel.shared.userInfo
        var headerDict = ["Content-Type":"application/json;charset=utf-8"]
        if(userInfo != nil){
            headerDict["Authorization"] = userInfo!.token
        }
        return headerDict
    }
}
