package com.sixnicorn.eateryzip.user.dto;

import org.springframework.web.multipart.MultipartFile;

public class BStoreDto {

   // 필드
   private String b_id;
   private String b_name;
   private String b_Store_Address;
   private String b_kind;
   private String intro;
   // 파일 시스템에 저장된 파일명
   private String b_img_f;
   private String b_Store_phone;
   private String b_Store_date;
   private String b_open;
   private String b_close;
   private String b_holiday;
   private String notice;
   private String service;
   private String ex_keyword;
   private String checkKeyword;
   // 파일 업로드 처리를 하기위한 필드
   private MultipartFile storeFile;
   
   private int startRowNum;
   private int endRowNum;
   private int prevNum;
   private int nextNum;
   private String encodedK;
   private String keyword;
   private double lattitude;
   private double longitude;
   
   private int r1;
   private int r2;
   private int r3;
   private int r4;
   private int r5;
   private int r6;
   private int r7;
   private int r8;
   private int r9;
   private int r10;
   private int r11;
   private int sCount;
   private int isScrap;
   
   //스크랩하기위하여 필요함
   private String g_id;
   
   
   // 디폴트 생성자
   public BStoreDto() {}


   public BStoreDto(String b_id, String b_name, String b_Store_Address, String b_kind, String intro, String b_img_f,
         String b_Store_phone, String b_Store_date, String b_open, String b_close, String b_holiday, String notice,
         String service, String ex_keyword, String checkKeyword, MultipartFile storeFile, int startRowNum,
         int endRowNum, int prevNum, int nextNum, String encodedK, String keyword,double lattitude,
         double longitude, int r1, int r2, int r3, int r4,
         int r5, int r6, int r7, int r8, int r9, int r10, int r11, int sCount, int isScrap, String g_id) {

      super();
      this.b_id = b_id;
      this.b_name = b_name;
      this.b_Store_Address = b_Store_Address;
      this.b_kind = b_kind;
      this.intro = intro;
      this.b_img_f = b_img_f;
      this.b_Store_phone = b_Store_phone;
      this.b_Store_date = b_Store_date;
      this.b_open = b_open;
      this.b_close = b_close;
      this.b_holiday = b_holiday;
      this.notice = notice;
      this.service = service;
      this.ex_keyword = ex_keyword;
      this.checkKeyword = checkKeyword;
      this.storeFile = storeFile;
      this.startRowNum = startRowNum;
      this.endRowNum = endRowNum;
      this.prevNum = prevNum;
      this.nextNum = nextNum;
      this.encodedK = encodedK;
      this.keyword = keyword;
      this.lattitude = lattitude;
      this.longitude = longitude;

      this.r1 = r1;
      this.r2 = r2;
      this.r3 = r3;
      this.r4 = r4;
      this.r5 = r5;
      this.r6 = r6;
      this.r7 = r7;
      this.r8 = r8;
      this.r9 = r9;
      this.r10 = r10;
      this.r11 = r11;
      this.sCount = sCount;
      this.isScrap = isScrap;
      this.g_id = g_id;

   }


   public String getB_id() {
      return b_id;
   }


   public void setB_id(String b_id) {
      this.b_id = b_id;
   }


   public String getB_name() {
      return b_name;
   }


   public void setB_name(String b_name) {
      this.b_name = b_name;
   }


   public String getB_Store_Address() {
      return b_Store_Address;
   }


   public void setB_Store_Address(String b_Store_Address) {
      this.b_Store_Address = b_Store_Address;
   }


   public String getB_kind() {
      return b_kind;
   }


   public void setB_kind(String b_kind) {
      this.b_kind = b_kind;
   }


   public String getIntro() {
      return intro;
   }


   public void setIntro(String intro) {
      this.intro = intro;
   }


   public String getB_img_f() {
      return b_img_f;
   }


   public void setB_img_f(String b_img_f) {
      this.b_img_f = b_img_f;
   }


   public String getB_Store_phone() {
      return b_Store_phone;
   }


   public void setB_Store_phone(String b_Store_phone) {
      this.b_Store_phone = b_Store_phone;
   }


