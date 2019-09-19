package com.jb.pension.model.vo;

public class Room {
   
   private String pCode;
   private String rNo;
   private String rName;
   private int rPrice;
   private int rAddPrice;
   private int rNop;
   private int rMaxNop;
   private String rSize;
   private String rStruc;
   private String rInfo;
   
   public Room() {
      // TODO Auto-generated constructor stub
   }

   public Room(String pCode, String rNo, String rName, int rPrice, int rAddPrice, int rNop, int rMaxNop, String rSize,
         String rStruc, String rInfo) {
      super();
      this.pCode = pCode;
      this.rNo = rNo;
      this.rName = rName;
      this.rPrice = rPrice;
      this.rAddPrice = rAddPrice;
      this.rNop = rNop;
      this.rMaxNop = rMaxNop;
      this.rSize = rSize;
      this.rStruc = rStruc;
      this.rInfo = rInfo;
   }

   public String getrNo() {
      return rNo;
   }

   public void setrNo(String rNo) {
      this.rNo = rNo;
   }

   public String getpCode() {
      return pCode;
   }

   public void setpCode(String pCode) {
      this.pCode = pCode;
   }

   public String getrName() {
      return rName;
   }

   public void setrName(String rName) {
      this.rName = rName;
   }

   public int getrPrice() {
      return rPrice;
   }

   public void setrPrice(int rPrice) {
      this.rPrice = rPrice;
   }

   public int getrNop() {
      return rNop;
   }

   public void setrNop(int rNop) {
      this.rNop = rNop;
   }

   public String getrSize() {
      return rSize;
   }

   public void setrSize(String rSize) {
      this.rSize = rSize;
   }

   public int getrMaxNop() {
      return rMaxNop;
   }

   public void setrMaxNop(int rMaxNop) {
      this.rMaxNop = rMaxNop;
   }

   public String getrStruc() {
      return rStruc;
   }

   public void setrStruc(String rStruc) {
      this.rStruc = rStruc;
   }

   public String getrInfo() {
      return rInfo;
   }

   public void setrInfo(String rInfo) {
      this.rInfo = rInfo;
   }

   public int getrAddPrice() {
      return rAddPrice;
   }

   public void setrAddPrice(int rAddPrice) {
      this.rAddPrice = rAddPrice;
   }

   @Override
   public String toString() {
      return "Room [pCode=" + pCode + ", rNo=" + rNo + ", rName=" + rName + ", rPrice=" + rPrice + ", rAddPrice="
            + rAddPrice + ", rNop=" + rNop + ", rMaxNop=" + rMaxNop + ", rSize=" + rSize + ", rStruc=" + rStruc
            + ", rInfo=" + rInfo + "]";
   }

}