package com.czm.repository;

import com.czm.model.QuestiontagEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface QuestionTagRepository extends JpaRepository<QuestiontagEntity,Integer> {
    /*通过名字查询*/
    @Query("select questiontag from QuestiontagEntity questiontag where questiontag.name=:name")
    QuestiontagEntity findOneByName(@Param("name") String name);
    /*通过使用次数查询*/
    @Query("select questiontag from QuestiontagEntity questiontag order by questiontag.referencesByQuestionTagId.size Desc")
    List<QuestiontagEntity> findAllByUseTimes();
}
