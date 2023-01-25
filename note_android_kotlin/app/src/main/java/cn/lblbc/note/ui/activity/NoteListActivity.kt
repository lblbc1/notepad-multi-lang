package cn.lblbc.note.ui.activity

import android.content.Intent
import androidx.lifecycle.Observer
import cn.lblbc.note.base.BaseVmActivity
import cn.lblbc.note.network.response.Note
import cn.lblbc.note.ui.adapter.NoteListAdapter
import cn.lblbc.note.utils.Constants
import cn.lblbc.note.utils.Constants.EXTRA_KEY_NOTE_CONTENT
import cn.lblbc.note.utils.Constants.EXTRA_KEY_NOTE_ID
import cn.lblbc.note.viewmodel.NoteListViewModel
import cn.lblbc.lib.utils.SpUtil
import cn.lblbc.note.R
import kotlinx.android.synthetic.main.activity_note_list.*

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
class NoteListActivity : BaseVmActivity<NoteListViewModel>() {
    private val adapter = NoteListAdapter()
    override fun viewModelClass() = NoteListViewModel::class.java
    override fun layoutResId(): Int = R.layout.activity_note_list

    override fun initView() {
        if (isLoggedIn()) {
            rv.adapter = adapter
            adapter.setOnItemClick(this::onItemClick)
        } else {
            startActivity(Intent(this@NoteListActivity, LoginActivity::class.java))
            finish()
        }
    }

    private fun isLoggedIn(): Boolean {
        var token = SpUtil.get(Constants.SP_KEY_TOKEN, "")
        return !token.isNullOrEmpty()
    }

    override fun initData() {
        mViewModel.queryNoteList()
    }

    override fun initListeners() {
        addIv.setOnClickListener {
            startActivity(Intent(this, AddNoteActivity::class.java))
        }
    }

    override fun observe() {
        mViewModel.dataList.observe(this, Observer { adapter.setData(it) })
    }

    private fun onItemClick(note: Note) {
        val intent = Intent(this, EditNoteActivity::class.java)
        intent.putExtra(EXTRA_KEY_NOTE_ID, note.id)
        intent.putExtra(EXTRA_KEY_NOTE_CONTENT, note.content)
        startActivity(intent)
    }

    override fun onResume() {
        super.onResume()
        initData()
    }
}
