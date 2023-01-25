package cn.lblbc.note.ui.activity

import cn.lblbc.note.R
import cn.lblbc.note.base.BaseVmActivity
import cn.lblbc.note.viewmodel.NoteViewModel
import kotlinx.android.synthetic.main.activity_add_note.*

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
class AddNoteActivity : BaseVmActivity<NoteViewModel>() {
    override fun viewModelClass() = NoteViewModel::class.java
    override fun layoutResId(): Int = R.layout.activity_add_note

    override fun initView() {
        initToolbar()
    }

    private fun initToolbar() {
        toolbar.inflateMenu(R.menu.add_note)
        toolbar.setNavigationOnClickListener { finish() }
        toolbar.setOnMenuItemClickListener { item ->
            when (item.itemId) {
                R.id.action_save -> saveNote()
            }
            false
        }
    }

    private fun saveNote() {
        mViewModel.addNote(contentEt.text.toString())
        finish()
    }
}