   public String getB_Store_date() {
      return b_Store_date;
   }


   public void setB_Store_date(String b_Store_date) {
      this.b_Store_date = b_Store_date;
   }


   public String getB_open() {
      return b_open;
   }


   public void setB_open(String b_open) {
      this.b_open = b_open;
   }


   public String getB_close() {
      return b_close;
   }


   public void setB_close(String b_close) {
      this.b_close = b_close;
   }


   public String getB_holiday() {
      return b_holiday;
   }


   public void setB_holiday(String b_holiday) {
      this.b_holiday = b_holiday;
   }


   public String getNotice() {
      return notice;
   }


   public void setNotice(String notice) {
      this.notice = notice;
   }


   public String getService() {
      return service;
   }


   public void setService(String service) {
      this.service = service;
   }


   public String getEx_keyword() {
      return ex_keyword;
   }


   public void setEx_keyword(String ex_keyword) {
      this.ex_keyword = ex_keyword;
   }


   public String getCheckKeyword() {
      return checkKeyword;
   }


   public void setCheckKeyword(String checkKeyword) {
      this.checkKeyword = checkKeyword;
   }


   public MultipartFile getStoreFile() {
      return storeFile;
   }


   public void setStoreFile(MultipartFile storeFile) {
      this.storeFile = storeFile;
   }


   public int getStartRowNum() {
      return startRowNum;
   }


   public void setStartRowNum(int startRowNum) {
      this.startRowNum = startRowNum;
   }


   public int getEndRowNum() {
      return endRowNum;
   }


   public void setEndRowNum(int endRowNum) {
      this.endRowNum = endRowNum;
   }


   public int getPrevNum() {
      return prevNum;
   }


   public void setPrevNum(int prevNum) {
      this.prevNum = prevNum;
   }


   public int getNextNum() {
      return nextNum;
   }


   public void setNextNum(int nextNum) {
      this.nextNum = nextNum;
   }


   public String getEncodedK() {
      return encodedK;
   }


   public void setEncodedK(String encodedK) {
      this.encodedK = encodedK;
   }


   public String getKeyword() {
      return keyword;
   }


   public void setKeyword(String keyword) {
      this.keyword = keyword;
   }


   public double getLattitude() {
      return lattitude;
   }


   public void setLattitude(double lattitude) {
      this.lattitude = lattitude;
   }


   public double getLongitude() {
      return longitude;
   }


   public void setLongitude(double longitude) {
      this.longitude = longitude;
   }

   public int getR1() {
      return r1;
   }


   public void setR1(int r1) {
      this.r1 = r1;
   }


   public int getR2() {
      return r2;
   }


   public void setR2(int r2) {
      this.r2 = r2;
   }


   public int getR3() {
      return r3;
   }


   public void setR3(int r3) {
      this.r3 = r3;
   }


   public int getR4() {
      return r4;
   }


   public void setR4(int r4) {
      this.r4 = r4;
   }


   public int getR5() {
      return r5;
   }


   public void setR5(int r5) {
      this.r5 = r5;
   }


   public int getR6() {
      return r6;
   }


   public void setR6(int r6) {
      this.r6 = r6;
   }


   public int getR7() {
      return r7;
   }


   public void setR7(int r7) {
      this.r7 = r7;
   }


   public int getR8() {
      return r8;
   }


   public void setR8(int r8) {
      this.r8 = r8;
   }


   public int getR9() {
      return r9;
   }


   public void setR9(int r9) {
      this.r9 = r9;
   }


   public int getR10() {
      return r10;
   }


   public void setR10(int r10) {
      this.r10 = r10;
   }


   public int getR11() {
      return r11;
   }


   public void setR11(int r11) {
      this.r11 = r11;
   }


   public int getsCount() {
      return sCount;
   }


   public void setsCount(int sCount) {
      this.sCount = sCount;
   }


   public int getIsScrap() {
      return isScrap;
   }


   public void setIsScrap(int isScrap) {
      this.isScrap = isScrap;
   }


   public String getG_id() {
      return g_id;
   }


   public void setG_id(String g_id) {
      this.g_id = g_id;
   }



}