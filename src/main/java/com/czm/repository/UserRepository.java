package com.czm.repository;

import com.czm.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface UserRepository extends JpaRepository<UserEntity,Integer> {
    /*更新用户基本信息*/
    @Modifying
    @Transactional
    @Query("update UserEntity user set user.sex=:sex,user.age=:age,user.year=:year,user.month=:month,user.day=:day," +
            "user.major=:major,user.semester=:semester,user.signature=:signature,user.province=:province," +
            "user.city=:city,user.area=:area,user.school=:school,user.phone=:phone where user.userId=:userId")
    Integer UpdateBasicInfo(@Param("sex") String sex, @Param("age") Integer age, @Param("year") String year,
                         @Param("month") String month, @Param("day") String day, @Param("major") String major,
                         @Param("semester") String semester, @Param("signature") String signature,
                         @Param("province") String province, @Param("city") String city, @Param("area") String area,
                         @Param("school") String school, @Param("phone")long phone,@Param("userId") int userId);
    /*更换用户密码*/
    @Modifying
    @Transactional
    @Query("update UserEntity user set user.password=:password where user.userId=:userId")
    Integer UpdatePassword(@Param("password") String password,@Param("userId") Integer userId);
    /*更新用户头像*/
    @Modifying
    @Transactional
    @Query("update UserEntity user set user.photo=:photo where user.userId=:userId")
    Integer UpdatePic(@Param("photo") String photo,@Param("userId") Integer userId);
}
