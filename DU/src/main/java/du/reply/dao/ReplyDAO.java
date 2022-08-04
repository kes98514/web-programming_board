package du.reply.dao;

import java.util.List;

import du.reply.domain.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> selectReplyList(long boardIdx);

	public void insertReply(ReplyVO reply);

	public void deleteReply(long idx);

	public void deleteAllReply(long boardIdx);

	public void updateReply(ReplyVO reply);	
}
