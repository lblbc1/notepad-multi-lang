/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
package cn.lblbc.note.network

import cn.lblbc.note.base.BaseRepository
import cn.lblbc.note.network.request.AddNoteRequest
import cn.lblbc.note.network.request.LoginRequest
import cn.lblbc.note.network.request.ModifyNoteRequest
import cn.lblbc.note.network.request.RegisterRequest

class NoteRepo : BaseRepository() {
    suspend fun login(userName: String, password: String) = apiService.login(LoginRequest(userName, password))
    suspend fun register(userName: String, password: String) = apiService.register(RegisterRequest(userName, password))
    suspend fun queryNoteList() = apiService.queryNoteList()
    suspend fun queryNote(blogId: Int) = apiService.queryNote(blogId)
    suspend fun addNote(content: String) = apiService.addNote(AddNoteRequest(content))
    suspend fun modifyNote(id: Int, content: String) = apiService.modifyNote(id, ModifyNoteRequest(content))
    suspend fun delNote(blogId: Int) = apiService.delNote(blogId)
}