package com.czm.repository;

import com.czm.model.CourseEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface CourseRepository extends JpaRepository<CourseEntity,Integer> {
    /*获取对应用户的所有课程*/
    @Query("select course from CourseEntity course where course.userByUserId.userId=:userId")
    List<CourseEntity> findAllByUserId(@Param("userId") Integer userId);
    /*倒序获取对应用户的所有课程*/
    @Query("select course from CourseEntity course where course.userByUserId.userId=:userId order by course.courseId desc ")
    List<CourseEntity> findAllByUserIdDesc(@Param("userId") Integer userId);
    /*按照笔记数从多到少获得课程*/
    @Query("select course from CourseEntity course order by course.noteNum desc ")
    List<CourseEntity> findAllByNoteNumDesc();
}
