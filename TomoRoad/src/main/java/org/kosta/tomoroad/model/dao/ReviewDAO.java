package org.kosta.tomoroad.model.dao;

import java.util.List;

import org.kosta.tomoroad.model.vo.PagingBean;
import org.kosta.tomoroad.model.vo.ReviewVO;

public interface ReviewDAO {

	int getTotalContents();

	List<ReviewVO> getList(PagingBean pb);

}