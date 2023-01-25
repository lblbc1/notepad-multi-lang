package cn.lblbc.note.ui.activity

import android.content.Intent
import cn.lblbc.note.base.BaseVmActivity
import cn.lblbc.note.viewmodel.LoginViewModel
import cn.lblbc.lib.utils.ToastUtil.toast
import cn.lblbc.note.R
import kotlinx.android.synthetic.main.activity_login.*

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
class LoginActivity : BaseVmActivity<LoginViewModel>() {
    override fun viewModelClass() = LoginViewModel::class.java
    override fun layoutResId(): Int = R.layout.activity_login

    override fun initListeners() {
        loginBtn.setOnClickListener {
            mViewModel.login(
                userNameEt.text.toString(),
                passwordEt.text.toString(),
                onSuccess = {
                    startActivity(Intent(this@LoginActivity, NoteListActivity::class.java))
                    finish()
                },
                onFailure = {
                    toast(it)
                })
        }
        registerBtn.setOnClickListener {
            mViewModel.register(
                userNameEt.text.toString(),
                passwordEt.text.toString(),
                onSuccess = {
                    startActivity(Intent(this@LoginActivity, NoteListActivity::class.java))
                    finish()
                },
                onFailure = {
                    toast(it)
                })
        }
    }
}
