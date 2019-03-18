package com.czm.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "answer", schema = "filemanager", catalog = "")
public class AnswerEntity {
    private int answerId;
    private String content;
    private String answerTime;
    private Byte isBestAnswer;
    private QuestionEntity questionByQuestionId;
    private UserEntity userByAnswerManId;
    private Collection<CommentEntity> commentsByAnswerId;

    @Id
    @Column(name = "answerId")
    public int getAnswerId() {
        return answerId;
    }

    public void setAnswerId(int answerId) {
        this.answerId = answerId;
    }

    @Basic
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "answerTime")
    public String getAnswerTime() {
        return answerTime;
    }

    public void setAnswerTime(String answerTime) {
        this.answerTime = answerTime;
    }

    @Basic
    @Column(name = "isBestAnswer")
    public Byte getIsBestAnswer() {
        return isBestAnswer;
    }

    public void setIsBestAnswer(Byte isBestAnswer) {
        this.isBestAnswer = isBestAnswer;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AnswerEntity that = (AnswerEntity) o;
        return answerId == that.answerId &&
                Objects.equals(content, that.content) &&
                Objects.equals(answerTime, that.answerTime) &&
                Objects.equals(isBestAnswer, that.isBestAnswer);
    }

    @Override
    public int hashCode() {
        return Objects.hash(answerId, content, answerTime, isBestAnswer);
    }

    @ManyToOne
    @JoinColumn(name = "questionId", referencedColumnName = "questionId", nullable = false)
    public QuestionEntity getQuestionByQuestionId() {
        return questionByQuestionId;
    }

    public void setQuestionByQuestionId(QuestionEntity questionByQuestionId) {
        this.questionByQuestionId = questionByQuestionId;
    }

    @ManyToOne
    @JoinColumn(name = "answerManId", referencedColumnName = "userId", nullable = false)
    public UserEntity getUserByAnswerManId() {
        return userByAnswerManId;
    }

    public void setUserByAnswerManId(UserEntity userByAnswerManId) {
        this.userByAnswerManId = userByAnswerManId;
    }

    @OneToMany(mappedBy = "answerByAnswerId",fetch=FetchType.EAGER)
    public Collection<CommentEntity> getCommentsByAnswerId() {
        return commentsByAnswerId;
    }

    public void setCommentsByAnswerId(Collection<CommentEntity> commentsByAnswerId) {
        this.commentsByAnswerId = commentsByAnswerId;
    }
}
