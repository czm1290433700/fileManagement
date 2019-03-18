package com.czm.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "reference", schema = "filemanager", catalog = "")
public class ReferenceEntity {
    private int referenceId;
    private QuestionEntity questionByQuestionId;
    private QuestiontagEntity questiontagByQuestionTagId;

    public ReferenceEntity() {
    }

    public ReferenceEntity(QuestionEntity questionByQuestionId, QuestiontagEntity questiontagByQuestionTagId) {
        this.questionByQuestionId = questionByQuestionId;
        this.questiontagByQuestionTagId = questiontagByQuestionTagId;
    }

    @Id
    @Column(name = "referenceId")
    public int getReferenceId() {
        return referenceId;
    }

    public void setReferenceId(int referenceId) {
        this.referenceId = referenceId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ReferenceEntity that = (ReferenceEntity) o;
        return referenceId == that.referenceId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(referenceId);
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
    @JoinColumn(name = "questionTagId", referencedColumnName = "QuestionTagId", nullable = false)
    public QuestiontagEntity getQuestiontagByQuestionTagId() {
        return questiontagByQuestionTagId;
    }

    public void setQuestiontagByQuestionTagId(QuestiontagEntity questiontagByQuestionTagId) {
        this.questiontagByQuestionTagId = questiontagByQuestionTagId;
    }
}
