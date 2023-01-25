package cn.lblbc.note.network

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/note
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
import cn.lblbc.note.network.request.AddNoteRequest
import cn.lblbc.note.network.request.LoginRequest
import cn.lblbc.note.network.request.ModifyNoteRequest
import cn.lblbc.note.network.request.RegisterRequest
import cn.lblbc.note.network.response.Note
import cn.lblbc.note.network.response.LoginResp
import cn.lblbc.note.network.response.Result
import retrofit2.http.*

interface ApiService {

    @POST("user/login")
    @Headers("ignoreToken:true")
    suspend fun login(@Body request: LoginRequest): Result<LoginResp?>?

    @POST("user/register")
    @Headers("ignoreToken:true")
    suspend fun register(@Body request: RegisterRequest): Result<LoginResp?>?

    @GET("note/notes")
    suspend fun queryNoteList(): Result<List<Note>?>?

    @GET("note/notes/{id}")
    suspend fun queryNote(@Path("id") id: Int): Result<Note?>?

    @DELETE("note/notes/{id}")
    suspend fun delNote(@Path("id") id: Int): Result<String?>?

    @POST("note/notes")
    suspend fun addNote(@Body request: AddNoteRequest): Result<String?>?

    @PUT("note/notes/{id}")
    suspend fun modifyNote(@Path("id") id: Int, @Body request: ModifyNoteRequest): Result<String?>?

}