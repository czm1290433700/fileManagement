package com.czm.model;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "user", schema = "filemanager", catalog = "")
public class UserEntity {
    private int userId;
    private String username;
    private long phone;
    private String major;
    private String school;
    private Integer age;
    private String password;
    private Integer expIndex;
    private String semester;
    private String signature;
    private String photo;
    private String sex;
    private String province;
    private String city;
    private String area;
    private String year;
    private String month;
    private String day;
    private Integer courseNum;
    private Integer messageNum;
    private Integer followNum;
    private Collection<AnswerEntity> answersByUserId;
    private Collection<CommentEntity> commentsByUserId;
    private Collection<CourseEntity> coursesByUserId;
    private Collection<EventEntity> eventsByUserId;
    private Collection<FolderEntity> foldersByUserId;
    private Collection<FollowEntity> followsByUserId;
    private Collection<FollowEntity> followsByUserId_0;
    private Collection<MessageEntity> messagesByUserId;
    private Collection<MessageEntity> messagesByUserId_0;
    private Collection<NoteEntity> notesByUserId;
    private Collection<NotificationEntity> notificationsByUserId;
    private Collection<QuestionEntity> questionsByUserId;
    private Collection<FileEntity> filesByUserId;

    @Id
    @Column(name = "userId")
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "phone")
    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "major")
    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    @Basic
    @Column(name = "school")
    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    @Basic
    @Column(name = "age")
    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "expIndex")
    public Integer getExpIndex() {
        return expIndex;
    }

    public void setExpIndex(Integer expIndex) {
        this.expIndex = expIndex;
    }

    @Basic
    @Column(name = "semester")
    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    @Basic
    @Column(name = "signature")
    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    @Basic
    @Column(name = "photo")
    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Basic
    @Column(name = "sex")
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Basic
    @Column(name = "province")
    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    @Basic
    @Column(name = "city")
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Basic
    @Column(name = "area")
    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    @Basic
    @Column(name = "year")
    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    @Basic
    @Column(name = "month")
    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    @Basic
    @Column(name = "day")
    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    @Basic
    @Column(name = "courseNum")
    public Integer getCourseNum() {
        return courseNum;
    }

    public void setCourseNum(Integer courseNum) {
        this.courseNum = courseNum;
    }

    @Basic
    @Column(name = "messageNum")
    public Integer getMessageNum() {
        return messageNum;
    }

    public void setMessageNum(Integer messageNum) {
        this.messageNum = messageNum;
    }

    @Basic
    @Column(name = "followNum")
    public Integer getFollowNum() {
        return followNum;
    }

    public void setFollowNum(Integer followNum) {
        this.followNum = followNum;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserEntity that = (UserEntity) o;
        return userId == that.userId &&
                phone == that.phone &&
                Objects.equals(username, that.username) &&
                Objects.equals(major, that.major) &&
                Objects.equals(school, that.school) &&
                Objects.equals(age, that.age) &&
                Objects.equals(password, that.password) &&
                Objects.equals(expIndex, that.expIndex) &&
                Objects.equals(semester, that.semester) &&
                Objects.equals(signature, that.signature) &&
                Objects.equals(photo, that.photo) &&
                Objects.equals(sex, that.sex) &&
                Objects.equals(province, that.province) &&
                Objects.equals(city, that.city) &&
                Objects.equals(area, that.area) &&
                Objects.equals(year, that.year) &&
                Objects.equals(month, that.month) &&
                Objects.equals(day, that.day)&&
                Objects.equals(courseNum, that.courseNum) &&
                Objects.equals(messageNum, that.messageNum) &&
                Objects.equals(followNum, that.followNum);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, username, phone, major, school, age, password, expIndex, semester, signature, photo, sex, province, city, area, year, month, day,courseNum, messageNum, followNum);
    }

    @OneToMany(mappedBy = "userByAnswerManId")
    public Collection<AnswerEntity> getAnswersByUserId() {
        return answersByUserId;
    }

    public void setAnswersByUserId(Collection<AnswerEntity> answersByUserId) {
        this.answersByUserId = answersByUserId;
    }

    @OneToMany(mappedBy = "userBySenderId")
    public Collection<CommentEntity> getCommentsByUserId() {
        return commentsByUserId;
    }

    public void setCommentsByUserId(Collection<CommentEntity> commentsByUserId) {
        this.commentsByUserId = commentsByUserId;
    }

    @OneToMany(mappedBy = "userByUserId",fetch=FetchType.EAGER)
    public Collection<CourseEntity> getCoursesByUserId() {
        return coursesByUserId;
    }

    public void setCoursesByUserId(Collection<CourseEntity> coursesByUserId) {
        this.coursesByUserId = coursesByUserId;
    }

    @OneToMany(mappedBy = "userByUserId")
    public Collection<EventEntity> getEventsByUserId() {
        return eventsByUserId;
    }

    public void setEventsByUserId(Collection<EventEntity> eventsByUserId) {
        this.eventsByUserId = eventsByUserId;
    }

    @OneToMany(mappedBy = "userByUserId")
    public Collection<FolderEntity> getFoldersByUserId() {
        return foldersByUserId;
    }

    public void setFoldersByUserId(Collection<FolderEntity> foldersByUserId) {
        this.foldersByUserId = foldersByUserId;
    }

    @OneToMany(mappedBy = "userByFollowerId")
    public Collection<FollowEntity> getFollowsByUserId() {
        return followsByUserId;
    }

    public void setFollowsByUserId(Collection<FollowEntity> followsByUserId) {
        this.followsByUserId = followsByUserId;
    }

    @OneToMany(mappedBy = "userByFolloweeId")
    public Collection<FollowEntity> getFollowsByUserId_0() {
        return followsByUserId_0;
    }

    public void setFollowsByUserId_0(Collection<FollowEntity> followsByUserId_0) {
        this.followsByUserId_0 = followsByUserId_0;
    }

    @OneToMany(mappedBy = "userBySenderId")
    public Collection<MessageEntity> getMessagesByUserId() {
        return messagesByUserId;
    }

    public void setMessagesByUserId(Collection<MessageEntity> messagesByUserId) {
        this.messagesByUserId = messagesByUserId;
    }

    @OneToMany(mappedBy = "userByTargetId")
    public Collection<MessageEntity> getMessagesByUserId_0() {
        return messagesByUserId_0;
    }

    public void setMessagesByUserId_0(Collection<MessageEntity> messagesByUserId_0) {
        this.messagesByUserId_0 = messagesByUserId_0;
    }

    @OneToMany(mappedBy = "userByUserId")
    public Collection<NoteEntity> getNotesByUserId() {
        return notesByUserId;
    }

    public void setNotesByUserId(Collection<NoteEntity> notesByUserId) {
        this.notesByUserId = notesByUserId;
    }

    @OneToMany(mappedBy = "userByTargetId")
    public Collection<NotificationEntity> getNotificationsByUserId() {
        return notificationsByUserId;
    }

    public void setNotificationsByUserId(Collection<NotificationEntity> notificationsByUserId) {
        this.notificationsByUserId = notificationsByUserId;
    }

    @OneToMany(mappedBy = "userByAskerId")
    public Collection<QuestionEntity> getQuestionsByUserId() {
        return questionsByUserId;
    }

    public void setQuestionsByUserId(Collection<QuestionEntity> questionsByUserId) {
        this.questionsByUserId = questionsByUserId;
    }

    @OneToMany(mappedBy = "userByUserId")
    public Collection<FileEntity> getFilesByUserId() {
        return filesByUserId;
    }

    public void setFilesByUserId(Collection<FileEntity> filesByUserId) {
        this.filesByUserId = filesByUserId;
    }
}
