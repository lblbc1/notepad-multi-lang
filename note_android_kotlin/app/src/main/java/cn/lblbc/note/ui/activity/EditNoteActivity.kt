package cn.lblbc.note.ui.activity

import cn.lblbc.note.R
import cn.lblbc.note.base.BaseVmActivity
import cn.lblbc.note.utils.Constants.EXTRA_KEY_NOTE_CONTENT
import cn.lblbc.note.utils.Constants.EXTRA_KEY_NOTE_ID
import cn.lblbc.note.viewmodel.NoteViewModel
import kotlinx.android.synthetic.main.activity_edit_note.*

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
class EditNoteActivity : BaseVmActivity<NoteViewModel>() {
    private var noteId = 0
    override fun viewModelClass() = NoteViewModel::class.java
    override fun layoutResId(): Int = R.layout.activity_edit_note

    override fun initView() {
        noteId = intent.getIntExtra(EXTRA_KEY_NOTE_ID, 0)
        val blogContent = intent.getStringExtra(EXTRA_KEY_NOTE_CONTENT)
        contentEt.setText(blogContent)
        initToolbar()
    }

    private fun initToolbar() {
        toolbar.inflateMenu(R.menu.edit_note)
        toolbar.setNavigationOnClickListener { finish() }
        toolbar.setOnMenuItemClickListener { item ->
            when (item.itemId) {
                R.id.action_save -> saveNote()
                R.id.action_delete -> deleteNote()
            }
            false
        }
    }

    private fun saveNote() {
        mViewModel.modifyNote(noteId, contentEt.text.toString())
        finish()
    }

    private fun deleteNote() {
        mViewModel.deleteNote(noteId)
        finish()
    }
}
