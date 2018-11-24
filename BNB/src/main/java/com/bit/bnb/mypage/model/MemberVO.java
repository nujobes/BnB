package com.bit.bnb.mypage.model;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {

	private String userId; // 유저아이디
	private String userName; // 유저이름
	private String userPw; // 유저비밀번호
	private String userPhoto; // DB에 저장될 사진 이름
	private MultipartFile photoFile; // 실제파일
	private int host; // 호스트여부
	private int admin; // 관리자 여부
	private int userCheck; // 본인확인여부
	private int point; // 정산금액
	private String birth; // 생일
	private String userInfo; // 자기소개
	private String userKey; // 유저키

	public String getUserId() {
		return userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserPhoto() {
		return userPhoto;
	}

	public int getHost() {
		return host;
	}

	public int getAdmin() {
		return admin;
	}

	public int getUserCheck() {
		return userCheck;
	}

	public int getPoint() {
		return point;
	}

	public String getBirth() {
		return birth;
	}

	public String getUserInfo() {
		return userInfo;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	public MultipartFile getPhotoFile() {
		return photoFile;
	}

	public void setPhotoFile(MultipartFile photoFile) {
		this.photoFile = photoFile;
	}

	public void setHost(int host) {
		this.host = host;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public void setUserCheck(int userCheck) {
		this.userCheck = userCheck;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public void setUserInfo(String userInfo) {
		this.userInfo = userInfo;
	}

	public String getUserKey() {
		return userKey;
	}

	public void setUserKey(String userKey) {
		this.userKey = userKey;
	}

	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userName=" + userName + ", userPw=" + userPw + ", userPhoto="
				+ userPhoto + ", photoFile=" + photoFile + ", host=" + host + ", admin=" + admin + ", userCheck="
				+ userCheck + ", point=" + point + ", birth=" + birth + ", userInfo=" + userInfo + ", userKey="
				+ userKey + "]";
	}

}
