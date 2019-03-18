package com.czm.model;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "questiontag", schema = "filemanager", catalog = "")
public class QuestiontagEntity {
    private int questionTagId;
    private String name;
    private Collection<ReferenceEntity> referencesByQuestionTagId;

    @Id
    @Column(name = "QuestionTagId")
    public int getQuestionTagId() {
        return questionTagId;
    }

    public QuestiontagEntity(){

    }
    public QuestiontagEntity(String name) {
        this.name = name;
    }

    public void setQuestionTagId(int questionTagId) {
        this.questionTagId = questionTagId;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        QuestiontagEntity that = (QuestiontagEntity) o;
        return questionTagId == that.questionTagId &&
                Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(questionTagId, name);
    }

    @OneToMany(mappedBy = "questiontagByQuestionTagId",fetch=FetchType.EAGER)
    public Collection<ReferenceEntity> getReferencesByQuestionTagId() {
        return referencesByQuestionTagId;
    }

    public void setReferencesByQuestionTagId(Collection<ReferenceEntity> referencesByQuestionTagId) {
        this.referencesByQuestionTagId = referencesByQuestionTagId;
    }
}
