package DANIM.Project.Dto;

import DANIM.Project.Paging.Criteria;
import DANIM.Project.Paging.Paging;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommonDTO extends Criteria{
	/** 페이징 정보 */
	private Paging paginationInfo;
}
