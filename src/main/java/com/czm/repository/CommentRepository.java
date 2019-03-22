package com.czm.repository;

import com.czm.model.CommentEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CommentRepository extends JpaRepository<CommentEntity,Integer> {
    /*根据answerId获得问题评论*/
    @Query("select comment from CommentEntity comment where comment.answerByAnswerId.answerId=:answerId")
    List<CommentEntity> findAllByAnswerId(@Param("answerId")Integer answerId);
}
