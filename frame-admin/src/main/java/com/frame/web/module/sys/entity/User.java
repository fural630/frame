//package com.frame.web.module.sys.entity;
//
//import com.baomidou.mybatisplus.annotation.TableName;
//import java.util.Date;
//import java.io.Serializable;
//
///**
// * <p>
// * 
// * </p>
// *
// * @author zhangzm
// * @since 2018-11-23
// */
//@TableName("sys_user")
//public class User implements Serializable {
//
//    private static final long serialVersionUID = 1L;
//
//    private String name;
//
//    private Date birthDay;
//
//    private String passWord;
//
//    /**
//     * 1-男、0-女、其他-未知
//     */
//    private Integer sex;
//
//    private String email;
//
//    /**
//     * 手机号
//     */
//    private String phone;
//
//    /**
//     * 身份证
//     */
//    private String idCard;
//
//    /**
//     * 头像图片ID
//     */
//    private Long avatarId;
//
//    /**
//     * 部门编号ID
//     */
//    private Long departmentCid;
//
//    /**
//     * 账号
//     */
//    private String account;
//
//    /**
//     * 状态：1-正常，0-删除
//     */
//    private Integer status;
//
//    private Date createTime;
//
//    private Date updateTime;
//
//    private Long createUserId;
//
//    private Long updateUserId;
//
//    public String getName() {
//        return name;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }
//    public Date getBirthDay() {
//        return birthDay;
//    }
//
//    public void setBirthDay(Date birthDay) {
//        this.birthDay = birthDay;
//    }
//    public String getPassWord() {
//        return passWord;
//    }
//
//    public void setPassWord(String passWord) {
//        this.passWord = passWord;
//    }
//    public Integer getSex() {
//        return sex;
//    }
//
//    public void setSex(Integer sex) {
//        this.sex = sex;
//    }
//    public String getEmail() {
//        return email;
//    }
//
//    public void setEmail(String email) {
//        this.email = email;
//    }
//    public String getPhone() {
//        return phone;
//    }
//
//    public void setPhone(String phone) {
//        this.phone = phone;
//    }
//    public String getIdCard() {
//        return idCard;
//    }
//
//    public void setIdCard(String idCard) {
//        this.idCard = idCard;
//    }
//    public Long getAvatarId() {
//        return avatarId;
//    }
//
//    public void setAvatarId(Long avatarId) {
//        this.avatarId = avatarId;
//    }
//    public Long getDepartmentCid() {
//        return departmentCid;
//    }
//
//    public void setDepartmentCid(Long departmentCid) {
//        this.departmentCid = departmentCid;
//    }
//    public String getAccount() {
//        return account;
//    }
//
//    public void setAccount(String account) {
//        this.account = account;
//    }
//    public Integer getStatus() {
//        return status;
//    }
//
//    public void setStatus(Integer status) {
//        this.status = status;
//    }
//    public Date getCreateTime() {
//        return createTime;
//    }
//
//    public void setCreateTime(Date createTime) {
//        this.createTime = createTime;
//    }
//    public Date getUpdateTime() {
//        return updateTime;
//    }
//
//    public void setUpdateTime(Date updateTime) {
//        this.updateTime = updateTime;
//    }
//    public Long getCreateUserId() {
//        return createUserId;
//    }
//
//    public void setCreateUserId(Long createUserId) {
//        this.createUserId = createUserId;
//    }
//    public Long getUpdateUserId() {
//        return updateUserId;
//    }
//
//    public void setUpdateUserId(Long updateUserId) {
//        this.updateUserId = updateUserId;
//    }
//
//    @Override
//    public String toString() {
//        return "User{" +
//        "name=" + name +
//        ", birthDay=" + birthDay +
//        ", passWord=" + passWord +
//        ", sex=" + sex +
//        ", email=" + email +
//        ", phone=" + phone +
//        ", idCard=" + idCard +
//        ", avatarId=" + avatarId +
//        ", departmentCid=" + departmentCid +
//        ", account=" + account +
//        ", status=" + status +
//        ", createTime=" + createTime +
//        ", updateTime=" + updateTime +
//        ", createUserId=" + createUserId +
//        ", updateUserId=" + updateUserId +
//        "}";
//    }
//}
