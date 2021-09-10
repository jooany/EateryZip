package com.sixnicorn.eateryzip.user.dto;

public class TakeoutDto {
   private int takeout_num;
   private String g_id;
   private String b_id;
   private String takeout_name;
   private String takeout_date;
   private String takeout_time;
   private String takeout_phone;
   private String takeout_memo;
   private int takeout_price;
   private int takeout_menu_num;
   private int take_menu_num;
   private int menu_num;
   private int menu_count;
   private String menu_name;
   private String b_name;
   private String b_Store_Address;
   
   // 혜림 --------------------------------
   private int startRowNum;
   private int endRowNum;
   private int prevNum;
   private int nextNum;
   private int did_it;
   
   public TakeoutDto() {}

   public TakeoutDto(int takeout_num, String g_id, String b_id, String takeout_name, String takeout_date,
         String takeout_time, String takeout_phone, String takeout_memo, int takeout_price, int takeout_menu_num,
         int take_menu_num, int menu_num, int menu_count, String menu_name, String b_name, int startRowNum,
         int endRowNum, int prevNum, int nextNum, int did_it) {
      super();
      this.takeout_num = takeout_num;
      this.g_id = g_id;
      this.b_id = b_id;
      this.takeout_name = takeout_name;
      this.takeout_date = takeout_date;
      this.takeout_time = takeout_time;
      this.takeout_phone = takeout_phone;
      this.takeout_memo = takeout_memo;
      this.takeout_price = takeout_price;
      this.takeout_menu_num = takeout_menu_num;
      this.take_menu_num = take_menu_num;
      this.menu_num = menu_num;
      this.menu_count = menu_count;
      this.menu_name = menu_name;
      this.b_name = b_name;
      this.startRowNum = startRowNum;
      this.endRowNum = endRowNum;
      this.prevNum = prevNum;
      this.nextNum = nextNum;
      this.did_it = did_it;
   }

   public int getTakeout_num() {
      return takeout_num;
   }

   public void setTakeout_num(int takeout_num) {
      this.takeout_num = takeout_num;
   }

   public String getG_id() {
      return g_id;
   }

   public void setG_id(String g_id) {
      this.g_id = g_id;
   }

   public String getB_id() {
      return b_id;
   }

   public void setB_id(String b_id) {
      this.b_id = b_id;
   }

   public String getTakeout_name() {
      return takeout_name;
   }

   public void setTakeout_name(String takeout_name) {
      this.takeout_name = takeout_name;
   }

   public String getTakeout_date() {
      return takeout_date;
   }

   public void setTakeout_date(String takeout_date) {
      this.takeout_date = takeout_date;
   }

   public String getTakeout_time() {
      return takeout_time;
   }

   public void setTakeout_time(String takeout_time) {
      this.takeout_time = takeout_time;
   }

   public String getTakeout_phone() {
      return takeout_phone;
   }

   public void setTakeout_phone(String takeout_phone) {
      this.takeout_phone = takeout_phone;
   }

   public String getTakeout_memo() {
      return takeout_memo;
   }

   public void setTakeout_memo(String takeout_memo) {
      this.takeout_memo = takeout_memo;
   }

   public int getTakeout_price() {
      return takeout_price;
   }

   public void setTakeout_price(int takeout_price) {
      this.takeout_price = takeout_price;
   }

   public int getTakeout_menu_num() {
      return takeout_menu_num;
   }

   public void setTakeout_menu_num(int takeout_menu_num) {
      this.takeout_menu_num = takeout_menu_num;
   }

   public int getTake_menu_num() {
      return take_menu_num;
   }

   public void setTake_menu_num(int take_menu_num) {
      this.take_menu_num = take_menu_num;
   }

   public int getMenu_num() {
      return menu_num;
   }

   public void setMenu_num(int menu_num) {
      this.menu_num = menu_num;
   }

   public int getMenu_count() {
      return menu_count;
   }

   public void setMenu_count(int menu_count) {
      this.menu_count = menu_count;
   }

   public String getMenu_name() {
      return menu_name;
   }

   public void setMenu_name(String menu_name) {
      this.menu_name = menu_name;
   }

   public String getB_name() {
      return b_name;
   }

   public void setB_name(String b_name) {
      this.b_name = b_name;
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

   public int getDid_it() {
      return did_it;
   }

   public void setDid_it(int did_it) {
      this.did_it = did_it;
   }

   

}