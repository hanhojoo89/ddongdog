package com.example.domain;

public class VaccinationVO {
   private String inoculationName;
   private int price;
   private String code;
  
   public String getInoculationName() {
      return inoculationName;
   }
   public void setInoculationName(String inoculationName) {
      this.inoculationName = inoculationName;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   public String getCode() {
      return code;
   }
   public void setCode(String code) {
      this.code = code;
   }
   
   @Override
   public String toString() {
      return "VaccinationVO [inoculationName=" + inoculationName + ", price=" + price + ", code=" + code + "]";
   }
}