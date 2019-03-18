package com.czm.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "question", schema = "filemanager", catalog = "")
public class QuestionEntity {
    private int questionId;
    private String content;
    private String createTime;
    private String tagContent;
    private String title;
    private Integer browseNum;
    private Byte isResolve;
    private Collection<AnswerEntity> answersByQuestionId;
    private UserEntity userByAskerId;
    private Collection<ReferenceEntity> referencesByQuestionId;

    @Id
    @Column(name = "questionId")
    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
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
    @Column(name = "createTime")
    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    @Basic
    @Column(name = "tagContent")
    public String getTagContent() {
        return tagContent;
    }

    public void setTagContent(String tagContent) {
        this.tagContent = tagContent;
    }

    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "browseNum")
    public Integer getBrowseNum() {
        return browseNum;
    }

    public void setBrowseNum(Integer browseNum) {
        this.browseNum = browseNum;
    }

    @Basic
    @Column(name = "isResolve")
    public Byte getIsResolve() {
        return isResolve;
    }

    public void setIsResolve(Byte isResolve) {
        this.isResolve = isResolve;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        QuestionEntity that = (QuestionEntity) o;
        return questionId == that.questionId &&
                Objects.equals(content, that.content) &&
                Objects.equals(createTime, that.createTime) &&
                Objects.equals(tagContent, that.tagContent) &&
                Objects.equals(title, that.title) &&
                Objects.equals(browseNum, that.browseNum) &&
                Objects.equals(isResolve, that.isResolve);
    }

    @Override
    public int hashCode() {
        return Objects.hash(questionId, content, createTime, tagContent, title, browseNum,isResolve);
    }

    @OneToMany(mappedBy = "questionByQuestionId",fetch=FetchType.EAGER)
    public Collection<AnswerEntity> getAnswersByQuestionId() {
        return answersByQuestionId;
    }

    public void setAnswersByQuestionId(Collection<AnswerEntity> answersByQuestionId) {
        this.answersByQuestionId = answersByQuestionId;
    }

    @ManyToOne
    @JoinColumn(name = "askerId", referencedColumnName = "userId", nullable = false)
    public UserEntity getUserByAskerId() {
        return userByAskerId;
    }

    public void setUserByAskerId(UserEntity userByAskerId) {
        this.userByAskerId = userByAskerId;
    }

    @OneToMany(mappedBy = "questionByQuestionId")
    public Collection<ReferenceEntity> getReferencesByQuestionId() {
        return referencesByQuestionId;
    }

    public void setReferencesByQuestionId(Collection<ReferenceEntity> referencesByQuestionId) {
        this.referencesByQuestionId = referencesByQuestionId;
    }
}
