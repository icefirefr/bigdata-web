package com.bigdat.query.web.util;

import java.io.IOException;
import java.io.StringWriter;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;


public class JsonUtil {

   private String defaultDateFormat = "yyyy-MM-dd hh:mm:ss";
   private ObjectMapper objectMapper = new ObjectMapper();
   public JsonUtil() {
       objectMapper.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);
   }

   /**
    * 传入一个Map对象，将其转为Json格式字符串。
    * @param map
    *      如果输入为null，则返回为null，
    *      如果输入为空Map，则返回一对花括号，即“{}”
    * @return
    *      Json格式的字符串
    */
   public String fromMap(Map<? extends Object, ? extends Object> map) {
       if(null == map) {
           return null;
       }
       StringWriter sw = new StringWriter();
       try {
           objectMapper.writeValue(sw, map);
       } catch (IOException e) {
           return null;
       }
       return sw.toString();
   }


   public <T> T from(String jsonString, Class<T> clazz) {
       try {
       	if(StringUtils.isBlank(jsonString))return null;
           return objectMapper.readValue(jsonString, clazz);
       } catch (IOException e) {
           e.printStackTrace();
       }
       return null;
   }

   public <T> String toJson(T obj) {
       try {
           return objectMapper.writeValueAsString(obj);
       } catch (JsonProcessingException e) {
           return null;
       }
   }
}
