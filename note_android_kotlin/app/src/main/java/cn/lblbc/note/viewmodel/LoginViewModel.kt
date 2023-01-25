package cn.lblbc.note.viewmodel

import cn.lblbc.note.base.BaseViewModel
import cn.lblbc.note.network.NoteRepo
import cn.lblbc.note.utils.Constants.SP_KEY_TOKEN
import cn.lblbc.note.utils.Constants.SP_KEY_USER_ID
import cn.lblbc.lib.utils.SpUtil

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
class LoginViewModel : BaseViewModel() {
    private val noteRepo by lazy { NoteRepo() }

    fun login(
        userName: String, password: String,
        onSuccess: (() -> Unit)? = null,
        onFailure: ((msg: String) -> Unit)? = null,
        onComplete: (() -> Unit)? = null
    ) {
        launch(
            {
                val resp = noteRepo.login(userName, password)
                if (resp?.isSuccess() == true) {
                    SpUtil.put(SP_KEY_TOKEN, resp?.data?.token ?: "")
                    SpUtil.put(SP_KEY_USER_ID, resp?.data?.id ?: 0L)
                    onSuccess?.invoke()
                } else {
                    onFailure?.invoke(resp?.msg ?: "")
                }
            },
            { onFailure?.invoke(it.message ?: "error") },
            { onComplete?.invoke() })
    }

    fun register(
        userName: String, password: String,
        onSuccess: (() -> Unit)? = null,
        onFailure: ((msg: String) -> Unit)? = null,
        onComplete: (() -> Unit)? = null
    ) {
        launch(
            {
                val resp = noteRepo.register(userName, password)
                if (resp?.isSuccess() == true) {
                    SpUtil.put(SP_KEY_TOKEN, resp?.data?.token ?: "")
                    SpUtil.put(SP_KEY_USER_ID, resp?.data?.id ?: 0L)
                    onSuccess?.invoke()
                } else {
                    onFailure?.invoke(resp?.msg ?: "")
                }
            },
            { onFailure?.invoke(it.message ?: "error") },
            { onComplete?.invoke() })
    }
}