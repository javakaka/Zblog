package com.zblog.core.util;

import java.util.Collection;

public final class StringUtils{

	private static String _$1 = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz";
	
  private StringUtils(){
  }

  public static boolean isBlank(String str){
    return str == null || str.trim().length() == 0;
  }

  public static String join(Collection<String> collect, String delimiter){
    StringBuilder result = new StringBuilder();
    for(String temp : collect){
      result.append(temp).append(delimiter);
    }

    if(!collect.isEmpty())
      result.delete(result.length() - delimiter.length(), result.length());

    return result.toString();
  }

  public static String trimLeft(String source){
    if(isBlank(source))
      return null;

    int index = 0;
    for(; index < source.length(); index++){
      if(source.charAt(index) > 32)
        break;
    }

    return source.substring(index);
  }

  public static String trimRight(String source){
    if(isBlank(source))
      return null;

    int index = source.length() - 1;
    for(; index >= 0; index--){
      if(source.charAt(index) > 32)
        break;
    }

    return source.substring(0, index + 1);
  }

  public static String emptyDefault(String ifEmpty, String defaults){
    return isBlank(ifEmpty) ? defaults : ifEmpty;
  }
  
  public static String getRandKeys(int paramInt)
  {
    String str = "";
    int i = _$1.length();
    int j = 1;
    do
    {
      str = "";
      int k = 0;
      for (int m = 0; m < paramInt; m++)
      {
        double d = Math.random() * i;
        int n = (int)Math.floor(d);
        int i1;
        if (((
          i1 = _$1.charAt(n)) >= 
          '0') && (i1 <= 57))
        {
          k++;
        }
        str = str + _$1.charAt(n);
      }
      if (k >= 2)
        j = 0;
    }
    while (j != 0);

    return str;
  }

}
