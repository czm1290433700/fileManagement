package com.czm.repository;

import com.czm.model.QuestionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface QuestionRepository extends JpaRepository<QuestionEntity,Integer> {
    /*按照时间倒序获得最新问题*/
    @Query("select question from QuestionEntity question order by question.createTime desc ")
    List<QuestionEntity> findAllByCreateTimeDesc();
    /*按照浏览量获得最热问题*/
    @Query("select question from QuestionEntity question order by question.browseNum desc ")
    List<QuestionEntity> findAllByBrowseNumDesc();
    /*按照课程标签和时间倒序获得最新问题*/
    @Query("select question from QuestionEntity question where question.tagContent like %:name% order by question.createTime desc ")
    List<QuestionEntity> findAllByTagContentAndCreateTimeDesc(@Param("name")String name);
    /*按照课程标签和浏览量获得最热问题*/
    @Query("select question from QuestionEntity question where question.tagContent like %:name% order by question.browseNum desc ")
    List<QuestionEntity> findAllByTagContentAndBrowseNum(@Param("name") String name);
    /*通过时间获取question对象*/
    @Query("select question from QuestionEntity question where question.createTime=:createTime")
    QuestionEntity findOneByCreateTime(@Param("createTime") String createTime);
    /*通过questionId获取question对象*/
    @Query("select question from QuestionEntity question where question.questionId=:questionId")
    QuestionEntity findOneByQuestionId(@Param("questionId") Integer questionId);
    /*更新指定问题的isResolve为1*/
    @Modifying
    @Transactional
    @Query("update QuestionEntity question set question.isResolve=1 where question.questionId=:questionId")
    Integer updateIsResolve(@Param("questionId") Integer questionId);
    /*通过指定的tagId获取相似Question*/
    @Query("select question from QuestionEntity question where question.tagContent like %:name%")
    List<QuestionEntity> findAllByTagContent(@Param("name") String name);
    /*浏览量加1*/
    @Modifying
    @Transactional
    @Query("update QuestionEntity question set question.browseNum=question.browseNum+1 where question.questionId=:questionId")
    Integer updateBrowseNum(@Param("questionId")Integer questionId);
}
