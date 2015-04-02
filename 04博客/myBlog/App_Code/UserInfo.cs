using System;
using System.Data;
using System.Configuration;
using System.Data.OleDb;
/// <summary>
/// 实现用户注册与登陆
/// </summary>
public class UserInfo
{
    public string user_name;
    public string password;
    public string true_name;
    public string address;
    public string mail;
    public string password_question;
    public string password_answer;
    public string  user_sex ;
	public string UserName
	{
	 get
        {
            return user_name; 
        }
     set
        {
            user_name =value;
        }
	}
    public string Password
    {
        get
        {
            return password;
        }
        set
        {
            password = value;
        }

    }
    public string True_name
    {
        get
        {
            return true_name;
        }
        set
        {
            true_name = value;
        }
    }
    public string Address
    {
        get
        {
            return address;
        }
        set
        {
            address = value;
        }
    }
    public string Mail
    {
        get
        {
            return mail;
        }
        set
        {
            mail = value;
        }
    }
    public string Password_answer
    {
        get
        {
            return password_answer;
        }
        set
        {
            password_answer = value;
        }

    }
    public string  User_sex
    {
        get
        {
            return user_sex;
        }
        set
        {
            user_sex = value;
        }
    }
  
}
