// 厦门大学计算机专业 | 前华为工程师
// 专注《零基础学编程系列》  http://lblbc.cn/blog
// 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
// 公众号：蓝不蓝编程

import UIKit
import SwiftyJSON
import HandyJSON

class NoteViewModel: ObservableObject {
    @Published var dataList:[Note] = []
    @Published var note:Note = Note()
    @Published var shouldRefresh = false
    
    func queryNoteList() {
        LblProvider.request(.queryNoteList) { result in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                let json = JSON(data!)
                if let resp = JSONDeserializer<QueryNoteListResp>.deserializeFrom(json: json.description) {
                    if(resp.data != nil){
                        self.dataList = resp.data ?? []
                    }
                }
            }
        }
    }
    
    func queryNote(noteId: Int) {
        LblProvider.request(.queryNote(noteId: noteId)) { result in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                let json = JSON(data!)
                if let resp = JSONDeserializer<QueryNoteResp>.deserializeFrom(json: json.description) {
                    if(resp.data != nil){
                        self.note = resp.data ?? Note()
                    }
                }
            }
        }
    }
    
    func deleteNote(noteId: Int, callback: @escaping((Bool,String)->())) {
        LblProvider.request(.deleteNote(noteId: noteId)) { result in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                let json = JSON(data!)
                if let resp = JSONDeserializer<CommonResp>.deserializeFrom(json: json.description) {
                    self.queryNoteList()
                    callback(resp.isSuccess(),resp.msg)
                }
            }
        }
    }

    func addNote(note: Note, callback: @escaping((Bool,String)->())) {
        LblProvider.request(.addNote(params: note)) { result in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                let json = JSON(data!)
                if let resp = JSONDeserializer<CommonResp>.deserializeFrom(json: json.description) {
                    callback(resp.isSuccess(),resp.msg)
                }
            }
        }
    }

    func modifyNote(note: Note, callback: @escaping((Bool,String)->())) {
        LblProvider.request(.modifyNote(params: note)) { result in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                let json = JSON(data!)
                if let resp = JSONDeserializer<CommonResp>.deserializeFrom(json: json.description) {
                    callback(resp.isSuccess(),resp.msg)
                }
            }
        }
    }
}
