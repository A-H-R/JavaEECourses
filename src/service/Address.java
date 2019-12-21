package service;

import bean.Addresslist;

import java.util.List;

public interface Address {
    public void add(Addresslist al);
    public List<Addresslist> query_all();
    public boolean login(String name,String phone);
}
