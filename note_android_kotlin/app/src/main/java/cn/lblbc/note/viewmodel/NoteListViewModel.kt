package cn.lblbc.note.viewmodel

import androidx.lifecycle.MutableLiveData
import cn.lblbc.note.base.BaseViewModel
import cn.lblbc.note.network.NoteRepo
import cn.lblbc.note.network.response.Note
/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
class NoteListViewModel : BaseViewModel() {
    private val noteRepo by lazy { NoteRepo() }
    val dataList: MutableLiveData<List<Note>> = MutableLiveData()

    fun queryNoteList(
        onSuccess: (() -> Unit)? = null,
        onFailure: ((msg: String) -> Unit)? = null,
        onComplete: (() -> Unit)? = null
    ) {
        launch(
            {
                dataList.value = noteRepo.queryNoteList()?.data
                onSuccess?.invoke()
            },
            { onFailure?.invoke(it.message ?: "") },
            { onComplete?.invoke() })
    }
}