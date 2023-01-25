package cn.lblbc.note.viewmodel

import androidx.lifecycle.MutableLiveData
import cn.lblbc.lib.utils.ToastUtil
import cn.lblbc.note.base.BaseViewModel
import cn.lblbc.note.network.NoteRepo
import cn.lblbc.note.network.response.Note

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
class NoteViewModel : BaseViewModel() {
    private val noteRepo by lazy { NoteRepo() }
    val note: MutableLiveData<Note> = MutableLiveData()

    fun queryNote(
        id: Int,
        onSuccess: (() -> Unit)? = null,
        onFailure: ((msg: String) -> Unit)? = null,
        onComplete: (() -> Unit)? = null
    ) {
        launch(
            {
                note.value = noteRepo.queryNote(id)?.data
                onSuccess?.invoke()
            },
            { onFailure?.invoke(it.message ?: "") },
            { onComplete?.invoke() })
    }


    fun addNote(
        content: String,
        onSuccess: (() -> Unit)? = null,
        onFailure: ((msg: String) -> Unit)? = null,
        onComplete: (() -> Unit)? = null
    ) {
        launch(
            {
                val resp = noteRepo.addNote(content)
                resp?.let {
                    if (it.isSuccess()) {
                        onSuccess?.invoke()
                    } else {
                        ToastUtil.toast(it.msg)
                    }
                }
            },
            { onFailure?.invoke(it.message ?: "") },
            { onComplete?.invoke() })
    }

    fun modifyNote(
        id: Int,
        content: String,
        onSuccess: (() -> Unit)? = null,
        onFailure: ((msg: String) -> Unit)? = null,
        onComplete: (() -> Unit)? = null
    ) {
        launch(
            {
                noteRepo.modifyNote(id, content)
                onSuccess?.invoke()
            },
            { onFailure?.invoke(it.message ?: "") },
            { onComplete?.invoke() })
    }

    fun deleteNote(
        id: Int,
        onSuccess: (() -> Unit)? = null,
        onFailure: ((msg: String) -> Unit)? = null,
        onComplete: (() -> Unit)? = null
    ) {
        launch(
            {
                noteRepo.delNote(id)
                onSuccess?.invoke()
            },
            { onFailure?.invoke(it.message ?: "") },
            { onComplete?.invoke() })
    }
}