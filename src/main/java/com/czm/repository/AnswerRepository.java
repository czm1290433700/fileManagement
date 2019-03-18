package com.czm.repository;

import com.czm.model.AnswerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface AnswerRepository extends JpaRepository<AnswerEntity,Integer> {
    /*更新指定回答为最佳答案*/
    @Modifying
    @Transactional
    @Query("update AnswerEntity answer set answer.isBestAnswer=1 where answer.answerId=:answerId")
    Integer updateIsBestAnswer(@Param("answerId") Integer answerId);
    /*查找其他答案*/
    @Query("select answer from AnswerEntity answer where answer.questionByQuestionId.questionId=:questionId" +
            " and answer.isBestAnswer=0")
    List<AnswerEntity> selectOtherAnswers(@Param("questionId") Integer questionId);
    /*查找最佳答案*/
    @Query("select answer from AnswerEntity answer where answer.questionByQuestionId.questionId=:questionId" +
            " and answer.isBestAnswer=1")
    AnswerEntity selectBestAnswer(@Param("questionId")Integer questionId);
}
