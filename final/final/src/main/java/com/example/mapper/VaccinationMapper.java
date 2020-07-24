package com.example.mapper;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.VaccinationVO;

public interface VaccinationMapper {
   //리스트 출력
   public List<VaccinationVO> list();
   //입력
   public void insert(VaccinationVO vo);
   //읽기
   public VaccinationVO read(String code);
   //업데이트
   public void update(VaccinationVO vo);
   //삭제
   public void delete(String code);
   //데이터갯수
   public int totalCount(Criteria cri);
}